import 'package:get/get.dart';
import 'package:getx_demo_project/Model/tv_show_model/on_the_air_tv_show/on_the_air_tv_show.dart';
import 'package:getx_demo_project/services/tv_show_services.dart';

class OnAirTvShowApi extends GetxController {
  final _dataAvailableOnAirTvShow = false.obs;
  var _onAirTvShow;

  @override
  void onInit() {
    super.onInit();
    fetchOnAirTvShow();
  }

  bool get dataAvailableOnTheAir => _dataAvailableOnAirTvShow.value;

  OnTheAirTvShow get onAirTvShow => _onAirTvShow;

  Future<dynamic> fetchOnAirTvShow() {
    String url =
        'https://api.themoviedb.org/3/tv/on_the_air?api_key=1c666e345b78920c8e8a26daceb9159c';
    return TvShowServices.fetchOnAirTvShow(url).then((response) {
      return _onAirTvShow = OnTheAirTvShow.fromJson(response);
    }).catchError((err) {
      return print("errCtrl>>>>>>$err");
    }).whenComplete(() {
      return _dataAvailableOnAirTvShow.value = _onAirTvShow != null;
    });
  }
}
