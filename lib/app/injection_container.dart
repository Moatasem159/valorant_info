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
import 'package:valorant_info/features/agents/data/datasources/agent_local_datasource.dart';
import 'package:valorant_info/features/agents/data/datasources/agent_remote_datasource.dart';
import 'package:valorant_info/features/agents/data/repositories/agents_repository_impl.dart';
import 'package:valorant_info/features/agents/domain/repositories/agents_repository.dart';
import 'package:valorant_info/features/agents/domain/usecases/get_agents_usecase.dart';
import 'package:valorant_info/features/agents/presentation/cubit/agents_cubit.dart';
import 'package:valorant_info/features/maps/data/datasources/map_local_data_source.dart';
import 'package:valorant_info/features/maps/data/datasources/map_remote_datasource.dart';
import 'package:valorant_info/features/maps/data/repositories/map_repository_impl.dart';
import 'package:valorant_info/features/maps/domain/repositories/map_repository.dart';
import 'package:valorant_info/features/maps/domain/usecases/get_maps_usecase.dart';
import 'package:valorant_info/features/maps/presentation/cubits/map_cubit.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //blocs
  sl.registerFactory(() =>AgentsCubit(getAgentsUseCase: sl()));
  sl.registerFactory(() =>MapCubit(getMapsUseCase:sl()));

  //useCases
  sl.registerLazySingleton<GetAgentsUseCase>(() => GetAgentsUseCase(sl()));
  sl.registerLazySingleton<GetMapsUseCase>(() => GetMapsUseCase(sl()));
  // Repository
  sl.registerLazySingleton<AgentsRepository>(() => AgentRepositoryImpl(sl(),sl(),sl()));
  sl.registerLazySingleton<MapRepository>(() => MapRepositoryImpl(sl(),sl(),sl()));
  //dataSource
  sl.registerLazySingleton<AgentsRemoteDataSource>(() => AgentsRemoteDataSourceImpl(sl()));
  sl.registerLazySingleton<AgentLocalDataSource>(() => AgentLocalDataSourceImpl(sl()));
  sl.registerLazySingleton<MapsRemoteDataSource>(() => MapsRemoteDataSourceImpl(sl()));
  sl.registerLazySingleton<MapLocalDataSource>(() => MapLocalDataSourceImpl(sl()));
  ///core
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(connectionChecker: sl()));
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

