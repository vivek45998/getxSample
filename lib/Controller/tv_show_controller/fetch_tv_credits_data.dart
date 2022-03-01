import 'package:get/get.dart';
import 'package:getx_demo_project/Model/tv_show_model/tv_show_credits/TvShowCredits.dart';
import 'package:getx_demo_project/services/tv_show_services.dart';

class TvShowCreditsDataApi extends GetxController {
  final _dataCreditTvShow = false.obs;
  final castData = false.obs;
  var _creditTvShowData;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    var id = Get.arguments['id'];
    castData.value;
    print(id);
    fetchCreditsTvShow(id);
  }

  bool get dataCreditTvShow => _dataCreditTvShow.value;

  TvShowCredits get creditTvShowData => _creditTvShowData;

  Future<dynamic> fetchCreditsTvShow(id) {
    String url =
        'https://api.themoviedb.org/3/tv/$id/credits?api_key=1c666e345b78920c8e8a26daceb9159c';
    return TvShowServices.fetchCreditsTvShow(url).then((response) {
      return _creditTvShowData = TvShowCredits.fromJson(response);
    }).catchError((err) {
      return print(err);
    }).whenComplete(() {
      return _dataCreditTvShow.value = _creditTvShowData != null;
    });
  }
}
