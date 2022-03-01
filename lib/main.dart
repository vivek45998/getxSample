//API Key (v3 auth)1c666e345b78920c8e8a26daceb9159c
//Example API Request
//API Read Access Token (v4 auth)
//eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIxYzY2NmUzNDViNzg5MjBjOGU4YTI2ZGFjZWI5MTU5YyIsInN1YiI6IjYyMDY3YWRmMGNlMWJjMDA2YWE5MGI3MCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.v-GNt-vdd2QodfiafJsZ8pMyVckbaym5L-56ebKzhKw
//'https://api.themoviedb.org/3/movie/top_rated?api_key=1c666e345b78920c8e8a26daceb9159c'

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_demo_project/UI/movies/top_rated_movie.dart';
import 'package:getx_demo_project/UI/pdf_file.dart';
import 'Routes/routes.dart';
import 'UI/home_page.dart';
import 'Utils/translation.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
    //     initialRoute: '/',
         getPages:Routes.routes,
        debugShowCheckedModeBanner: false,
        //getPages: [
         // GetPage(name: '/movie', page:()=> TopRatedMovie()),
          //GetPage(name: '/pdfpage',page: ()=>PdfPage())
    // //     GetPage(name: '/', page: () => MyHomePage(title: '',)),
    // // GetPage(name: '/second', page: () => Second()),
       //],

      translations: Messages(), // your translations
      locale: Locale('en', 'US'), // translations will be displayed in that locale
      fallbackLocale: Locale('en', 'UK'),
      title: 'GetXDemo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home:const MyHomePage(title: 'hello',),
        /**/
    );
  }
}


