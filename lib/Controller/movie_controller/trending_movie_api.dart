import 'package:get/get.dart';
import 'package:getx_demo_project/Model/popular_movie/popular_movie.dart';
import 'package:getx_demo_project/Model/trending_movie/trending_movie.dart';
import 'package:getx_demo_project/services/movie_services.dart';

class TrendingMovieController extends GetxController {
  final _dataAvailabletrending = false.obs;
  var _trendingMovie;

  @override
  void onInit() {
    fetchTrendingMovieq();

    super.onInit();
  }

  bool get dataAvailableTrending => _dataAvailabletrending.value;

  TrendingMovie get trendingMovie => _trendingMovie;

  Future<void> fetchTrendingMovieq() async {
    String url =
        'https://api.themoviedb.org/3/trending/all/day?api_key=1c666e345b78920c8e8a26daceb9159c';
    return await MovieServices.fetchTrendingMovieq(url)
        .then((response) {
          if (response != null) {
            _trendingMovie = TrendingMovie.fromJson(response);
          }
        })
        .catchError(
          (err) => print("Error!!!!! : $err"),
        )
        .whenComplete(
            () => _dataAvailabletrending.value = _trendingMovie != null);
  }
}
