import 'package:android_clock/controllers/home_controller.dart';
import 'package:get/get.dart';

class DIService{

  static Future<void> init() async{
    Get.lazyPut<HomeController>(() => HomeController(), fenix: true);
  }

}