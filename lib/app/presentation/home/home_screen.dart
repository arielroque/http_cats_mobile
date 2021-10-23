import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/app/core/utils/constants.dart';
import 'package:flutter_clean_architecture/app/core/widgets/search_bar/search_bar.dart';
import 'package:flutter_clean_architecture/app/presentation/home/home_controller.dart';
import 'package:flutter_clean_architecture/app/presentation/home/widgets/image_card.dart';
import 'package:get/get.dart';

class HomeScreen extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Obx(() => controller.isSearching.value
            ? SearchBar(
                onChange: controller.onSearch,
                hint: "Search...",
                keyboardType: TextInputType.number,
              )
            : Text(Constants.APP_NAME)),
        actions: [
          Obx(() => IconButton(
              onPressed: () {
                controller.toggleSearchBar();
              },
              icon: controller.isSearching.value
                  ? Icon(Icons.close)
                  : Icon(Icons.search)))
        ],
      ),
      body: Center(
        child: Column(
          children: [
            Obx(() => Visibility(
                  child: Text("Does not exist "),
                  visible: controller.isSearching.value &&
                      controller.httpCatList.isEmpty,
                )),

            Obx(() => Visibility(
              child: Expanded(
                child: ListView.builder(
                    //cacheExtent: 9999,
                    addAutomaticKeepAlives: true,
                    itemCount: controller.httpCatList.length,
                    itemBuilder: (BuildContext ctxt, int index) {
                      return ImageContent(
                          statusCode:
                              controller.httpCatList[index].statusCode,
                          imageUrl: controller.httpCatList[index].image,
                          action: () {});
                    }),
              ),visible: controller.httpCatList.isNotEmpty,
            )),
          ],
        ),
      ),
    );
  }
}
