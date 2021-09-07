
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('HomeScreen'),
          centerTitle: true,
        ),
        body: Center(
          child: Obx(
                () => Text(
              'Logado com: ${controller.user.value?.name ?? 'Ops'}',
              style: const TextStyle(fontSize: 20),
            ),
          ),
        ),
      );
  }
}
