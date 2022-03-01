import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:getx_demo_project/Controller/movie_controller/popular_movie_api.dart';
import 'package:getx_demo_project/Utils/constant_string.dart';


import 'movie_detail_credits.dart';

class PopularMoviePage extends StatelessWidget {
  final controller = Get.put(PopularMovieController());
  var size, screenHeight, screenWidth;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    screenWidth = size.width;
    screenHeight = size.height;
    return GetX<PopularMovieController>(builder: (_ctrl) {
      return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Popular Page',
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.yellow),
          ),
          backgroundColor: Colors.black,
        ),
        body: controller.dataAvailablePopular
            ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: screenHeight * 0.8,
                      width: screenWidth * 0.8,
                      child: GridView.builder(
                        itemCount: controller.popular.results?.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: (3 / 7),
                        ),
                        itemBuilder: (BuildContext context, int index) {
                          final result = controller.popular.results?[index];
                          return InkWell(
                            onTap: () {
                              Get.to(
                                  () => MovieCreditDetails(
                                      id: result!.id,
                                      imagePAth: result?.posterPath ?? '',
                                      imageBackdrop: result?.backdropPath ?? '',
                                      overview: result?.overview ?? '',
                                      rating: result.voteAverage,
                                      name: result?.title ?? ''),
                                  arguments: {'id': result!.id});
                            },
                            child: Card(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: screenHeight * 0.35,
                                    width: screenWidth,
                                    child: Image.network(
                                      '${AppAssets.imagePath}${result?.posterPath ?? ''}',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  SizedBox(
                                      width: screenWidth,
                                      child: Text(
                                        result?.originalTitle ?? '',
                                        style: const TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16),
                                      )),
                                  SizedBox(
                                    width: screenWidth,
                                    child: Text(result?.releaseDate ?? ''),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    )
                  ],
                ),
              )
            : const Text('............Loading..........'),
      );
    });
  }
}
