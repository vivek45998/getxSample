import 'package:get/get.dart';
import 'package:getx_demo_project/Model/tv_show_model/popular_tv_show/popular_tv_show.dart';
import 'package:getx_demo_project/services/tv_show_services.dart';

class PopularTvShowApi extends GetxController {
  final _dataAvailablePopularTvShow = false.obs;
  var _popularTvshow;

  @override
  void onInit() {
    super.onInit();
    fetchPopularTvShow();
  }

  bool get dataAvailablePopularTvShow => _dataAvailablePopularTvShow.value;

  PopularTvShow get popularTvShow => _popularTvshow;

  Future<void> fetchPopularTvShow() async {
    String url =
        'https://api.themoviedb.org/3/tv/popular?api_key=1c666e345b78920c8e8a26daceb9159c';
    return await TvShowServices.fetchPopularTvShow(url).then((response) {
      try {
        _popularTvshow = PopularTvShow.fromJson(response);
      } on Exception catch (e) {
        print("exc ${e.toString()}");
      }
    }).catchError(
      (err) {
        print('err!!=$err');
      },
    ).whenComplete(
        () => _dataAvailablePopularTvShow.value = _popularTvshow != null);
  }
}
