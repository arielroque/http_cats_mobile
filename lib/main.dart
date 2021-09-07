import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/app/routes/navigation.dart';
import 'package:flutter_clean_architecture/app/routes/routes.dart';
import 'package:flutter_clean_architecture/app/theme/theme_data.dart';
import 'package:get/get.dart';

void main() {
  runApp(
    GetMaterialApp(
    debugShowCheckedModeBanner: false,
    defaultTransition: Transition.topLevel,
    title: "Flutter Clean Architecture",
    initialRoute: Routes.HOME,
    getPages: Navigation.routes,
    theme: themeData,
  ),);
}

