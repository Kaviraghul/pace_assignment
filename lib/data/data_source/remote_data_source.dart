import 'package:pace_assignment/data/network/app_api.dart';
import 'package:pace_assignment/data/responses/responses.dart';

abstract class RemoteDataSource {
  Future<NewsResponse> getNews();
}

class RemoteDataSourceImplementer implements RemoteDataSource {
  final AppServiceClient _appServiceClient; // for network calls
  RemoteDataSourceImplementer(this._appServiceClient);

  @override
  Future<NewsResponse> getNews() async {
    return await _appServiceClient.getNews();
  }
}
