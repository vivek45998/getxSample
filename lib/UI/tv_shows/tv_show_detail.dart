import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_demo_project/Controller/tv_show_controller/fetch_tv_credits_data.dart';
import 'package:getx_demo_project/Utils/constant_string.dart';

class TvShowCreditDetails extends StatelessWidget {
  TvShowCreditDetails({
    Key? key,
    required this.id,
    required this.imagePAth,
    required this.imageBackdrop,
    required this.overview,
    required this.rating,
    required this.name,
  }) : super(key: key);

  final ctrlTvShowCredit = Get.put(TvShowCreditsDataApi());
  final id;
  final String imagePAth;
  final String imageBackdrop;
  final String overview;
  final dynamic rating;
  final String name;

  var size, screenHeight, screenWidth;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    screenWidth = size.width;
    screenHeight = size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: const Text(
          'Tv Show Detail',
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.bold, color: Colors.yellow),
        ),
      ),
      body: SizedBox(
        height: screenHeight,
        width: screenWidth,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: screenHeight * 0.32,
              width: screenWidth,
              child: Stack(
                children: [
                  if (imageBackdrop != null && imageBackdrop.isNotEmpty == true)
                    Image.network('${AppAssets.imagePath}$imageBackdrop',
                        color: const Color.fromRGBO(100, 49, 44, 0.8),
                        colorBlendMode: BlendMode.modulate)
                  else
                    Container(
                      color: const Color.fromRGBO(100, 49, 44,
                          0.8), /*colorBlendMode: BlendMode.modulate*/
                    ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: SizedBox(
                              width: screenWidth * 0.4,
                              height: screenHeight * 0.35,
                              child: Image.network(
                                  '${AppAssets.imagePath}$imagePAth')),
                        ),
                      ),
                      SizedBox(
                        height: screenHeight * 0.18,
                        width: screenWidth * 0.5,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: screenWidth,
                              child: Text(
                                name,
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 18),
                              ),
                            ),
                            SizedBox(
                              width: screenWidth,
                              child: Text(
                                '$rating',
                                style: const TextStyle(color: Colors.white),
                              ),
                            ),
                            const Text(
                              'Overview',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 18),
                            ),
                            SizedBox(
                              height: screenHeight * 0.06,
                              width: screenWidth,
                              child: SingleChildScrollView(
                                child: Text(
                                  overview,
                                  maxLines: 3,
                                  style: const TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            PopupMenuButton(
                child: const Text(
                  'Switch cast to crew',
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
                itemBuilder: (BuildContext context) {
                  return [
                    PopupMenuItem(
                        value: 1,
                        child: InkWell(
                          onTap: () {
                            ctrlTvShowCredit.castData.value = true;
                            Get.back();
                          },
                          child: Row(
                            children: const <Widget>[
                              Padding(
                                  padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
                                  child: Text(
                                    'Cast Detail',
                                    style: TextStyle(
                                        fontFamily: 'TrilliumWebRegular',
                                        fontWeight: FontWeight.bold),
                                  )),
                            ],
                          ),
                        )),
                    PopupMenuItem(
                        value: 2,
                        child: InkWell(
                          onTap: () {
                            ctrlTvShowCredit.castData.value = false;

                          },
                          child: Row(
                            children: const <Widget>[
                              Padding(
                                padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
                                child: Text(
                                  'Crew Detail',
                                  style: TextStyle(
                                      fontFamily: 'TrilliumWebRegular',
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                        )),
                  ];
                }),
            Obx(() {
              return ctrlTvShowCredit.dataCreditTvShow &&
                      ctrlTvShowCredit.castData.value == true
                  ? SizedBox(
                      height: screenHeight * 0.44,
                      width: screenWidth,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemBuilder: (_ctx, index) {
                          var result =
                              ctrlTvShowCredit.creditTvShowData.cast?[index];
                          return Card(
                            child: SizedBox(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  if (result?.profilePath != null &&
                                      result?.profilePath?.isNotEmpty == true)
                                    SizedBox(
                                        height: screenHeight * 0.3,
                                        // width: screenWidth*0.2,
                                        child: Center(
                                          child: Image.network(
                                              '${AppAssets.imagePath}${result?.profilePath ?? ''}'),
                                        ))
                                  else
                                    SizedBox(
                                      height: screenHeight * 0.3,
                                      // width: screenWidth,
                                      child: Center(
                                        child: Icon(
                                          Icons.person,
                                          size: screenHeight * 0.2,
                                        ),
                                      ),
                                    ),
                                  SizedBox(
                                    height: screenHeight * 0.02,
                                  ),
                                  SizedBox(
                                    width: screenWidth * 0.28,
                                    child: Text(
                                      result?.name ?? '',
                                      style: const TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14),
                                    ),
                                  ),
                                  SizedBox(
                                    height: screenHeight * 0.012,
                                  ),
                                  SizedBox(
                                    width: screenWidth * 0.28,
                                    child: Text(
                                      result?.character ?? '',
                                      style: const TextStyle(
                                          //color: Colors.black,
                                          // fontWeight: FontWeight.bold,
                                          fontSize: 14),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                        itemCount:
                            ctrlTvShowCredit.creditTvShowData.cast?.length,
                      ),
                    )
                  : SizedBox(
                      height: screenHeight * 0.44,
                      width: screenWidth,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemBuilder: (_ctx, index) {
                          var result =
                              ctrlTvShowCredit.creditTvShowData.crew?[index];
                          return Card(
                            child: SizedBox(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  if (result?.profilePath != null &&
                                      result?.profilePath?.isNotEmpty == true)
                                    SizedBox(
                                        height: screenHeight * 0.3,
                                        // width: screenWidth*0.2,
                                        child: Center(
                                          child: Image.network(
                                              '${AppAssets.imagePath}${result?.profilePath ?? ''}'),
                                        ))
                                  else
                                    SizedBox(
                                      height: screenHeight * 0.3,
                                      // width: screenWidth,
                                      child: Center(
                                        child: Icon(
                                          Icons.person,
                                          size: screenHeight * 0.2,
                                        ),
                                      ),
                                    ),
                                  SizedBox(
                                    height: screenHeight * 0.02,
                                  ),
                                  SizedBox(
                                    width: screenWidth * 0.28,
                                    child: Text(
                                      result?.name ?? '',
                                      style: const TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14),
                                    ),
                                  ),
                                  SizedBox(
                                    height: screenHeight * 0.012,
                                  ),
                                  SizedBox(
                                    width: screenWidth * 0.28,
                                    child: Text(
                                      result?.department ?? '',
                                      style: const TextStyle(
                                          //color: Colors.black,
                                          // fontWeight: FontWeight.bold,
                                          fontSize: 14),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                        itemCount:
                            ctrlTvShowCredit.creditTvShowData.crew?.length,
                      ),
                    );
            }),
          ],
        ),
      ),
    );
  }
}
