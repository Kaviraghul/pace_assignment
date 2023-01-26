// ignore_for_file: non_constant_identifier_names

import 'package:dio/dio.dart';
import 'package:pace_assignment/app/constants.dart';
import 'package:pace_assignment/data/responses/responses.dart';
import 'package:pace_assignment/domain/model.dart';
import 'package:retrofit/http.dart';

part 'app_api.g.dart';

@RestApi(baseUrl: Constant.baseUrl)
abstract class AppServiceClient {
  factory AppServiceClient(Dio Dio, {String baseUrl}) = _AppServiceClient;

  @GET("/v2/top-headlines?sources=techcrunch&apiKey=${Constant.token}")
  Future<HomeResponce> getNews();
}
