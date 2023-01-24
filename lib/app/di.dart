import 'package:get_it/get_it.dart';
import 'package:pace_assignment/domain/home_usecase.dart';
import 'package:pace_assignment/presentation/home/home_view_model.dart';

final instance = GetIt.instance;

Future<void> initAppModule() async {}

initLoginModule() {
  if (!GetIt.I.isRegistered<HomeUseCase>()) {
    instance.registerFactory<HomeUseCase>(() => HomeUseCase(instance()));
    instance.registerFactory<HomeViewModel>(() => HomeViewModel(instance()));
  }
}

