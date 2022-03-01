import 'dart:convert';

import 'package:getx_demo_project/Model/top_rated_movie.dart';
import 'package:getx_demo_project/Model/movie_data.dart';
import 'package:http/http.dart' as http;

class MovieServices {
  static Future<dynamic> fetchMovieApi(String url) async {
    return await http
        .get(Uri.parse(url))
        .then((response) =>
            response.statusCode == 200 ? jsonDecode(response.body) : null)
        .catchError((err) => print(err));
  }


  static Future<dynamic> fetchLatestMovie(String url) async {
    return await http
        .get(Uri.parse(url))
        .then((response) =>
    response.statusCode == 200 ? jsonDecode(response.body) : null)
        .catchError((err) => print(err));
  }

  static Future<dynamic> fetchMovieApiCredits(String url) async {
    http.Response res = await http.get(Uri.parse(url));

    if (res.statusCode == 200) {
      return res.body;
    } else {
      return null;
    }
    return res.body;
    // .then((response) =>
    // response.statusCode == 200 ?
    // jsonDecode(response.body) : null)
    //     .catchError((err) => print(err
    // )
    // );
  }

  static Future<dynamic> fetchPopularMovie(String url) async {
    return await http
        .get(Uri.parse(url))
        .then((response) =>
    response.statusCode == 200 ? jsonDecode(response.body) : null)
        .catchError((err) => print(err));
  }

  static Future<dynamic> fetchTrendingMovieq(String url) async {
    return await http
        .get(Uri.parse(url))
        .then((response) =>
    response.statusCode == 200 ? jsonDecode(response.body) : null)
        .catchError((err) => print(err));
  }

  static Future<dynamic> fetchNowPlayingMovie(String url) async {
    return await http
    .get(Uri.parse(url))
    .then((response) =>
    response.statusCode==200? jsonDecode(response.body):null
    )
    .catchError((err)=>print(err));
  }
  static Future<dynamic> fetchUpcomingMoive( String url)async{
    return await  http
        .get(Uri.parse(url))
        .then((response) => response.statusCode==200?jsonDecode(response.body):null)
        .catchError((err)=>print(err));
  }



  static Future fetchLocalJsonData() async {
    await Future.delayed(Duration(seconds: 3));

    return jsonDecode(moviesData) as Map<String, dynamic>;
  }
}
