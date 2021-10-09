import 'package:dartz/dartz.dart';
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
  var count = 0.obs;
  RxList<HttpCat> httCatList = new RxList<HttpCat>();
  RxBool isLoading = true.obs;

  HomeController() {
    loadData();
  }

  void loadData() async {
    final result = await getRemoteHttpCats.call(NoParams());
    _handleFetchResult(result);
  }

  void _handleFetchResult(Either<Failure, List<HttpCat>> result) {
    result.fold((feilure) {
      httCatList.clear();
      Get.snackbar('Refresh failed!', "Can't load articles",
          snackPosition: SnackPosition.BOTTOM);
    }, (data) {
      httCatList.value = data;
      //_setState(ViewState.data);
      this.isLoading.value = false;
      Get.snackbar('Refresh successfuly!',
          ' ${httCatList.length} new articles ready for reading',
          snackPosition: SnackPosition.BOTTOM);
    });
  }

  void addCount() {}
}
