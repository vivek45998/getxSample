import 'package:get/get.dart';
import 'package:getx_demo_project/Model/tv_show_model/top_rated_tv_show/top_rated_tv_show.dart';
import 'package:getx_demo_project/services/tv_show_services.dart';

class TopRatedTvShowApi extends GetxController {
  final _dataAvailableTopRatedTv = false.obs;
  var _topRatedTvShow;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchDataTopRatedTvShow();
  }

  bool get dataAvailableTopRated => _dataAvailableTopRatedTv.value;

  TopRatedTvShow get topRatedTvshow => _topRatedTvShow;

  Future<dynamic> fetchDataTopRatedTvShow() async {
    String url =
        'https://api.themoviedb.org/3/tv/top_rated?api_key=1c666e345b78920c8e8a26daceb9159c';
    return await TvShowServices.fetchDataTopRatedTvShow(url).then((response) {
      return _topRatedTvShow = TopRatedTvShow.fromJson(response);
    }).catchError(
      (err) {
        print('err!!=$err');
      },
    ).whenComplete(
        () => _dataAvailableTopRatedTv.value = _topRatedTvShow != null);
  }
}
