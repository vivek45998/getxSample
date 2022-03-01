import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_getx_widget.dart';
import 'package:getx_demo_project/Controller/movie_controller/now_playing_api.dart';
import 'package:getx_demo_project/Utils/constant_string.dart';

import 'movie_detail_credits.dart';

class NowPlayingMoviePage extends StatelessWidget {
  final controller = Get.put(NowPlayingApi());
  var size, screenHeight, screenWidth;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    screenWidth = size.width;
    screenHeight = size.height;
    return GetX<NowPlayingApi>(builder: (_ctrl) {
      return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Now Playing Movie',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.yellow)),
          backgroundColor: Colors.black,
        ),
        body: controller.dataAvailableNowPlaying
            ? Column(
                children: [
                  SizedBox(
                    height: screenHeight * 0.8,
                    width: screenWidth,
                    child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: controller.nowPlaying.results?.length,
                        itemBuilder: (ctx, index) {
                          final result = controller.nowPlaying.results?[index];
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
                                child: Stack(children: [
                              SizedBox(
                                height: screenHeight * 0.59,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Image.network(
                                      '${AppAssets.imagePath}${result?.posterPath ?? ''}',
                                      height: screenHeight * 0.45,
                                      width: screenWidth,
                                      fit: BoxFit.cover,
                                    ),
                                    SizedBox(
                                      height: screenHeight * 0.03,
                                    ),
                                    Text(
                                      result?.originalTitle ?? '',
                                      style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      height: screenHeight * 0.01,
                                    ),
                                    Text(result?.releaseDate ?? ''),
                                  ],
                                ),
                              ),
                              Positioned(
                                height: screenHeight * 0.9,
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
                            ])),
                          );
                        }),
                  )
                ],
              )
            : const Text('...uploading...'),
      );
    });
  }
}
