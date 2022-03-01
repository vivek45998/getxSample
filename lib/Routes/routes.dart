import 'package:get/get.dart';
import 'package:getx_demo_project/Model/popular_movie/popular_movie.dart';
import 'package:getx_demo_project/UI/latest_movie.dart';
import 'package:getx_demo_project/UI/movies/movie_detail_credits.dart';
import 'package:getx_demo_project/UI/movies/now_playing_movi.dart';
import 'package:getx_demo_project/UI/movies/popular_movie.dart';
import 'package:getx_demo_project/UI/movies/top_rated_movie.dart';
import 'package:getx_demo_project/UI/pdf_file.dart';
import 'package:getx_demo_project/UI/movies/trending_movie.dart';
import 'package:getx_demo_project/UI/socket.io/io_socket_client.dart';
import 'package:getx_demo_project/UI/tv_shows/tv_show.dart';
import 'package:getx_demo_project/UI/tv_shows/tv_show_detail.dart';
import 'package:getx_demo_project/UI/movies/upcoming_movie.dart';

class Routes {
  static final routes = [
    GetPage(name: '/movie', page: () => TopRatedMovie()),
    GetPage(name: '/pdfpage', page: () => PdfPage()),
    GetPage(name: '/latest', page: () => LatestMoviePage()),
    GetPage(name: '/popular', page: () => PopularMoviePage()),
    GetPage(name: '/trending', page: (() => TrendingMoviePage())),
    GetPage(name: '/now_playing', page: (() => NowPlayingMoviePage())),
    GetPage(name: '/upcoming_movie', page: (() => UpcomingMoviePage())),
    GetPage(name: '/popular_tv_show', page: (() => PopularTvShowPage())),
    GetPage(name: '/socket_io', page:(()=>SocketIO())),
    GetPage(
        name: '/tv_show_detail',
        page: (() => TvShowCreditDetails(
              id: null,
              imagePAth: '',
              imageBackdrop: '',
              overview: '',
              rating: null,
              name: '',
            ))),
    GetPage(
        name: '/movie_credits',
        page: (() => MovieCreditDetails(
            id: null,
            imagePAth: '',
            imageBackdrop: '',
            overview: '',
            rating: null,
            name: '')))
  ];
}
