//Text(result?.title ?? "")
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:intl/intl.dart';

import 'package:getx_demo_project/Controller/movie_controller/movie_api.dart';

import 'package:getx_demo_project/Utils/constant_string.dart';

class TopRatedMovie extends StatelessWidget {
  final controller = Get.put(MovieApiController());
  var size, screenHeight, screenWidth;

  // get backdropPath => null;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    screenWidth = size.width;
    screenHeight = size.height;
    print('size=$size,height=$screenHeight,width=$screenWidth');
    return GetX<MovieApiController>(builder: (_ctrl) {
      return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'Top Rated Movie List',
            style: TextStyle(color: Colors.yellow),
          ),
          backgroundColor: Colors.black,
        ),
        body: controller.dataAvailable
            ? Column(
                children: [
                  SizedBox(
                    height: screenHeight * 0.4,
                    child: ListView.builder(
                      shrinkWrap: false,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (ctx, index) {
                        var result = controller.movie.results?[index];
                        return InkWell(
                          onTap: () {
                            controller.onMovieSelected(
                              result?.id ?? 0,
                              '${AppAssets.imagePath}${result?.posterPath ?? ""}',
                              result?.overview ?? '',
                              result?.title ?? '',
                            );
                          },
                          child: Container(
                            width: screenWidth * 0.5,
                            decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(40))),
                            child: Card(
                              child: Stack(
                                children: [
                                  SizedBox(
                                    height: screenHeight * 0.45,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Image.network(
                                          '${AppAssets.imagePath}${result?.posterPath ?? ""}',
                                          height: screenHeight * 0.2,
                                          width: screenWidth,
                                          fit: BoxFit.cover,
                                        ),
                                        SizedBox(
                                          height: screenHeight * 0.03,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            result?.title ?? "",
                                            style: const TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(DateFormat.yMMMMd()
                                              .format(result?.releaseDate ??
                                                  DateTime.now())),
                                        )
                                      ],
                                    ),
                                  ),
                                  Positioned(
                                    bottom: screenHeight * 0.15,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: CircleAvatar(
                                        backgroundColor: Colors.green,
                                        radius: 20,
                                        child: CircleAvatar(
                                          backgroundColor: Colors.black,
                                          radius: 18,
                                          child: Text(
                                            '${result?.voteAverage ?? ""}',
                                            style: const TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                      top: 2,
                                      right: 3,
                                      child: Container(
                                          height: screenHeight * 0.045,
                                          decoration: BoxDecoration(
                                              color: Colors.black26,
                                              borderRadius:
                                                  BorderRadius.circular(50)),
                                          child: PopupMenuButton(
                                              child: const Icon(
                                                Icons.more_horiz,
                                                color: Colors.white,
                                              ),
                                              itemBuilder:
                                                  (BuildContext context) {
                                                return [
                                                  PopupMenuItem(
                                                      value: 1,
                                                      child: InkWell(
                                                        onTap: () {
                                                          controller.castData
                                                              .value = true;
                                                        },
                                                        child: Row(
                                                          children: const <
                                                              Widget>[
                                                            Padding(
                                                                padding:
                                                                    EdgeInsets
                                                                        .fromLTRB(
                                                                            8,
                                                                            0,
                                                                            8,
                                                                            0),
                                                                child: Text(
                                                                  'Cast Detail',
                                                                  style: TextStyle(
                                                                      fontFamily:
                                                                          'TrilliumWebRegular',
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold),
                                                                )),
                                                          ],
                                                        ),
                                                      )),
                                                  PopupMenuItem(
                                                      value: 2,
                                                      child: InkWell(
                                                        onTap: () {
                                                          controller.castData
                                                              .value = false;
                                                        },
                                                        child: Row(
                                                          children: const <
                                                              Widget>[
                                                            Padding(
                                                              padding:
                                                                  EdgeInsets
                                                                      .fromLTRB(
                                                                          8,
                                                                          0,
                                                                          8,
                                                                          0),
                                                              child: Text(
                                                                'Crew Detail',
                                                                style: TextStyle(
                                                                    fontFamily:
                                                                        'TrilliumWebRegular',
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      )),
                                                ];
                                              }))),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                      itemCount: controller.movie.results?.length,
                    ),
                  ),
                  controller.selectedMovieId.value != null &&
                          controller.selectedMovieImage.value.isNotEmpty &&
                          controller.selectedMovieOverView.value.isNotEmpty &&
                          controller.selectedMovieName.value.isNotEmpty
                      ? SizedBox(
                          height: screenHeight * 0.25,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.network(
                                    controller.selectedMovieImage.value),
                                SizedBox(
                                  width: screenWidth * 0.02,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      controller.selectedMovieName.value,
                                      style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      height: screenHeight * 0.02,
                                    ),
                                    const Text(
                                      "Overview",
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        fontSize: 18,
                                      ),
                                    ),
                                    // SizedBox(
                                    //   width: screenWidth * 0.6,
                                    //   child: SingleChildScrollView(
                                    //     child: Text(
                                    //       controller.selectedMovieOverView.value,
                                    //       maxLines: 2,
                                    //       overflow: TextOverflow.ellipsis,
                                    //       style: const TextStyle(
                                    //         fontSize: 12,
                                    //       ),
                                    //     ),
                                    //   ),
                                    // ),
                                    SizedBox(
                                      height: screenHeight * 0.06,
                                      width: screenWidth * 0.6,
                                      child: SingleChildScrollView(
                                        child: Text(
                                          controller
                                              .selectedMovieOverView.value,
                                          maxLines: 3,
                                          style: const TextStyle(
                                              color: Colors.black),
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        )
                      : Container(),
                  controller.castData.value == true?
                  const Text(
                    'Top Billed Cast',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ): const Text(
                    'Crew',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  controller.selectedMovieId.value != null &&
                          controller.castData.value == true
                      ? SizedBox(
                          height: screenHeight * 0.16,
                          child: ListView.builder(
                            itemCount: controller.credit.value.cast?.length,
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            itemBuilder: (BuildContext context, int index) {
                              var result = controller.credit.value.cast?[index];
                              return Padding(
                                padding: const EdgeInsets.all(6.0),
                                child: SizedBox(
                                  height: screenHeight * 0.16,
                                  width: screenWidth * 0.32,
                                  child: Card(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        if (result?.profilePath != null &&
                                            result?.profilePath?.isNotEmpty ==
                                                true)
                                          SizedBox(
                                            height: screenHeight * 0.095,
                                            width: screenWidth,
                                            child: Image.network(
                                              '${AppAssets.imagePath}${result?.profilePath ?? ""}',
                                              height: screenHeight * 0.2,
                                              fit: BoxFit.cover,
                                            ),
                                          )
                                        else
                                          SizedBox(
                                            height: screenHeight * 0.095,
                                            child: const Center(
                                              child: Icon(
                                                Icons.person,
                                                size: 30,
                                              ),
                                            ),
                                          ),
                                        Flexible(
                                          child: SizedBox(
                                              width: screenWidth,
                                              child: Text(
                                                  result?.originalName ?? '')),
                                        ),
                                        Flexible(
                                          child: SizedBox(
                                            width: screenWidth * 0.6,
                                            child: Text(
                                              result?.character ?? '',
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },

                            /*Image.network(controller.selectedMovieId.value),*/
                          ),
                        )
                      : SizedBox(
                          height: screenHeight * 0.16,
                          child: ListView.builder(
                            itemCount: controller.credit.value.crew?.length,
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            itemBuilder: (BuildContext context, int index) {
                              var result = controller.credit.value.crew?[index];
                              return Padding(
                                padding: const EdgeInsets.all(6.0),
                                child: SizedBox(
                                  height: screenHeight * 0.16,
                                  width: screenWidth * 0.32,
                                  child: Card(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        if (result?.profilePath != null &&
                                            result?.profilePath?.isNotEmpty ==
                                                true)
                                          SizedBox(
                                            height: screenHeight * 0.095,
                                            width: screenWidth,
                                            child: Image.network(
                                              '${AppAssets.imagePath}${result?.profilePath ?? ""}',
                                              height: screenHeight * 0.2,
                                              fit: BoxFit.cover,
                                            ),
                                          )
                                        else
                                          SizedBox(
                                            height: screenHeight * 0.095,
                                            child: const Center(
                                              child: Icon(
                                                Icons.person,
                                                size: 30,
                                              ),
                                            ),
                                          ),
                                        Flexible(
                                          child: SizedBox(
                                              width: screenWidth,
                                              child: Text(
                                                  result?.originalName ?? '')),
                                        ),
                                        Flexible(
                                          child: SizedBox(
                                            width: screenWidth * 0.6,
                                            child: Text(
                                              result?.department ?? '',
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },

                            /*Image.network(controller.selectedMovieId.value),*/
                          ),
                        ),
                ],
              )
            : const Text('......Loading...'),
      );
    });
  }
}
