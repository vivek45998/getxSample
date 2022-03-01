import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_demo_project/Controller/tv_show_controller/on_the_air_tv_show.dart';
import 'package:getx_demo_project/Controller/tv_show_controller/popular_tv_show_api.dart';
import 'package:getx_demo_project/Controller/tv_show_controller/top_rated_tv_show.dart';
import 'package:getx_demo_project/UI/tv_shows/tv_show_detail.dart';
import 'package:getx_demo_project/Utils/constant_string.dart';

class PopularTvShowPage extends StatelessWidget {
  final ctrlPopular = Get.put(PopularTvShowApi());
  final ctrlTopRated = Get.put(TopRatedTvShowApi());
  final ctrlOnTheAir = Get.put(OnAirTvShowApi());
  var size, screenHeight, screenWidth;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    screenWidth = size.width;
    screenHeight = size.height;

    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'Tv Show',
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.black,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Popular Tv Show',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 16),
            ),
            Obx(() {
              return ctrlPopular.dataAvailablePopularTvShow
                  ? SizedBox(
                      height: screenHeight * 0.25,
                      width: screenWidth,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemBuilder: (_ctx, index) {
                          var result =
                              ctrlPopular.popularTvShow.results?[index];
                          return InkWell(
                            onTap: () {
                              Get.to(
                                  () => TvShowCreditDetails(
                                      id: result!.id,
                                      imagePAth: result?.posterPath ?? '',
                                      imageBackdrop: result?.backdropPath ?? '',
                                      overview: result?.overview ?? '',
                                      rating: result.voteAverage,
                                      name: result?.name ?? ''),
                                  arguments: {'id': result!.id});
                            },
                            child: Card(
                              child: SizedBox(
                                child: Column(
                                  children: [
                                    SizedBox(
                                        height: screenHeight * 0.18,
                                        child: Image.network(
                                            '${AppAssets.imagePath}${result?.posterPath ?? ''}')),
                                    SizedBox(
                                      width: screenWidth * 0.28,
                                      child: Text(
                                        result?.name ?? '',
                                        style: const TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12),
                                      ),
                                    ),
                                    SizedBox(
                                      width: screenWidth * 0.28,
                                      child: Text(
                                        result?.firstAirDate ?? '',
                                        style: const TextStyle(fontSize: 12),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                        itemCount: ctrlPopular.popularTvShow.results?.length,
                      ),
                    )
                  : const Text('.....Loading........');
            }),
            const Text(
              'TopRated Tv Show',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 16),
            ),
            Obx(() {
              return ctrlTopRated.dataAvailableTopRated
                  ? SizedBox(
                      height: screenHeight * 0.25,
                      width: screenWidth,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemBuilder: (_ctx, index) {
                          var result =
                              ctrlTopRated.topRatedTvshow.results?[index];
                          return InkWell(
                            onTap: () {
                              Get.to(
                                  () => TvShowCreditDetails(
                                        id: result!.id,
                                        imagePAth: result?.posterPath ?? '',
                                        imageBackdrop:
                                            result?.backdropPath ?? '',
                                        overview: result?.overview ?? '',
                                        rating: result.voteAverage,
                                        name: result?.name ?? '',
                                      ),
                                  arguments: {'id': result!.id});
                            },
                            child: Card(
                              child: SizedBox(
                                child: Column(
                                  children: [
                                    SizedBox(
                                        height: screenHeight * 0.18,
                                        child: Image.network(
                                            '${AppAssets.imagePath}${result?.posterPath ?? ''}')),
                                    SizedBox(
                                      width: screenWidth * 0.28,
                                      child: Text(
                                        result?.name ?? '',
                                        style: const TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12),
                                      ),
                                    ),
                                    SizedBox(
                                      width: screenWidth * 0.28,
                                      child: Text(
                                        result?.firstAirDate ?? '',
                                        style: const TextStyle(fontSize: 12),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                        itemCount: ctrlTopRated.topRatedTvshow.results?.length,
                      ),
                    )
                  : const Text('.....Loading........');
            }),
            const Text(
              'On The Air View Tv Show',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 16),
            ),
            Obx(() {
              return ctrlOnTheAir.dataAvailableOnTheAir
                  ? SizedBox(
                      height: screenHeight * 0.25,
                      width: screenWidth,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemBuilder: (_ctx, index) {
                          var result = ctrlOnTheAir.onAirTvShow.results?[index];
                          return InkWell(
                            onTap: () {
                              Get.to(
                                  () => TvShowCreditDetails(
                                      id: result!.id,
                                      imagePAth: result.posterPath ?? '',
                                      imageBackdrop: result.backdropPath ?? '',
                                      overview: result.overview ?? '',
                                      rating: result.voteAverage,
                                      name: result.name ?? ''),
                                  arguments: {'id': result!.id});
                            },
                            child: Card(
                              child: SizedBox(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                        height: screenHeight * 0.18,
                                        //width: screenWidth*0.28,
                                        child: Image.network(
                                            '${AppAssets.imagePath}${result?.posterPath ?? ''}')),
                                    SizedBox(
                                      width: screenWidth * 0.28,
                                      child: Text(
                                        result?.name ?? '',
                                        style: const TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12),
                                      ),
                                    ),
                                    SizedBox(
                                      width: screenWidth * 0.28,
                                      child: Text(
                                        result?.firstAirDate ?? '',
                                        style: const TextStyle(fontSize: 12),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                        itemCount: ctrlOnTheAir.onAirTvShow.results?.length,
                      ),
                    )
                  : const Text('.....Loading........');
            }),
          ],
        ));
  }
}
