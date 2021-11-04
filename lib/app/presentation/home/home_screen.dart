import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/app/core/utils/constants.dart';
import 'package:flutter_clean_architecture/app/core/widgets/label_message/label_message.dart';
import 'package:flutter_clean_architecture/app/core/widgets/search_bar/search_bar.dart';
import 'package:flutter_clean_architecture/app/core/widgets/spinner/spinner.dart';
import 'package:flutter_clean_architecture/app/presentation/home/home_controller.dart';
import 'package:flutter_clean_architecture/app/presentation/home/widgets/image_card.dart';
import 'package:flutter_clean_architecture/app/theme/color_theme.dart';
import 'package:flutter_clean_architecture/app/theme/font_size.dart';
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
            : Text(Constants.APP_NAME,style: TextStyle(fontSize: FontSize.FONT_SIZE_APP_BAR),)),
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
      body: RefreshIndicator(
        color: ColorTheme.PRIMARY_COLOR,
        onRefresh: controller.loadData,
        child: Stack(
          children: [
            Obx(() => Visibility(
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Spinner(message: "Loading...",size: 50,),
                      ],
                    ),
                  ),
                  visible: controller.isLoading.isTrue && !controller.haveConnectionError.value,
                )),
            Obx(() => Visibility(
                  child: LabelMessage(
                    imageAssetPath: "assets/images/not_found.png",
                    message: "    Connection error\nSwipe up to try again",
                  ),
                  visible: controller.haveConnectionError.value,
                )),

            Obx(() => Visibility(
              child: LabelMessage(
                imageAssetPath: "assets/images/not_found.png",
                message: "Code not found",
              ),
              visible: controller.isSearching.value &&
                  controller.httpCatList.isEmpty && !controller.haveConnectionError.value,
            )),
            Obx(() => ListView.builder(
                //cacheExtent: 9999,
                physics: AlwaysScrollableScrollPhysics(),
                addAutomaticKeepAlives: true,
                itemCount: controller.httpCatList.length,
                itemBuilder: (BuildContext ctxt, int index) {
                  return ImageContent(
                      statusCode:
                          controller.httpCatList[index].statusCode,
                      imageUrl: controller.httpCatList[index].image,
                      action: () {});
                })),
          ],
        ),
      ),
    );
  }
}
