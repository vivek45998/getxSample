import 'dart:io';
import 'dart:typed_data';
import 'package:intl/intl.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:getx_demo_project/UI/open_pdf.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:async';
import 'package:http/http.dart' show get;
import 'package:path_provider/path_provider.dart';

//import 'save_file_mobile.dart' if (dart.library.html) 'save_file_web.dart';
//import 'package:open_file/open_file.dart';

class PdfPage extends StatefulWidget {
  @override
  _PdfPageState createState() {
    return _PdfPageState();
  }
}

class _PdfPageState extends State<PdfPage> {
  var screenHieght, screenWidth;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    screenWidth = size.width;
    screenHieght = size.height;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Pdf_Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextButton(
              child: const Text('Generate PDF'),
              style: TextButton.styleFrom(
                primary: Colors.white,
                backgroundColor: Colors.lightBlue,
                onSurface: Colors.grey,
              ),
              onPressed: genratePdf,
            )
          ],
        ),
      ),
    );
  }

  Future<void> genratePdf() async {
    final PdfDocument document = PdfDocument();

    final page = document.pages.add();
    final Size pageSize = page.getClientSize();
    var url =
        "https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885_1280.jpg";
    var response = await get(Uri.parse(url));
    var data = response.bodyBytes;
    PdfBezierCurve bezier = PdfBezierCurve(const Offset(200, 100),
        const Offset(150, 100), const Offset(200, 100), const Offset(100, 10));

    PdfBitmap image = PdfBitmap(data);

    final PdfGrid grid = getGrid();
    final PdfLayoutResult result =
        await drawHeader(page, pageSize, grid, image, bezier);
    drawGrid(page, grid, result);

    drawFooter(page, pageSize);
    //document.pages.add();
    List<int> bytes = document.save();

    //OpenFile.open('$path/HelloWorld.pdf');
    document.dispose();
    saveAndLunchFile(bytes, 'HelloWorld.pdf');
  }

  Future<PdfLayoutResult> drawHeader(
      page, Size pageSize, PdfGrid grid, image, PdfBezierCurve bezier) async {
    page.graphics.drawString(
        'Inovoice #INV671', PdfStandardFont(PdfFontFamily.helvetica, 24),
        brush: PdfBrushes.black,
        bounds:
            Rect.fromLTWH(90, 0, pageSize.width - 150, pageSize.height * 0.04),
        format: PdfStringFormat(
            alignment: PdfTextAlignment.center,
            lineAlignment: PdfVerticalAlignment.bottom));
    page.graphics.drawRectangle(
        brush: PdfSolidBrush(PdfColor(91, 126, 215, 255)),
        bounds: Rect.fromLTWH(0, 60, pageSize.width * 0.2, 90));

    bezier.draw(
        page: page.graphics.drawImage(
          image,
          Rect.fromLTWH(5, 65, pageSize.width * 0.2 - 10, 80),
        ),
        bounds: const Rect.fromLTWH(200, 100, 0, 0));

    page.graphics.drawString(
        'Vivek Kumar', PdfStandardFont(PdfFontFamily.helvetica, 24),
        brush: PdfBrushes.black,
        bounds:
            Rect.fromLTWH(80, 70, pageSize.width - 300, pageSize.height * 0.04),
        format: PdfStringFormat(
            alignment: PdfTextAlignment.center,
            lineAlignment: PdfVerticalAlignment.bottom));

    const String address =
        'Vivek Kumar has paid \$500 for booking of Pickleball';

    return PdfTextElement(
            text: address, font: PdfStandardFont(PdfFontFamily.helvetica, 24))
        .draw(
            page: page,
            bounds:
                Rect.fromLTWH(0, 170, pageSize.width, pageSize.height - 120))!;
  }

  void drawGrid(page, grid, result) {
    Rect? totalPriceCellBounds;
    Rect? quantityCellBounds;
    //Invoke the beginCellLayout event.
    grid.beginCellLayout = (Object sender, PdfGridBeginCellLayoutArgs args) {
      final PdfGrid grid = sender as PdfGrid;
      if (args.cellIndex == grid.columns.count - 1) {
        totalPriceCellBounds = args.bounds;
      } else if (args.cellIndex == grid.columns.count - 2) {
        quantityCellBounds = args.bounds;
      }
    };
    //Draw the PDF grid and get the result.
    result = grid.draw(
        page: page, bounds: Rect.fromLTWH(0, result.bounds.bottom + 50, 0, 0))!;

    //Draw grand total.
    page.graphics.drawString('Grand Total',
        PdfStandardFont(PdfFontFamily.helvetica, 18, style: PdfFontStyle.bold),
        bounds: Rect.fromLTWH(385, result.bounds.bottom + 5,
            quantityCellBounds!.width + 10, quantityCellBounds!.height));
    page.graphics.drawString(getTotalAmount(grid).toString(),
        PdfStandardFont(PdfFontFamily.helvetica, 18, style: PdfFontStyle.bold),
        bounds: Rect.fromLTWH(490, result.bounds.bottom + 5,
            totalPriceCellBounds!.width, totalPriceCellBounds!.height));
  }

  void drawFooter(page, Size pageSize) {
    final PdfPen linePen =
        PdfPen(PdfColor(142, 170, 219, 255), dashStyle: PdfDashStyle.custom);
    linePen.dashPattern = <double>[3, 3];

    //Draw line
    page.graphics.drawLine(linePen, Offset(0, pageSize.height - 100),
        Offset(pageSize.width, pageSize.height - 100));

    const String footerContent =
        // ignore: leading_newlines_in_multiline_strings
        '''Thank You\r\n\r\nTeam Play With Pro
         ''';

    //Added 30 as a margin for the layout
    page.graphics.drawString(
        footerContent, PdfStandardFont(PdfFontFamily.helvetica, 18),
        format: PdfStringFormat(alignment: PdfTextAlignment.right),
        bounds: Rect.fromLTWH(pageSize.width - 20, pageSize.height - 60, 0, 0));
  }

  PdfGrid getGrid() {
    //Create a PDF grid
    final PdfGrid grid = PdfGrid();
    //Secify the columns count to the grid.
    grid.columns.add(count: 5);
    //Create the header row of the grid.
    final PdfGridRow headerRow = grid.headers.add(1)[0];
    grid.style =
        PdfGridStyle(font: PdfStandardFont(PdfFontFamily.helvetica, 18));
    //Set style
    headerRow.style.backgroundBrush = PdfSolidBrush(PdfColor(68, 114, 196));
    headerRow.style.textBrush = PdfBrushes.white;
    headerRow.cells[0].value = 'Game';
    headerRow.cells[0].stringFormat.alignment = PdfTextAlignment.center;
    headerRow.cells[1].value = 'Status';
    headerRow.cells[2].value = 'Hourly Rate';
    headerRow.cells[3].value = 'Hour';
    headerRow.cells[4].value = 'Total';
    //Add rows
    addProducts('Picleball', 'paid', 2, 30, 60, grid);

    //Apply the table built-in style
    grid.applyBuiltInStyle(PdfGridBuiltInStyle.listTable4Accent5);
    //Set gird columns width
    grid.columns[1].width = 90;
    for (int i = 0; i < headerRow.cells.count; i++) {
      headerRow.cells[i].style.cellPadding =
          PdfPaddings(bottom: 10, left: 10, right: 10, top: 10);
    }
    for (int i = 0; i < grid.rows.count; i++) {
      final PdfGridRow row = grid.rows[i];
      for (int j = 0; j < row.cells.count; j++) {
        final PdfGridCell cell = row.cells[j];
        if (j == 0) {
          cell.stringFormat.alignment = PdfTextAlignment.center;
        }
        cell.style.cellPadding =
            PdfPaddings(bottom: 10, left: 10, right: 10, top: 10);
      }
    }
    return grid;
  }

  void addProducts(String productId, String productName, double price,
      int quantity, double total, PdfGrid grid) {
    final PdfGridRow row = grid.rows.add();
    row.cells[0].value = productId;
    row.cells[1].value = productName;
    row.cells[2].value = price.toString();
    row.cells[3].value = quantity.toString();
    row.cells[4].value = total.toString();
  }

  //Get the total amount.
  double getTotalAmount(PdfGrid grid) {
    double total = 0;
    for (int i = 0; i < grid.rows.count; i++) {
      final String value =
          grid.rows[i].cells[grid.columns.count - 1].value as String;
      total += double.parse(value);
    }
    return total;
  }
}
