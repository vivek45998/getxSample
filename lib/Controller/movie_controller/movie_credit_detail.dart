import 'dart:convert';

import 'package:get/get.dart';
import 'package:getx_demo_project/Model/tv_show_model/tv_show_credits/TvShowCredits.dart';
import 'package:getx_demo_project/services/movie_services.dart';
import 'package:getx_demo_project/services/tv_show_services.dart';

import '../my_movie_credit.dart';

class MovieCreditsDataApi extends GetxController {
  final _dataCreditMovie = false.obs;
  final castData=false.obs;
  var _creditMovie;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    var id = Get.arguments['id'];
    castData.value;
    print(id);
    fetchMovieApiCredits(id);
  }

  bool get dataCreditMovie => _dataCreditMovie.value;

  MyMovieCredit get creditMovie => _creditMovie;

  Future<dynamic> fetchMovieApiCredits(id) async {
    String url =
        'https://api.themoviedb.org/3/movie/$id/credits?api_key=1c666e345b78920c8e8a26daceb9159c';
    return await MovieServices.fetchMovieApiCredits(url).then((response) {
      return _creditMovie = MyMovieCredit.fromJson(jsonDecode(response));
    }).catchError((err) {
      return print(err);
    }).whenComplete(() {
      return _dataCreditMovie.value = _creditMovie != null;
    });
  }
}
