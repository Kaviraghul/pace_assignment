import 'package:flutter/material.dart';
import 'package:pace_assignment/app/di.dart';
import 'package:pace_assignment/domain/model.dart';
import 'package:pace_assignment/presentation/home/home_view_model.dart';
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
      body: SingleChildScrollView(
          child: StreamBuilder(
        stream: _viewModel.outputArticles,
        builder: ((context, snapshot) {
          return _getContentWidget(snapshot.data);
        }),
      )),
    );
  }

  _getContentWidget(List<Article>? article) {
    if (article != null) {
      return Padding(
        padding:
            const EdgeInsets.only(left: AppPadding.p12, right: AppPadding.p12),
        child: Container(
          height: AppSize.s100,
          margin: const EdgeInsets.symmetric(vertical: AppMargin.m12),
          child: ListView(
            scrollDirection: Axis.vertical,
            children: article
                .map((article) => Card(
                      elevation: AppSize.s4,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(AppSize.s12),
                          side: BorderSide(
                            color: ColorManager.lightGray,
                            width: AppSize.s1_5,
                          )),
                      child: Column(children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(AppSize.s12),
                          child: Image.network(
                            article.urlToImage,
                            fit: BoxFit.cover,
                            width: AppSize.s100,
                            height: AppSize.s100,
                          ),
                        )
                      ]),
                    ))
                .toList(),
          ),
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

  // Widget _getNewsAricles() {
  //   return StreamBuilder(
  //     stream: _viewModel.outputArticles,
  //     builder: (context, snapshot) {

  //     },
  //   );
  // }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }
}
