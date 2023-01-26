import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pace_assignment/domain/model.dart';

part 'freezed_data_class.freezed.dart';

@freezed
class SelectedArticleObject with _$SelectedArticleObject {
  factory SelectedArticleObject({
    required Source source,
    required String author,
    required String title,
    required String description,
    required String url,
    required String urlToImage,
    required String publishedAt,
    required String content,
  }) = _SelectedArticleObject;
}
