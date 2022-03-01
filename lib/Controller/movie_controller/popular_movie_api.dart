import 'package:get/get.dart';
import 'package:getx_demo_project/Model/popular_movie/popular_movie.dart';
import 'package:getx_demo_project/services/movie_services.dart';

class PopularMovieController extends GetxController {
  final _dataAvailablePopular = false.obs;
  var _popularMovie;

  @override
  void onInit() {
    fetchPopularMovie();

    super.onInit();
  }

  bool get dataAvailablePopular => _dataAvailablePopular.value;

  PopularMovie get popular => _popularMovie;

  Future<void> fetchPopularMovie() async {
    String url =
        'https://api.themoviedb.org/3/movie/popular?api_key=1c666e345b78920c8e8a26daceb9159c';
    return await MovieServices.fetchPopularMovie(url)
        .then((response) {
          if (response != null) _popularMovie = PopularMovie.fromJson(response);
        })
        .catchError(
          (err) => print('Error!!!!! : $err'),
        )
        .whenComplete(
            () => _dataAvailablePopular.value = _popularMovie != null);
  }
}
