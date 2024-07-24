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
import 'package:my_garden_app/feature/event_journal/data/datasource/local/event_local_data_source.dart';
import 'package:my_garden_app/feature/event_journal/data/datasource/remote/event_remote_data_source.dart';
import 'package:my_garden_app/feature/event_journal/data/model/event_model.dart';
import 'package:my_garden_app/feature/event_journal/data/repository/event_repository_impl.dart';
import 'package:my_garden_app/feature/event_journal/domain/repositories/event_repository.dart';
import 'package:my_garden_app/feature/event_journal/domain/usecases/add_event.dart';
import 'package:my_garden_app/feature/event_journal/domain/usecases/load_events.dart';
import 'package:my_garden_app/feature/event_journal/presentation/bloc/cubit/event_cubit.dart';
import 'package:my_garden_app/feature/plant_card/domain/usecases/load_plant_card_events.dart';
import 'package:my_garden_app/feature/plant_card/domain/usecases/load_plant_card_info.dart';
import 'package:my_garden_app/feature/plant_card/presentation/bloc/cubit/plant_card_cubit.dart';
import 'package:my_garden_app/feature/plant_list/data/datasource/local/plant_local_data_source.dart';
import 'package:my_garden_app/feature/plant_list/data/datasource/remote/plant_remote_data_source.dart';
import 'package:my_garden_app/feature/plant_list/data/model/plant_model.dart';
import 'package:my_garden_app/feature/plant_list/data/repository/plant_repository_impl.dart';
import 'package:my_garden_app/feature/plant_list/domain/repositories/plant_repository.dart';
import 'package:my_garden_app/feature/plant_list/domain/usecases/add_plant.dart';
import 'package:my_garden_app/feature/plant_list/domain/usecases/load_plants.dart';
import 'package:my_garden_app/feature/plant_list/presentation/bloc/cubit/plant_list_cubit.dart';

final sl = GetIt.instance;

Future<void> init() async {
  const secureStorage = FlutterSecureStorage();
  Hive.registerAdapter(PlantModelAdapter());
  Hive.registerAdapter(EventModelAdapter());

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
      uploadPlant: sl(),
    ),
  );

  sl.registerLazySingleton(
    () => LoadPlants(
      plantRepository: sl(),
    ),
  );
  sl.registerLazySingleton(
    () => UploadPlant(
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

  //! Events
  sl.registerFactory(
    () => EventCubit(
      loadEvents: sl(),
      uploadEvent: sl(),
    ),
  );

  sl.registerLazySingleton(
    () => LoadEvents(
      eventRepository: sl(),
    ),
  );
  sl.registerLazySingleton(
    () => UploadEvent(
      eventRepository: sl(),
    ),
  );

  sl.registerLazySingleton<EventRepository>(
    () => EventRepositoryImpl(
      remoteDataSource: sl(),
      localDataSource: sl(),
      networkInfo: sl(),
    ),
  );

  sl.registerLazySingleton<EventRemoteDataSource>(
    () => EventRemoteDataSource(
      client: sl(),
    ),
  );

  sl.registerLazySingletonAsync<EventLocalDataSource>(() async {
    return EventLocalDataSource(
      eventBox: await Hive.openBox<EventModel>('EventBox'),
    );
  });

  await sl.isReady<EventLocalDataSource>();
  //! PlantCard
  sl.registerFactory(
    () => PlantCardCubit(
      loadPlant: sl(),
      loadPlantEvents: sl(),
    ),
  );

  sl.registerLazySingleton(
    () => LoadPlant(
      plantRepository: sl(),
    ),
  );
  sl.registerLazySingleton(
    () => LoadPlantEvents(
      eventRepository: sl(),
    ),
  );

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
