import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_demo_project/Controller/movie_controller/trending_movie_api.dart';
import 'package:getx_demo_project/UI/movies/movie_detail_credits.dart';
import 'package:getx_demo_project/Utils/constant_string.dart';


class TrendingMoviePage extends StatelessWidget{
  final controller = Get.put(TrendingMovieController());
  var size, screenHeight, screenWidth;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    screenWidth = size.width;
    screenHeight = size.height;
    return GetX<TrendingMovieController>(builder:(_ctrl){
      return Scaffold(appBar: AppBar(
          title:const Text('Trending Page',
          style: TextStyle(color: Colors.yellow,fontSize: 18,fontWeight: FontWeight.bold),)
              ,backgroundColor: Colors.black,
      ),
        body: controller.dataAvailableTrending ?
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: screenHeight*0.8,
                width: screenWidth,
                child: GridView.builder(
                  itemCount: controller.trendingMovie.results?.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: (3 / 9),),
                  itemBuilder: (BuildContext context, int index) {
                    final result= controller.trendingMovie.results?[index];
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
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              height:screenHeight*0.35,
                              width: screenWidth,
                              child: Image.network('${AppAssets.imagePath}${result?.posterPath??''}',
                                fit: BoxFit.cover,
                              ),


                            ),
                            SizedBox(
                                width: screenWidth,
                                child: Text(result?.originalTitle?? '',
                                  style: const TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 16),)),
                            SizedBox(
                              width: screenWidth,
                              child: Text(
                                  result?.releaseDate?? ''),
                            ),


                          ],
                        ),
                      ),
                    );
                  },
                ),

              )],
          ),
        ):
        const Text('............Loading..........'),
      );
    });
  }
}