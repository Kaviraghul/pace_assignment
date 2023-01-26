import 'package:flutter/material.dart';
import 'package:pace_assignment/app/di.dart';
import 'package:pace_assignment/domain/model.dart';
import 'package:pace_assignment/presentation/home/home_view.dart';
import 'package:pace_assignment/presentation/news_article/news_article_view.dart';
import 'package:pace_assignment/presentation/resources/strings_manager.dart';

class Routes {
  static const String mainRoute = "/";
  static const String articleRoute = "/article";
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.mainRoute:
        initHomeModule();
        return MaterialPageRoute(builder: (_) => const HomeView());
      // case Routes.articleRoute:
      //   return MaterialPageRoute(builder: (_) => NewsArticleView());
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
              appBar: AppBar(title: const Text(AppString.noRouteFound)),
              body: const Center(child: Text(AppString.noRouteFound)),
            ));
  }
}
