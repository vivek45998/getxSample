import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class MyController extends GetxController{
  var count=0.obs;
  increment(){
    return count++;
  }
  void changeLanguage(var param1, var param2){
    var locale=Locale(param1,param2);
    Get.updateLocale(locale);
  }
}
