import 'package:dartz/dartz.dart';
import 'package:pace_assignment/data/network/failure.dart';
import 'package:pace_assignment/domain/model.dart';

abstract class Repository {
  Future<Either<Failure, Home>> getNews();
}
