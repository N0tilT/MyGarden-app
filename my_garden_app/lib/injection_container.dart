import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
import 'package:my_garden_app/core/network/network_info.dart';
import 'package:my_garden_app/feature/auth/data/datasources/auth_local_data_source.dart';
import 'package:my_garden_app/feature/auth/data/datasources/auth_remote_data_source.dart';
import 'package:my_garden_app/feature/auth/data/models/user_model/account_model.dart';
import 'package:my_garden_app/feature/auth/data/repositories/auth_repository_impl.dart';
import 'package:my_garden_app/feature/auth/domain/repositories/auth_repository.dart';
import 'package:my_garden_app/feature/auth/domain/usecases/auth.dart';
import 'package:my_garden_app/feature/auth/domain/usecases/get_token.dart';
import 'package:my_garden_app/feature/auth/domain/usecases/logout.dart';
import 'package:my_garden_app/feature/auth/presentation/bloc/bloc/auth_bloc.dart';
import 'package:my_garden_app/feature/auth/presentation/bloc/cubit/token_cubit.dart';
import 'package:my_garden_app/feature/plant_list/data/datasource/local/plant_local_data_source.dart';
import 'package:my_garden_app/feature/plant_list/data/datasource/remote/plant_remote_data_source.dart';
import 'package:my_garden_app/feature/plant_list/data/model/plant_model.dart';
import 'package:my_garden_app/feature/plant_list/data/repository/plant_repository_impl.dart';
import 'package:my_garden_app/feature/plant_list/domain/repositories/plant_repository.dart';
import 'package:my_garden_app/feature/plant_list/domain/usecases/load_plants.dart';
import 'package:my_garden_app/feature/plant_list/presentation/bloc/cubit/plant_list_cubit.dart';

final sl = GetIt.instance;

Future<void> init() async {
  const secureStorage = FlutterSecureStorage();
  Hive.registerAdapter(PlantModelAdapter());

  //! Features
  //! Auth
  // Bloc
  sl.registerFactory(
    () => AuthBloc(
      authUseCase: sl(),
    ),
  );

  sl.registerFactory(
    () => TokenCubit(
      getTokenUseCase: sl(),
      logoutUseCase: sl(),
    ),
  );

  // Use cases
  sl.registerLazySingleton(
    () => Auth(
      authRepository: sl(),
    ),
  );
  sl.registerLazySingleton(
    () => GetToken(
      authRepository: sl(),
    ),
  );

  sl.registerLazySingleton(
    () => Logout(
      authRepository: sl(),
    ),
  );

  // Repository
  sl.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(
      remoteDataSource: sl(),
      localDataSource: sl(),
      networkInfo: sl(),
    ),
  );

  //! Data sources

  sl.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSource(
      client: sl(),
    ),
  );

  sl.registerLazySingletonAsync<AuthLocalDataSource>(() async {
    return AuthLocalDataSourceImpl(
      tokenStorage: secureStorage,
      userBox: await Hive.openBox<AccountModel>('UserBox'),
    );
  });

  await sl.isReady<AuthLocalDataSource>();

  //! PlantList
  sl.registerFactory(
    () => PlantListCubit(
      loadPlants: sl(),
    ),
  );

  sl.registerLazySingleton(
    () => LoadPlants(
      plantRepository: sl(),
    ),
  );

  sl.registerLazySingleton<PlantRepository>(
    () => PlantRepositoryImpl(
      remoteDataSource: sl(),
      localDataSource: sl(),
      networkInfo: sl(),
    ),
  );

  sl.registerLazySingleton<PlantRemoteDataSource>(
    () => PlantRemoteDataSource(
      client: sl(),
    ),
  );

  sl.registerLazySingletonAsync<PlantLocalDataSource>(() async {
    return PlantLocalDataSource(
      plantBox: await Hive.openBox<PlantModel>('PlantBox'),
    );
  });

  await sl.isReady<PlantLocalDataSource>();
//! Core

  sl.registerLazySingleton<NetworkInfo>(
    () => NetworkInfoImpl(
      sl(),
    ),
  );
  //! External
  sl.registerLazySingleton(() => http.Client());

  sl.registerLazySingleton(
    () => Connectivity(),
  );
}
