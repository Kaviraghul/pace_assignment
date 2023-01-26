// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:pace_assignment/app/constants.dart';
import 'package:pace_assignment/app/utils.dart';
import 'package:pace_assignment/domain/model.dart';
import 'package:pace_assignment/presentation/resources/color_manager.dart';
import 'package:pace_assignment/presentation/resources/routes_manager.dart';
import 'package:pace_assignment/presentation/resources/values_manager.dart';

class NewsArticleView extends StatelessWidget {
  const NewsArticleView();

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height * 0.5;
    final Article article =
        ModalRoute.of(context)?.settings.arguments as Article;
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
                  image: NetworkImage(article.urlToImage),
                  fit: BoxFit.cover,
                )),
              ),
              Container(
                width: double.infinity,
                height: double.infinity,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
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
              SingleChildScrollView(
                padding: const EdgeInsets.only(
                    left: AppPadding.p20, right: AppPadding.p20),
                child: Column(
                  children: [
                    SizedBox(
                      height: height,
                    ),
                    Text(
                      article.title,
                      style: Theme.of(context).textTheme.caption,
                    ),
                    const SizedBox(
                      height: 64,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(article.source!.name,
                            style: Theme.of(context).textTheme.headline6),
                        Text(dateConvertor(article.publishedAt),
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
                      onPressed: () => Navigator.pop(context, Routes.mainRoute),
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
}


// backgroundColor: Colors.transparent,
//           systemOverlayStyle: ,
//           leading: Container(
//             width: 50.0,
//             height: 50.0,
//             child: Center(
//               child: FittedBox(
//                 child: FloatingActionButton(
//                   onPressed: () {},
//                   child: Icon(Icons.arrow_upward),
//                 ),
//               ),
//             ),
//           ),