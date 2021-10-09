import 'package:dartz/dartz.dart';
import 'package:flutter_clean_architecture/app/core/errors/failure.dart';
import 'package:flutter_clean_architecture/app/core/usercases/usercase.dart';
import 'package:flutter_clean_architecture/app/data/repositories/api_repo_iml.dart';
import 'package:flutter_clean_architecture/app/domain/entities/http_cat.dart';

class GetRemoteHttpCat implements UseCase<HttpCat, String> {
  late ApiRepoImpl repository;

  GetRemoteHttpCat(this.repository);

  @override
  Future<Either<Failure, HttpCat>> call(String statusCode) {
    return repository.getHttpCat(statusCode);
  }
}
