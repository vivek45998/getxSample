import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:getx_demo_project/Controller/movie_controller/movie_api.dart';

class LatestMoviePage extends StatelessWidget{
  final controller= Get.put(()=>MovieApiController());
  var size, screenHeight, screenWidth;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    screenWidth = size.width;
    screenHeight = size.height;

    return GetX<MovieApiController>(builder: (_ctrl){
      return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Latest Movie'),
        ),
        body: _ctrl.dataAvailable ?
        Column(children: [

        Text(_ctrl.latest.originalTitle??'')

        ],
        ):const Text('Text Uploding..'),
      );
    });
  }

}