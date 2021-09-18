import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/app/presentation/home/home_controller.dart';
import 'package:get/get.dart';

class HomeScreen extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Home'),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            children: [
              Obx(
                    () => Text(
                  'valor: ${controller.count}',
                  style: const TextStyle(fontSize: 20),
                ),
              ),
              OutlinedButton(child: Text("aumentar"),onPressed: (){
                controller.addCount();
              },)
            ],
          ),
        ),
      );
  }
}
