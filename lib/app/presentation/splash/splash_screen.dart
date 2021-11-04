import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/app/core/widgets/spinner/spinner.dart';
import 'package:flutter_clean_architecture/app/presentation/splash/splash_controller.dart';
import 'package:flutter_clean_architecture/app/theme/color_theme.dart';
import 'package:get/get.dart';

class SplashScreen extends GetView<SplashController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorTheme.WHITE,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height:Get.mediaQuery.size.height*0.1),
          Container(
            width: 360.0,
            height: 360.0,
            child: Image.asset("assets/images/logo.png"),
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Spinner(),
          )
        ],
      ),
    );
  }
}
