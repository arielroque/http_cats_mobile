import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/app/presentation/splash/splash_controller.dart';
import 'package:get/get.dart';

class HomeScreen extends GetView<SplashController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
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
          const Text(
            'Loading...',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ).paddingOnly(bottom: 20.0)
        ],
      ),
    );
  }
}