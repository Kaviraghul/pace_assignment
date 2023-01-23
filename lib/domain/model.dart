// ignore_for_file: public_member_api_docs, sort_constructors_first
class Source {
  String id;
  String name;
  Source(this.id, this.name);
}

class ArticleData {
  Source source;
  String author;
  String title;
  String description;
  String url;
  String urlToImage;
  String publishedAt;
  String content;
  ArticleData(
    this.source,
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.content,
  );
}

class Articles {
  List<ArticleData> articles;
  Articles(
    this.articles,
  );
}

class HomeObject {
  Articles articles;
  HomeObject(this.articles);
}
