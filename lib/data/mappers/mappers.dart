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

extension ArticleDataResponseMapper on ArticleDataResponse? {
  ArticleData toDomain() {
    return ArticleData(
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

extension NewsResponseMapper on NewsResponse? {
  News toDomain() {
    List<ArticleData> mappedArticles =
        (this?.data?.articles.map((articles) => articles.toDomain()) ??
                const Iterable.empty())
            .cast<ArticleData>()
            .toList();

    var data = Articles(mappedArticles);
    return News(data);
  }
}
