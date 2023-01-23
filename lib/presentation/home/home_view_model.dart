import 'dart:async';

import 'package:pace_assignment/domain/home_usecase.dart';
import 'package:pace_assignment/domain/model.dart';
import 'package:pace_assignment/presentation/base/base_view_model.dart';
import 'package:rxdart/subjects.dart';

class HomeViewModel extends BaseViewModel
    with HomeViewModelInput, HomeViewModelOutput {
  HomeUseCase _newsUseCase;
  HomeViewModel(this._newsUseCase);

  StreamController _articleStreamController =
      BehaviorSubject<List<ArticleData>>();

  @override
  void dispose() {
    // TODO: implement dispose
  }

  @override
  void start() {
    // TODO: implement start
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
