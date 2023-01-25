// ignore_for_file: public_member_api_docs, sort_constructors_first
class Source {
  String id;
  String name;
  Source(this.id, this.name);
}

class Article {
  Source? source;
  String author;
  String title;
  String description;
  String url;
  String urlToImage;
  String publishedAt;
  String content;
  Article(
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

class Home {
  List<Article> articles;
  Home(this.articles);
}

class SelectedArticle {
  Source? source;
  String author;
  String title;
  String description;
  String url;
  String urlToImage;
  String publishedAt;
  String content;
  SelectedArticle(
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
