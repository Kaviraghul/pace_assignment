// ignore_for_file: depend_on_referenced_packages

import 'package:json_annotation/json_annotation.dart';

part 'responses.g.dart';

@JsonSerializable()
class SourceResponse {
  @JsonKey(name: "id")
  String? id;
  @JsonKey(name: "name")
  String? name;

  SourceResponse({this.id, this.name});

  // from json
  factory SourceResponse.fromJson(Map<String, dynamic> json) =>
      _$SourceResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SourceResponseToJson(this);
}

@JsonSerializable()
class ArticleResponse {
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

  ArticleResponse(this.source, this.author, this.title, this.description,
      this.url, this.urlToImage, this.publishedAt, this.content);

  factory ArticleResponse.fromJson(Map<String, dynamic> json) =>
      _$ArticleResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ArticleResponseToJson(this);
}

@JsonSerializable()
class HomeResponce {
  @JsonKey(name: "status")
  String? status;
  @JsonKey(name: "totalResults")
  int? totalResults;
  @JsonKey(name: "articles")
  List<ArticleResponse>? articles;

  HomeResponce(this.status, this.totalResults, this.articles);

  // from json
  factory HomeResponce.fromJson(Map<String, dynamic> json) =>
      _$HomeResponceFromJson(json);

  // to json
  Map<String, dynamic> toJson() => _$HomeResponceToJson(this);
}

