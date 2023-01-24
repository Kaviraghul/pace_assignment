import 'package:dartz/dartz.dart';
import 'package:pace_assignment/data/data_source/remote_data_source.dart';
import 'package:pace_assignment/data/mappers/mappers.dart';
import 'package:pace_assignment/data/network/error_handler.dart';
import 'package:pace_assignment/data/network/failure.dart';
import 'package:pace_assignment/data/network/network_info.dart';
import 'package:pace_assignment/domain/model.dart';
import 'package:pace_assignment/domain/repository.dart';

class RepositoryImpl extends Repository {
  final RemoteDataSource _remoteDataSource;
  final NetworkInfo _networkInfo;

  RepositoryImpl(this._networkInfo, this._remoteDataSource);

  @override
  Future<Either<Failure, Home>> getNews() async {
    if (await _networkInfo.isConneected) {
      try {
        final response = await _remoteDataSource.getNews();

        if (response.status == ApiInternalStatus.OK) {
          return Right(response.toDomain());
        } else {
          return Left(Failure(response.status ?? ApiInternalStatus.ERROR,
              response.status ?? ResponseMessage.DEFAULT));
        }
      } catch (error) {
        return (Left(ErrorHandler.handle(error).failure));
      }
    } else {
      // return default response
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }
}
