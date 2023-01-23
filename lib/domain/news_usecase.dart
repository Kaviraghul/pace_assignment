// ignore_for_file: prefer_final_fields

import 'package:pace_assignment/data/network/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:pace_assignment/domain/base_usecase.dart';
import 'package:pace_assignment/domain/repository.dart';

class NewsUseCase extends BaseUseCase {
  Repository _repository;
  NewsUseCase(this._repository);
  @override
  Future<Either<Failure, dynamic>> execute(input) {
    return _repository.getNews();
  }
}
