import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:getx_demo_project/Controller/movie_controller/upcoming_movie_api.dart';
import 'package:getx_demo_project/Utils/constant_string.dart';

import 'movie_detail_credits.dart';

class UpcomingMoviePage extends StatelessWidget{
   UpcomingMoviePage({Key? key}) : super(key: key);
  final controller =Get.put(UpcomingMovieApi());

   var size, screenHeight, screenWidth;


  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    screenWidth = size.width;
    screenHeight = size.height;
  return GetX<UpcomingMovieApi>(builder: (_ctrl){
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Upcoming Movie List',
        style: TextStyle(color: Colors.yellow),),
        backgroundColor: Colors.black,
      ),
      body: controller.dataAvailableUpcoming?
      Column(
        children: [
        SizedBox(height: screenHeight*0.8,
        child: ListView.builder(itemBuilder: (_ctx,index){
          var result =controller.upcomingMovie.results?[index];
          return InkWell(
            onTap: (){
              Get.to(
                      () =>MovieCreditDetails(
                      id: result!.id,
                      imagePAth: result?.posterPath ?? '',
                      imageBackdrop: result?.backdropPath ?? '',
                      overview: result?.overview ?? '',
                      rating: result.voteAverage,
                      name: result?.title ?? ''),
                  arguments: {'id': result!.id});
            },
            child: Card(
                  child: Stack(
                    children: [
                      Image.network('${AppAssets.imagePath}${result?.posterPath??''}'),

                    ],
                  ),
            ),
          );
        }
        ,
          itemCount: controller.upcomingMovie.results?.length,
        )


        )
      ],)
          : const Text('........Loading.......'),

    );
  });
  }
}