import 'package:dartz/dartz.dart';
import 'package:flutter_clean_architecture/app/core/errors/failure.dart';
import 'package:flutter_clean_architecture/app/domain/entities/http_cat.dart';

abstract class ApiRepo {
  Future<Either<Failure,HttpCat>> getHttpCat(String statusCode);
  Future<Either<Failure,List<HttpCat>>> getHttpCats();
}
