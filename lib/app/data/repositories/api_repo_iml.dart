import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter_clean_architecture/app/core/errors/failure.dart';
import 'package:flutter_clean_architecture/app/core/http/http_client_impl.dart';
import 'package:flutter_clean_architecture/app/core/utils/constants.dart';
import 'package:flutter_clean_architecture/app/domain/entities/http_cat.dart';
import 'package:flutter_clean_architecture/app/data/repositories/api_repo.dart';

class ApiRepoImpl implements ApiRepo {
  HttpClientImpl _httpClientImpl =  new HttpClientImpl();

  ApiRepoImpl() {
   // _httpClientImpl = new HttpClientImpl();
  }

  @override
  Future<Either<Failure, HttpCat>> getHttpCat(String statusCode) async {
    try {
      final response = await _httpClientImpl.get(statusCode);
      print(response);
      var httpCat = new HttpCat(statusCode: statusCode, image: response);
      return Right(httpCat);
    } on Exception catch (e) {
      print(e.toString());
      return const Left(Failure('Something went wrong'));
    }
  }

  @override
  Future<Either<Failure, List<HttpCat>>> getHttpCats() async {
    try {
      List<HttpCat> httpCats = [];
      for (String statusCode in Constants.HTTP_STATUS_CODES) {
        print(statusCode);
        final response = await _httpClientImpl.get(statusCode);
        var httpCat = new HttpCat(statusCode: statusCode, image: response.toString());
        httpCats.add(httpCat);
      }
      return Right(httpCats);
    } on Exception catch (e) {
      return const Left(Failure('Something went wrong'));
    }
  }
}
