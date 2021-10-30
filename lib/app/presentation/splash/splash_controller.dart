import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class SplashController extends GetxController {

  SplashController(){
    init();
  }

  void init()async{
    await Future.delayed(const Duration(seconds: 2));
    Get.offAndToNamed('/home');
  }

}