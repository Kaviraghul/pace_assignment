import 'package:pace_assignment/data/network/app_api.dart';
import 'package:pace_assignment/data/responses/responses.dart';

abstract class RemoteDataSource {
  Future<HomeResponce> getNews();
}

class RemoteDataSourceImplementer implements RemoteDataSource {
  final AppServiceClient _appServiceClient;
  RemoteDataSourceImplementer(this._appServiceClient);

  @override
  Future<HomeResponce> getNews() async {
    return await _appServiceClient.getNews();
  }
}
