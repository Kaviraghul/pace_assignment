// ignore_for_file: library_private_types_in_public_api, prefer_final_fields, sized_box_for_whitespace

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:pace_assignment/app/di.dart';
import 'package:pace_assignment/app/utils.dart';
import 'package:pace_assignment/domain/model.dart';
import 'package:pace_assignment/gen/assets.gen.dart';
import 'package:pace_assignment/presentation/home/home_style.dart';
import 'package:pace_assignment/presentation/home/home_view_model.dart';
import 'package:pace_assignment/presentation/resources/color_manager.dart';
import 'package:pace_assignment/presentation/resources/routes_manager.dart';
import 'package:pace_assignment/presentation/resources/strings_manager.dart';
import 'package:pace_assignment/presentation/resources/values_manager.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  var _title = AppString.headlines;
  final _assets = Assets.json;

  HomeViewModel _viewModel = instance<HomeViewModel>();
  SelectedArticle _selectedArticle = instance<SelectedArticle>();
  HomeStyle _homeStyle = HomeStyle();

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
                      onTap: () {
                        _selectedArticle.update(article);
                        context.go(Routes.articleRoute);
                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(AppSize.s8),
                        child: Stack(
                          alignment: Alignment.bottomRight,
                          children: [
                            _buildNewsImage(context, article),
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
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Center(
          child: Lottie.asset(_assets.newsLoader.path),
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
    return Positioned.fill(
      child: DecoratedBox(
        decoration: _homeStyle.animationBackDrop,
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
      placeholder: (context, url) => _getPlaceholderCard(),
      errorWidget: (context, url, error) => const Icon(Icons.error),
    );
  }

  Container _getPlaceholderCard() {
    return Container(
      width: AppSize.s400,
      height: AppSize.s260,
      color: Colors.black,
    );
  }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }
}
