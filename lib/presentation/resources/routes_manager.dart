import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pace_assignment/app/di.dart';
import 'package:pace_assignment/presentation/home/home_view.dart';
import 'package:pace_assignment/presentation/news_article/news_article_view.dart';

class Routes {
  static const String mainRoute = "/";
  static const String articleRoute = "/article";
}

final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      name: Routes.mainRoute,
      path: Routes.mainRoute,
      builder: (BuildContext context, GoRouterState state) {
        initHomeModule();
        return const HomeView();
      },
    ),
    GoRoute(
      name: Routes.articleRoute,
      path: Routes.articleRoute,
      builder: (BuildContext context, GoRouterState state) {
        return const NewsArticleView();
      },
    ),
  ],
);


// static Route<dynamic> unDefinedRoute() {
//     return MaterialPageRoute(
//         builder: (_) => Scaffold(
//               appBar: AppBar(title: const Text(AppString.noRouteFound)),
//               body: const Center(child: Text(AppString.noRouteFound)),
//             ));
//   }