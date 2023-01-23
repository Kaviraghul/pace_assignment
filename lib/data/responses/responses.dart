// ignore_for_file: depend_on_referenced_packages

import 'package:json_annotation/json_annotation.dart';

part 'responses.g.dart';

@JsonSerializable()
class BaseResponse {
  @JsonKey(name: "status")
  String? status;
  @JsonKey(name: "message")
  String? message;
}

@JsonSerializable()
class SourceResponse {
  @JsonKey(name: "id")
  String? id;
  @JsonKey(name: "name")
  String? name;

  SourceResponse(this.id, this.name);

  // from json
  factory SourceResponse.fromJson(Map<String, dynamic> json) =>
      _$SourceResponseFromJson(json);

  // to json
  Map<String, dynamic> toJson() => _$SourceResponseToJson(this);
}

@JsonSerializable()
class ArticleDataResponse {
  @JsonKey(name: "source")
  SourceResponse? source;
  @JsonKey(name: "author")
  String? author;
  @JsonKey(name: "title")
  String? title;
  @JsonKey(name: "description")
  String? description;
  @JsonKey(name: "url")
  String? url;
  @JsonKey(name: "urlToImage")
  String? urlToImage;
  @JsonKey(name: "publishedAt")
  String? publishedAt;
  @JsonKey(name: "content")
  String? content;

  ArticleDataResponse(this.source, this.author, this.title, this.description,
      this.url, this.urlToImage, this.publishedAt, this.content);

  // from json
  factory ArticleDataResponse.fromJson(Map<String, dynamic> json) =>
      _$ArticleDataResponseFromJson(json);

  // to json
  Map<String, dynamic> toJson() => _$ArticleDataResponseToJson(this);
}

@JsonSerializable()
class ArticlesResponse {
  @JsonKey(name: "articles")
  List<ArticleDataResponse> articles;

  ArticlesResponse(this.articles);

  // from json
  factory ArticlesResponse.fromJson(Map<String, dynamic> json) =>
      _$ArticlesResponseFromJson(json);

  // to json
  Map<String, dynamic> toJson() => _$ArticlesResponseToJson(this);
}

@JsonSerializable()
class NewsResponse extends BaseResponse {
  @JsonKey(name: "data")
  ArticlesResponse? data;

  NewsResponse(this.data);

  // from json
  factory NewsResponse.fromJson(Map<String, dynamic> json) =>
      _$NewsResponseFromJson(json);

  // to json
  Map<String, dynamic> toJson() => _$NewsResponseToJson(this);
}
