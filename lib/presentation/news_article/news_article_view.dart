import 'package:flutter/material.dart';
import 'package:pace_assignment/domain/model.dart';

class NewsArticleView extends StatelessWidget {
  Article article;
  NewsArticleView(Key? key, this.article) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text("article page"),
    );
  }
}
