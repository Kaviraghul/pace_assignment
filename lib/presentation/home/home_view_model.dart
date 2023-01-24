// ignore_for_file: void_checks, prefer_final_fields

import 'dart:async';
import 'dart:ffi';

import 'package:pace_assignment/domain/home_usecase.dart';
import 'package:pace_assignment/domain/model.dart';
import 'package:pace_assignment/presentation/base/base_view_model.dart';
import 'package:rxdart/subjects.dart';

class HomeViewModel extends BaseViewModel
    with HomeViewModelInput, HomeViewModelOutput {
  HomeUseCase _homeUseCase;
  HomeViewModel(this._homeUseCase);

  StreamController _articleStreamController =
      BehaviorSubject<List<ArticleData>>();

  @override
  void dispose() {
    _articleStreamController.close();
  }

  @override
  void start() {
    _getHome();
  }

  _getHome() async {
    (await _homeUseCase.execute(Void)).fold((l) => null, (homeObject) => inputArticles.add(homeObject.data.articles));
  }

  @override
  Sink get inputArticles => _articleStreamController.sink;

  @override
  Stream<List<ArticleData>> get outputArticles =>
      _articleStreamController.stream.map((article) => article);
}

abstract class HomeViewModelInput {
  Sink get inputArticles;
}

abstract class HomeViewModelOutput {
  Stream<List<ArticleData>> get outputArticles;
}
