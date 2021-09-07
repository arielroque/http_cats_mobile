
import 'package:flutter_clean_architecture/app/presentation/home/home_screen.dart';
import 'package:flutter_clean_architecture/app/routes/routes.dart';
import 'package:get/get.dart';

class Navigation {
  static List<GetPage> routes = [
    GetPage(
      name: Routes.HOME,
      page: () => HomeScreen(),
      binding: LoginControllerBinding(),
    ),
  ];
}