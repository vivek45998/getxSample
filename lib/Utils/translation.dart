import 'package:get/get.dart';

class Messages extends Translations {

  @override
  Map<String, Map<String, String>> get keys => {
    'en_US': {
      'hello': 'Hello World',
    },
    'de_DE': {
      'hello': 'Hallo Welt',
    },
    'hi_IN':{
      'hello':'Hello Kaise ho'
    },
    'en_UK': {
      'logged_in': 'logged in as @name with email @email',
    },
    'es_ES': {
      'logged_in': 'iniciado sesión como @name con e-mail @email',
    }
  };
}