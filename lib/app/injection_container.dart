import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:valorant_info/core/api/api_consumer.dart';
import 'package:valorant_info/core/api/app_interceptors.dart';
import 'package:valorant_info/core/api/dio_consumer.dart';
import 'package:valorant_info/core/network/network_info.dart';
import 'package:valorant_info/core/shared/shared_prefrences.dart';
import 'package:valorant_info/core/shared/shared_prefrences_consumer.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //blocs


  //useCases

  // Repository


  //dataSource



  ///core

  sl.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(connectionChecker: sl()));

  ///External

  final sharedPreference = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreference);
  sl.registerLazySingleton(() => Dio());
  sl.registerLazySingleton<ApiConsumer>(() => DioConsumer(client: sl()));
  sl.registerLazySingleton<SharedPrefrencesConsumer>(() => SharedPrefrencesManager(sharedPreferences: sl()));
  sl.registerLazySingleton(() => InternetConnectionChecker());
  sl.registerLazySingleton(() => AppInterceptors());
  sl.registerLazySingleton(() => LogInterceptor(
        request: true,
        requestBody: true,
        requestHeader: true,
        responseBody: true,
        responseHeader: true,
        error: true,
      ));
}

