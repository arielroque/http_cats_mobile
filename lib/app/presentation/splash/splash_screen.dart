import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/app/core/widgets/spinner/spinner.dart';
import 'package:flutter_clean_architecture/app/presentation/splash/splash_controller.dart';
import 'package:flutter_clean_architecture/app/theme/color_theme.dart';
import 'package:flutter_clean_architecture/app/theme/font_size.dart';
import 'package:get/get.dart';

class SplashScreen extends GetView<SplashController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorTheme.PRIMARY_COLOR,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              alignment: Alignment.center,
              child: const Icon(
                Icons.adb,
                size: 55,
                color: Colors.black,
              )).paddingOnly(top: Get.mediaQuery.size.height * 0.4),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Spinner(message: "Loading...",color: ColorTheme.WHITE,messageColor: ColorTheme.WHITE,messageSize: FontSize.FONT_SIZE_MEDIUM,),
          )
        ],
      ),
    );
  }
}