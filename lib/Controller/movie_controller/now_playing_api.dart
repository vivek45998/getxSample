import 'package:get/get.dart';
import 'package:getx_demo_project/Model/now_playing/now_playing_movie.dart';
import 'package:getx_demo_project/services/movie_services.dart';

class NowPlayingApi extends GetxController {
  final _dataAvailableNowPlaying = false.obs;
  var _nowPlayingMovie;

  @override
  void onInit() {
    super.onInit();
    fetchNowPlayingMovie();
  }

  bool get dataAvailableNowPlaying => _dataAvailableNowPlaying.value;

  NowPlayingMovie get nowPlaying => _nowPlayingMovie;

  Future<void> fetchNowPlayingMovie() async {
    String url =
        'https://api.themoviedb.org/3/movie/now_playing?api_key=1c666e345b78920c8e8a26daceb9159c';
    return await MovieServices.fetchNowPlayingMovie(url)
        .then((response) {
          {
            if (response != null) {
              _nowPlayingMovie = NowPlayingMovie.fromJson(response);
              _dataAvailableNowPlaying.value = _nowPlayingMovie != null;
              refresh();
            }
          }
        })
        .catchError(
          (err) => print('Error!!!!! : $err'),
        )
        .whenComplete(() {
          _dataAvailableNowPlaying.value = _nowPlayingMovie != null;
          refresh();
          print('non-null ${_dataAvailableNowPlaying.value}');
        });
  }
}
