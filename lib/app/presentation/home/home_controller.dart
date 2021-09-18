import 'package:get/get.dart';

class HomeController extends GetxController {
  var count = 0.obs;

  void addCount() {
    count += 1;
  }
}
