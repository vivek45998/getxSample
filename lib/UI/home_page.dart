import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_demo_project/Controller/my_controller.dart';

import 'package:getx_demo_project/UI/movies/now_playing_movi.dart';
import 'package:getx_demo_project/UI/pdf_file.dart';
import 'package:getx_demo_project/UI/movies/popular_movie.dart';
import 'package:getx_demo_project/UI/movies/trending_movie.dart';
import 'package:getx_demo_project/UI/socket.io/io_socket_client.dart';
import 'package:getx_demo_project/UI/tv_shows/tv_show.dart';
import 'package:getx_demo_project/UI/movies/upcoming_movie.dart';

import 'movies/top_rated_movie.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  MyController controller = Get.put(MyController());

  var products = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: const Text(
          'Get Demo',
          style: TextStyle(fontSize: 18, color: Colors.yellow),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.black,
              ),
              child: Text(
                'Movie And Tv Show',
                style: TextStyle(fontSize: 18, color: Colors.yellow),
              ),
            ),
            ExpansionTile(
              title: const Text(
                "Movies",
                style: TextStyle(color: Colors.yellow, fontSize: 18),
              ),
              backgroundColor: Colors.black,
              children: <Widget>[
                ListTile(
                    title: const Text(
                      "Top_Rated",
                      style: TextStyle(fontSize: 18, color: Colors.yellow),
                    ),
                    onTap: () {
                      Get.to(() => TopRatedMovie());
                    }),
                ListTile(
                    title: const Text(
                      "Trending",
                      style: TextStyle(fontSize: 18, color: Colors.yellow),
                    ),
                    onTap: () {
                      Get.to(() => TrendingMoviePage());
                    }),
                ListTile(
                    title: const Text(
                      'Upcoming',
                      style: TextStyle(fontSize: 18, color: Colors.yellow),
                    ),
                    onTap: () {
                      Get.to(() => UpcomingMoviePage());
                    }),
                ListTile(
                    title: const Text(
                      'Popular',
                      style: TextStyle(fontSize: 18, color: Colors.yellow),
                    ),
                    onTap: () {
                      Get.to(() => PopularMoviePage());
                    }),
                ListTile(
                    title: const Text(
                      'Now Playing',
                      style: TextStyle(fontSize: 18, color: Colors.yellow),
                    ),
                    onTap: () {
                      Get.to(() => NowPlayingMoviePage());
                    }),
              ],
            ),
            ListTile(
                title: const Text(
                  'Tv Show',
                  style: TextStyle(fontSize: 18, color: Colors.yellow),
                ),
                onTap: () {
                  Get.to(() => PopularTvShowPage());
                }),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('hello'.tr),
              Obx(
                () => Text('${controller.count}'),
              ),
              Text('logged_in'
                  .trParams({'name': 'Jhon', 'email': 'jhon@example.com'})),
              Text('singularKey'.trPlural(
                'pluralKey',
                products.length,
              )),
              InkWell(
                onTap: () {
                  controller.changeLanguage('hi', 'IN');
                },
                child: const Text('hello'),
              ),
              InkWell(
                onTap: () {
                  controller.changeLanguage('en', 'US');
                },
                child: const Text('English'),
              ),
              InkWell(
                onTap: () {
                  controller.changeLanguage('de', 'DE');
                },
                child: const Text('Denmark'),
              ),
              InkWell(
                onTap: () {
                  controller.changeLanguage('es', 'ES');
                },
                child: const Text('login'),
              ),
              InkWell(
                onTap: () {
                  Get.to(() => TopRatedMovie());
                },
                child: const Text('Goto_Movie_Page'),
              ),
              const SizedBox(
                width: 20,
                height: 20,
              ),
              InkWell(
                onTap: () {
                  Get.to(() => PdfPage());
                },
                child: const Text('Goto_To_Pdf_Genrated_Page'),
              ),
              InkWell(
                onTap: () {
                  Get.to(() => SocketIO());
                },
                child: const Text('SocketIO'),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.increment();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
