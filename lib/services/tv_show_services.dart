import 'dart:convert';

import 'package:getx_demo_project/Model/movie_data.dart';
import 'package:http/http.dart' as http;

class TvShowServices {
  static Future<dynamic> fetchPopularTvShow(String url) async {
    print('isthere?');
    return await http.get(Uri.parse(url)).then((response) {
      try {
        return response.statusCode == 200 ? jsonDecode(response.body) : null;
      } on Exception catch (err) {
        print('err>>${err}');
      }
    }).catchError((err) => print(err));
  }

  static Future<dynamic> fetchDataTopRatedTvShow(String url) async {
    return await http.get(Uri.parse(url)).then((response) {
      return response.statusCode == 200 ? jsonDecode(response.body) : null;
    }).catchError((err) {
      return print('err>>>>>>$err');
    });
  }

  static Future<dynamic> fetchOnAirTvShow(String url) async {
    return await http.get(Uri.parse(url)).then((response) {
      return response.statusCode == 200 ? jsonDecode(response.body) : null;
    }).catchError((err) {
      return print("err>>>>>$err");
    });
  }

  static Future<dynamic> fetchCreditsTvShow(String url) async
  {
    return await http.get(Uri.parse(url)).then((response) {
      return response.statusCode==200? jsonDecode(response.body):null;
    }).catchError((err){
      return print('errrr>>>>$err');
    });
  }
  static Future fetchLocalJsonData() async {
    await Future.delayed(Duration(seconds: 3));

    return jsonDecode(moviesData) as Map<String, dynamic>;
  }
}
