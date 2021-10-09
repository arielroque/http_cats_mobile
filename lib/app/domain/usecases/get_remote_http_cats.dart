import 'package:dartz/dartz.dart';
import 'package:flutter_clean_architecture/app/core/errors/failure.dart';
import 'package:flutter_clean_architecture/app/core/usercases/usercase.dart';
import 'package:flutter_clean_architecture/app/data/repositories/api_repo_iml.dart';
import 'package:flutter_clean_architecture/app/domain/entities/http_cat.dart';

class GetRemoteHttpCats implements UseCase<List<HttpCat>, NoParams> {
  late ApiRepoImpl repository;

  GetRemoteHttpCats(this.repository);

  @override
  Future<Either<Failure, List<HttpCat>>> call(NoParams params) {
    return repository.getHttpCats();
  }
}
