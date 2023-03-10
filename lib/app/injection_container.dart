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
import 'package:valorant_info/features/settings/data/datasources/lang_local_datasource.dart';
import 'package:valorant_info/features/settings/data/datasources/theme_local_datasource.dart';
import 'package:valorant_info/features/settings/data/repositories/lang_repository_impl.dart';
import 'package:valorant_info/features/settings/data/repositories/theme_repository_impl.dart';
import 'package:valorant_info/features/settings/domain/repositories/lang_repository.dart';
import 'package:valorant_info/features/settings/domain/repositories/theme_repository.dart';
import 'package:valorant_info/features/settings/domain/usecases/change_lang_usecase.dart';
import 'package:valorant_info/features/settings/domain/usecases/change_theme_usecase.dart';
import 'package:valorant_info/features/settings/domain/usecases/get_saved_lang.dart';
import 'package:valorant_info/features/settings/domain/usecases/get_theme_usecase.dart';
import 'package:valorant_info/features/settings/presentation/cubit/locale_cubit/locale_cubit.dart';
import 'package:valorant_info/features/settings/presentation/cubit/theme_cubit/theme_cubit.dart';
import 'package:valorant_info/features/weapons/data/datasources/weapons_local_datasource.dart';
import 'package:valorant_info/features/weapons/data/datasources/weapons_remote_datasource.dart';
import 'package:valorant_info/features/weapons/data/repositories/weapons_repository_impl.dart';
import 'package:valorant_info/features/weapons/domain/repositories/weapon_repository.dart';
import 'package:valorant_info/features/weapons/domain/usecases/get_weapons_usecase.dart';
import 'package:valorant_info/features/weapons/presentation/cubits/weapons_cubit.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //blocs
  sl.registerFactory(() =>LocaleCubit(changeLangUseCase: sl(),getSavedLangUseCase: sl()));
  sl.registerFactory(() =>ThemeCubit(changeThemeUseCase:  sl(),getThemeUseCase:sl()));
  sl.registerFactory(() =>AgentsCubit(getAgentsUseCase: sl()));
  sl.registerFactory(() =>MapCubit(getMapsUseCase:sl()));
  sl.registerFactory(() =>WeaponCubit(getWeaponsUseCase:sl()));

  //useCases
  sl.registerLazySingleton<ChangeLangUseCase>(() => ChangeLangUseCase(sl()));
  sl.registerLazySingleton<GetSavedLangUseCase>(() => GetSavedLangUseCase(sl()));
  sl.registerLazySingleton<ChangeThemeUseCase>(() => ChangeThemeUseCase(sl()));
  sl.registerLazySingleton<GetThemeUseCase>(() => GetThemeUseCase(sl()));
  sl.registerLazySingleton<GetAgentsUseCase>(() => GetAgentsUseCase(sl()));
  sl.registerLazySingleton<GetMapsUseCase>(() => GetMapsUseCase(sl()));
  sl.registerLazySingleton<GetWeaponsUseCase>(() => GetWeaponsUseCase(sl()));
  // Repository
  sl.registerLazySingleton<LangRepository>(() => LangRepositoryImpl(sl()));
  sl.registerLazySingleton<ThemeRepository>(() => ThemeRepositoryImpl(sl()));
  sl.registerLazySingleton<AgentsRepository>(() => AgentRepositoryImpl(sl(),sl(),sl()));
  sl.registerLazySingleton<MapRepository>(() => MapRepositoryImpl(sl(),sl(),sl()));
  sl.registerLazySingleton<WeaponRepository>(() => WeaponRepositoryImpl(sl(),sl(),sl()));
  //dataSource
  sl.registerLazySingleton<LangLocalDataSource>(() => LangLocaleDataSourceImpl(sl()));
  sl.registerLazySingleton<ThemeLocalDataSource>(() => ThemeLocalDataSourceImpl(sl()));
  sl.registerLazySingleton<AgentsRemoteDataSource>(() => AgentsRemoteDataSourceImpl(sl()));
  sl.registerLazySingleton<AgentLocalDataSource>(() => AgentLocalDataSourceImpl(sl()));
  sl.registerLazySingleton<MapsRemoteDataSource>(() => MapsRemoteDataSourceImpl(sl()));
  sl.registerLazySingleton<MapLocalDataSource>(() => MapLocalDataSourceImpl(sl()));
  sl.registerLazySingleton<WeaponsRemoteDataSource>(() => WeaponsRemoteDataSourceImpl(sl()));
  sl.registerLazySingleton<WeaponsLocalDataSource>(() => WeaponsLocalDataSourceImpl(sl()));
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

