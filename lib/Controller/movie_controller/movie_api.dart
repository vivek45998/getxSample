import 'dart:convert';

import 'package:getx_demo_project/Model/latest_movie/latest_movie.dart';
import 'package:getx_demo_project/Model/popular_movie/popular_movie.dart';
import 'package:getx_demo_project/Utils/constant_string.dart';
import 'package:getx_demo_project/services/movie_services.dart';

import 'package:get/get.dart';
import 'package:getx_demo_project/Model/top_rated_movie.dart';

import '../my_movie_credit.dart';

class MovieApiController extends GetxController {
  var _movie;

  var credit = MyMovieCredit().obs;
  final _dataAvailable = false.obs;

  final castData=false.obs;

  var selectedMovieId = 0.obs;
  var selectedMovieImage=''.obs;
  var selectedMovieOverView=''.obs;
  var selectedMovieName=''.obs;
  var _latest;



  int id=19404;
  String imagePath="https://image.tmdb.org/t/p/w500/2CAL2433ZeIihfX1Hb2139CX0pW.jpg";
  String overview="Raj is a rich, carefree, happy-go-lucky second generation NRI. Simran is the daughter of Chaudhary Baldev Singh, who in spite of being an NRI is very strict about adherence to Indian values. Simran has left for India to be married to her childhood fiancé. Raj leaves for India with a mission at his hands, to claim his lady love under the noses of her whole family. Thus begins a saga.";
  String name="Dilwale Dulhania Le Jayenge";



  @override
  void onInit() {
    super.onInit();
    fetchMovieApi();

    onMovieSelected(id, imagePath, overview, name);
    fetchLatestMovie();
    castData.value;


    print('>>');

  }

  onMovieSelected(int id,String imagePath,String overview, String name) async {
    selectedMovieImage.value=imagePath;
    selectedMovieName.value=name;
    selectedMovieOverView.value=overview;
    selectedMovieId.value = id;

    await fetchMovieApiCredits(selectedMovieId.value);
    refresh();
  }

  bool get dataAvailable => _dataAvailable.value;


  Movies get movie => _movie;
  LatestMovie get latest=>_latest;


  Future<void> fetchMovieApi() async {
    return MovieServices.fetchMovieApi(AppAssets.topRated)
        .then((response) {
          if (response != null) _movie = Movies.fromJson(response);
        })
        .catchError(
          (err) => print('Error!!!!! : $err'),
        )
        .whenComplete(() => _dataAvailable.value = _movie != null);
  }

  Future<void> fetchMovieApiCredits(dynamic id) async {
    String url =
        '${AppAssets.baseIconPath}$id/credits?api_key=1c666e345b78920c8e8a26daceb9159c';
    print('====>$url');
    var res = await MovieServices.fetchMovieApiCredits(url);

    if (res != null) {
      credit.value = MyMovieCredit.fromJson(jsonDecode(res));
    } else {
      // do stuff
    }
  }

  Future <void> fetchLatestMovie()async {
    String url='${AppAssets.baseIconPath}latest?api_key=1c666e345b78920c8e8a26daceb9159c';
    return MovieServices.fetchLatestMovie(url)
        .then((response) {
      if (response != null) _latest = LatestMovie.fromJson(response);
    })
        .catchError(
          (err) => print('Error!!!!! : $err'),
    )
        .whenComplete(() => _dataAvailable.value = _latest != null);

  }




}
