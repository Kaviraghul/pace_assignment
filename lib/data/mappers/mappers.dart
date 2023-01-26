// ignore_for_file: constant_identifier_names

import 'package:pace_assignment/app/extensions.dart';
import 'package:pace_assignment/data/responses/responses.dart';
import 'package:pace_assignment/domain/model.dart';

const EMPTY = "";
const ZERO = 0;

extension SourceResponseMapper on SourceResponse? {
  Source toDomain() {
    return Source(
      this?.id?.orEmpty() ?? EMPTY,
      this?.name?.orEmpty() ?? EMPTY,
    );
  }
}

extension ArticleResponseMapper on ArticleResponse? {
  Article toDomain() {
    return Article(
      this?.source?.toDomain(),
      this?.author?.orEmpty() ?? EMPTY,
      this?.title?.orEmpty() ?? EMPTY,
      this?.description?.orEmpty() ?? EMPTY,
      this?.url?.orEmpty() ?? EMPTY,
      this?.urlToImage?.orEmpty() ?? EMPTY,
      this?.publishedAt?.orEmpty() ?? EMPTY,
      this?.content?.orEmpty() ?? EMPTY,
    );
  }
}

extension NewsResponseMapper on HomeResponce? {
  Home toDomain() {
    List<Article> mappedArticles =
        (this?.articles?.map((article) => article.toDomain()) ??
                const Iterable.empty())
            .cast<Article>()
            .toList();
    return Home(mappedArticles);
  }
}

extension SelectedArticleMapper on SelectedArticleResponse? {
  SelectedArticle toDomain() {
    return SelectedArticle(
      this?.source?.toDomain(),
      this?.author?.orEmpty() ?? EMPTY,
      this?.title?.orEmpty() ?? EMPTY,
      this?.description?.orEmpty() ?? EMPTY,
      this?.url?.orEmpty() ?? EMPTY,
      this?.urlToImage?.orEmpty() ?? EMPTY,
      this?.publishedAt?.orEmpty() ?? EMPTY,
      this?.content?.orEmpty() ?? EMPTY,
    );
  }
}
