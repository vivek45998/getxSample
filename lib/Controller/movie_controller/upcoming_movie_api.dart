import 'package:get/get.dart';
import 'package:getx_demo_project/Model/upcoming_movie/upcoming_movie_.dart';
import 'package:getx_demo_project/services/movie_services.dart';

class UpcomingMovieApi extends GetxController {
  final _dataAvailableUpcomingMovie = false.obs;
  var _upcomingMovie;

  @override
  void onInit() {
    super.onInit();
    fetchUpcomingMoive();
  }

  bool get dataAvailableUpcoming => _dataAvailableUpcomingMovie.value;

  UpcomingMovie get upcomingMovie => _upcomingMovie;

  Future<void> fetchUpcomingMoive() async {
    String url =
        'https://api.themoviedb.org/3/movie/upcoming?api_key=1c666e345b78920c8e8a26daceb9159c';
    return await MovieServices.fetchUpcomingMoive(url)
        .then((response) {
          if (response != null)
            _upcomingMovie = UpcomingMovie.fromJson(response);
        })
        .catchError(
          (err) => print('Error!!!!! : $err'),
        )
        .whenComplete(
            () => _dataAvailableUpcomingMovie.value = _upcomingMovie != null);
  }
}
