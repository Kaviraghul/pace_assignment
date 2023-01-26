// ignore_for_file: library_private_types_in_public_api, prefer_final_fields, sized_box_for_whitespace

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pace_assignment/app/di.dart';
import 'package:pace_assignment/app/utils.dart';
import 'package:pace_assignment/domain/model.dart';
import 'package:pace_assignment/presentation/home/home_view_model.dart';
import 'package:pace_assignment/presentation/news_article/news_article_view.dart';
import 'package:pace_assignment/presentation/resources/color_manager.dart';
import 'package:pace_assignment/presentation/resources/strings_manager.dart';
import 'package:pace_assignment/presentation/resources/values_manager.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  var _title = AppString.headlines;

  HomeViewModel _viewModel = instance<HomeViewModel>();

  @override
  void initState() {
    _bind();
    super.initState();
  }

  _bind() {
    _viewModel.start();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
        _title,
        style: Theme.of(context).textTheme.headline1,
      )),
      body: Container(
        color: ColorManager.gray,
        padding:
            const EdgeInsets.only(left: AppPadding.p12, right: AppPadding.p12),
        child: SingleChildScrollView(
            child: StreamBuilder(
          stream: _viewModel.outputArticles,
          builder: ((context, snapshot) {
            return _getContentWidget(snapshot.data);
          }),
        )),
      ),
    );
  }

  _getContentWidget(List<Article>? article) {
    if (article != null) {
      return Container(
        height: MediaQuery.of(context).size.height,
        margin: const EdgeInsets.symmetric(vertical: AppMargin.m12),
        child: ListView(
          padding: const EdgeInsets.only(bottom: AppSize.s100),
          scrollDirection: Axis.vertical,
          children: article
              .map(
                (article) => Column(
                  children: [
                    InkWell(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => NewsArticleView(article)),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(AppSize.s8),
                        child: Stack(
                          alignment: Alignment.bottomRight,
                          children: [
                            _buildNewsImage( context, article),
                            _buildGradient(),
                            _buildArticleDetails(article)
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: AppSize.s24,
                    )
                  ],
                ),
              )
              .toList(),
        ),
      );
    } else {
      return Container(
        width: 100,
        height: 100,
        child: const Center(
          child: Text("null"),
        ),
      );
    }
  }

  Padding _buildArticleDetails(Article article) {
    return Padding(
      padding: const EdgeInsets.all(AppPadding.p12),
      child: Column(
        children: [
          Text(
            article.title,
            style: Theme.of(context).textTheme.subtitle1,
          ),
          const SizedBox(
            height: AppSize.s12,
          ),
          Row(
            children: [
              Text(
                article.source!.name,
                style: Theme.of(context).textTheme.subtitle2,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(
                width: AppSize.s20,
              ),
              Text(
                dateConvertor(article.publishedAt),
                style: Theme.of(context).textTheme.subtitle2,
              )
            ],
          )
        ],
      ),
    );
  }

  Positioned _buildGradient() {
    return const Positioned.fill(
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.transparent,
              Colors.black,
              Colors.black,
              Colors.black
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [0, 0.7, 0.9, 1],
          ),
        ),
      ),
    );
  }

  CachedNetworkImage _buildNewsImage(BuildContext context, Article article) {
    return CachedNetworkImage(
      imageUrl: article.urlToImage,
      imageBuilder: (context, imageProvider) => Container(
        width: AppSize.s400,
        height: AppSize.s260,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: imageProvider,
            fit: BoxFit.cover,
          ),
        ),
      ),
      placeholder: (context, url) => const CircularProgressIndicator(),
      errorWidget: (context, url, error) => const Icon(Icons.error),
    );
  }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }
}
