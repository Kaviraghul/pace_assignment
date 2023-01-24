// ignore_for_file: prefer_final_fields

import 'package:pace_assignment/data/network/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:pace_assignment/domain/base_usecase.dart';
import 'package:pace_assignment/domain/model.dart';
import 'package:pace_assignment/domain/repository.dart';

class HomeUseCase extends BaseUseCase<void, News> {
  Repository _repository;
  HomeUseCase(this._repository);
  @override
  Future<Either<Failure, News>> execute(void input) async {
    return await _repository.getNews();
  }
}
