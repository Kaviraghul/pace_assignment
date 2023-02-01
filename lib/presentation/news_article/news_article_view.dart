// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pace_assignment/app/constants.dart';
import 'package:pace_assignment/app/di.dart';
import 'package:pace_assignment/app/utils.dart';
import 'package:pace_assignment/domain/model.dart';
import 'package:pace_assignment/presentation/resources/color_manager.dart';
import 'package:pace_assignment/presentation/resources/routes_manager.dart';
import 'package:pace_assignment/presentation/resources/values_manager.dart';

class NewsArticleView extends StatefulWidget {
  const NewsArticleView();

  @override
  State<NewsArticleView> createState() => _NewsArticleViewState();
}

class _NewsArticleViewState extends State<NewsArticleView> {
  final ScrollController _scrollController = ScrollController();
  final SelectedArticle _selectedArticle = instance<SelectedArticle>();

  double offset = 0;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      setState(() {
        offset = _scrollController.position.pixels;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height * 0.5;
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          color: ColorManager.black,
          child: Stack(
            children: [
              Container(
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                    image: DecorationImage(
                  image: NetworkImage(
                      _selectedArticle.selectedArticle!.urlToImage),
                  fit: BoxFit.cover,
                )),
              ),
              _getAnimatedContainer(),
              _buildGradient(),
              SingleChildScrollView(
                controller: _scrollController,
                padding: const EdgeInsets.only(
                    left: AppPadding.p20, right: AppPadding.p20),
                child: Column(
                  children: [
                    SizedBox(
                      height: height,
                    ),
                    Text(
                      _selectedArticle.selectedArticle!.title,
                      style: Theme.of(context).textTheme.caption,
                    ),
                    const SizedBox(
                      height: 64,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(_selectedArticle.selectedArticle!.source!.name,
                            style: Theme.of(context).textTheme.headline6),
                        Text(
                            dateConvertor(
                                _selectedArticle.selectedArticle!.publishedAt),
                            style: Theme.of(context).textTheme.headline6),
                      ],
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Text(
                      dummyContent,
                      style: Theme.of(context).textTheme.bodyText1,
                      textAlign: TextAlign.justify,
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10, left: 10),
                width: 50.0,
                height: 50.0,
                child: Center(
                  child: FittedBox(
                    child: FloatingActionButton(
                      backgroundColor: Colors.black.withOpacity(0.4),
                      onPressed: () => context.go(Routes.mainRoute),
                      child: const Icon(
                        Icons.arrow_back,
                        size: 40,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
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

  AnimatedContainer _getAnimatedContainer() {
    return AnimatedContainer(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      duration: const Duration(milliseconds: 5),
      curve: Curves.easeInOut,
      color: colorFromOffset(offset),
    );
  }

  Color colorFromOffset(double offset) {
    const int min = 0;
    const int max = 400;
    const int range = max - min;
    final int black = (offset.clamp(min, max) * 255 / range).round();
    return Color.fromARGB(black, 0, 0, 0);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
