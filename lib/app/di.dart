// ignore_for_file: import_of_legacy_library_into_null_safe, unused_local_variable

import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:get_it/get_it.dart';
import 'package:pace_assignment/app/app_prefs.dart';
import 'package:pace_assignment/data/data_source/local_data_source.dart';
import 'package:pace_assignment/data/data_source/remote_data_source.dart';
import 'package:pace_assignment/data/network/app_api.dart';
import 'package:pace_assignment/data/network/dio_factory.dart';
import 'package:pace_assignment/data/network/network_info.dart';
import 'package:pace_assignment/data/repository/repository.dart';
import 'package:pace_assignment/domain/home_usecase.dart';
import 'package:pace_assignment/domain/model.dart';
import 'package:pace_assignment/domain/repository.dart';
import 'package:pace_assignment/presentation/home/home_view_model.dart';

final instance = GetIt.instance;

Future<void> initAppModule() async {
  instance.registerLazySingleton<AppPreferences>(() => AppPreferences());

  // network class
  instance.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImplementation(DataConnectionChecker()));

  instance.registerLazySingleton<RemoteDataSource>(
      () => RemoteDataSourceImplementer(instance()));

  // repository class
  instance.registerLazySingleton<Repository>(
      () => RepositoryImpl(instance(), instance(), instance()));

  // Local repository class
  instance.registerLazySingleton<LocalDataStorage>(
      () => LocalDataStorageImplementer());

  // Dio factory class
  instance.registerLazySingleton<DioFactory>(() => DioFactory(instance()));

  // App service class
  final dio = await instance<DioFactory>().getDio();
  instance.registerLazySingleton<AppServiceClient>(() => AppServiceClient(dio));

  instance.registerSingleton<SelectedArticle>(SelectedArticle());
}

initHomeModule() {
  if (!GetIt.I.isRegistered<HomeUseCase>()) {
    instance.registerFactory<HomeUseCase>(() => HomeUseCase(instance()));
    instance.registerFactory<HomeViewModel>(() => HomeViewModel(instance()));
  }
}
