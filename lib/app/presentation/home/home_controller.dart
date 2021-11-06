import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_clean_architecture/app/core/errors/failure.dart';
import 'package:flutter_clean_architecture/app/core/usercases/usercase.dart';
import 'package:flutter_clean_architecture/app/data/repositories/api_repo_iml.dart';
import 'package:flutter_clean_architecture/app/domain/entities/http_cat.dart';
import 'package:flutter_clean_architecture/app/domain/usecases/get_remote_http_cat.dart';
import 'package:flutter_clean_architecture/app/domain/usecases/get_remote_http_cats.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final GetRemoteHttpCats getRemoteHttpCats =
      new GetRemoteHttpCats(new ApiRepoImpl());
  final GetRemoteHttpCat getRemoteHttpCat =
      new GetRemoteHttpCat(new ApiRepoImpl());

  final searchController = new TextEditingController();

  var count = 0.obs;

  List<HttpCat> httpCatListCache = [];
  RxList<HttpCat> httpCatList = new RxList<HttpCat>();
  RxString filter = "".obs;
  RxBool isLoading = true.obs;
  RxBool isSearching = false.obs;
  RxBool haveConnectionError = false.obs;

  HomeController() {
    loadData();
  }

  Future<void> loadData() async {
    final result = await getRemoteHttpCats.call(NoParams());
    _handleFetchResult(result);
  }

  void _handleFetchResult(Either<Failure, List<HttpCat>> result) {
    result.fold((feilure) {
      this.httpCatListCache.clear();
      Get.snackbar('Refresh failed!', "Can't load http codes",
          snackPosition: SnackPosition.BOTTOM);

      this.haveConnectionError.value = true;
      this.httpCatList.value = [];
      this.httpCatListCache = [];
    }, (data) {
      this.httpCatListCache = data;
      this.isLoading.value = false;
      this.haveConnectionError.value = false;
      this.httpCatList.value = data.toList();
    });
  }

  void toggleSearchBar() {
    if (isSearching.isTrue) {
      this.isSearching.value = false;
      this.httpCatList.value = httpCatListCache.toList();
      return;
    }
    this.isSearching.value = true;
  }

  void onSearch(String s) {
    this.httpCatList.clear();

    if (s.isEmpty) {
      this.httpCatList.value = httpCatListCache.toList();
      return;
    }

    final cats =
        httpCatListCache.where((i) => i.statusCode.contains(s)).toList();
    for (HttpCat i in cats) {
      this.httpCatList.add(i);
    }
  }
}
