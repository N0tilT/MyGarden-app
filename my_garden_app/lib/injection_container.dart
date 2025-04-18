import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
import 'package:my_garden_app/core/network/network_info.dart';
import 'package:my_garden_app/feature/auth/data/datasources/auth_local_data_source.dart';
import 'package:my_garden_app/feature/auth/data/datasources/auth_remote_data_source.dart';
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
import 'package:my_garden_app/feature/garden_visual/data/datasource/flower_bed_local_data_source.dart';
import 'package:my_garden_app/feature/garden_visual/data/datasource/garden_local_data_source.dart';
import 'package:my_garden_app/feature/garden_visual/data/datasource/selected_garden_datasource.dart';
import 'package:my_garden_app/feature/garden_visual/data/model/flower_bed_model.dart';
import 'package:my_garden_app/feature/garden_visual/data/model/garden_model.dart';
import 'package:my_garden_app/feature/garden_visual/data/repository/flower_bed_repository_impl.dart';
import 'package:my_garden_app/feature/garden_visual/data/repository/garden_repository_impl.dart';
import 'package:my_garden_app/feature/garden_visual/domain/repositories/flower_bed_repository.dart';
import 'package:my_garden_app/feature/garden_visual/domain/repositories/garden_repository.dart';
import 'package:my_garden_app/feature/garden_visual/domain/usecases/get_selected_garden.dart';
import 'package:my_garden_app/feature/garden_visual/domain/usecases/load_flower_beds.dart';
import 'package:my_garden_app/feature/garden_visual/domain/usecases/load_gardens.dart';
import 'package:my_garden_app/feature/garden_visual/domain/usecases/remove_flower_bed.dart';
import 'package:my_garden_app/feature/garden_visual/domain/usecases/remove_garden.dart';
import 'package:my_garden_app/feature/garden_visual/domain/usecases/set_selected_garden.dart';
import 'package:my_garden_app/feature/garden_visual/domain/usecases/upload_flower_bed.dart';
import 'package:my_garden_app/feature/garden_visual/domain/usecases/upload_garden.dart';
import 'package:my_garden_app/feature/garden_visual/presentation/bloc/flower_bed/flower_bed_cubit.dart';
import 'package:my_garden_app/feature/garden_visual/presentation/bloc/garden/garden_cubit.dart';
import 'package:my_garden_app/feature/plant_card/domain/usecases/load_plant_card_events.dart';
import 'package:my_garden_app/feature/plant_card/domain/usecases/load_plant_card_info.dart';
import 'package:my_garden_app/feature/plant_card/presentation/bloc/cubit/plant_card_cubit.dart';
import 'package:my_garden_app/feature/plant_list/data/datasource/local/plant_local_data_source.dart';
import 'package:my_garden_app/feature/plant_list/data/datasource/remote/plant_remote_data_source.dart';
import 'package:my_garden_app/feature/plant_list/data/model/garden_type_model.dart';
import 'package:my_garden_app/feature/plant_list/data/model/group_model.dart';
import 'package:my_garden_app/feature/plant_list/data/model/grow_stage_model.dart';
import 'package:my_garden_app/feature/plant_list/data/model/light_need_model.dart';
import 'package:my_garden_app/feature/plant_list/data/model/plant_model.dart';
import 'package:my_garden_app/feature/plant_list/data/model/plant_type_model.dart';
import 'package:my_garden_app/feature/plant_list/data/model/plant_variety_model.dart';
import 'package:my_garden_app/feature/plant_list/data/model/watering_need_model.dart';
import 'package:my_garden_app/feature/plant_list/data/repository/plant_repository_impl.dart';
import 'package:my_garden_app/feature/plant_list/domain/repositories/plant_repository.dart';
import 'package:my_garden_app/feature/plant_list/domain/usecases/add_plant.dart';
import 'package:my_garden_app/feature/plant_list/domain/usecases/load_plants.dart';
import 'package:my_garden_app/feature/plant_list/presentation/bloc/cubit/plant_list_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;

Future<void> init() async {
  const secureStorage = FlutterSecureStorage();
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  Hive.registerAdapter(PlantModelAdapter());
  Hive.registerAdapter(EventModelAdapter());
  Hive.registerAdapter(FlowerBedModelAdapter());
  Hive.registerAdapter(GardenModelAdapter());
  Hive.registerAdapter(GroupModelAdapter());
  Hive.registerAdapter(GardenTypeModelAdapter());
  Hive.registerAdapter(GrowStageModelAdapter());
  Hive.registerAdapter(LightNeedModelAdapter());
  Hive.registerAdapter(WateringNeedModelAdapter());
  Hive.registerAdapter(PlantTypeModelAdapter());
  Hive.registerAdapter(PlantVarietyModelAdapter());

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
    () => GetUserData(
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
      userStorage: secureStorage,
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
      authRepository: sl(),
    ),
  );
  sl.registerLazySingleton(
    () => UploadPlant(
      plantRepository: sl(),
      authRepository: sl(),
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
      authRepository: sl(),
    ),
  );
  sl.registerLazySingleton(
    () => UploadEvent(
      eventRepository: sl(),
      authRepository: sl(),
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

//! FlowerBeds
  sl.registerFactory(
    () => FlowerBedCubit(
      removeFlowerBed: sl(),
      loadFlowerBeds: sl(),
      uploadFlowerBed: sl(),
    ),
  );

  sl.registerLazySingleton(
    () => LoadFlowerBeds(
      flowerBedRepository: sl(),
    ),
  );
  sl.registerLazySingleton(
    () => UploadFlowerBed(
      flowerBedRepository: sl(),
    ),
  );
  sl.registerLazySingleton(
    () => RemoveFlowerBed(
      flowerBedRepository: sl(),
    ),
  );

  sl.registerLazySingleton<FlowerBedRepository>(
    () => FlowerBedRepositoryImpl(
      localDataSource: sl(),
      networkInfo: sl(),
    ),
  );

  sl.registerLazySingletonAsync<FlowerBedLocalDataSource>(() async {
    return FlowerBedLocalDataSource(
      flowerBedBox: await Hive.openBox<FlowerBedModel>('FlowerBedBox'),
    );
  });

  await sl.isReady<FlowerBedLocalDataSource>();

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
      authRepository: sl(),
    ),
  );
  sl.registerLazySingleton(
    () => LoadPlantEvents(
      eventRepository: sl(),
      authRepository: sl(),
    ),
  );
  //! Gardens
  sl.registerFactory(
    () => GardenCubit(
      setSelectedGarden: sl(),
      getSelectedGarden: sl(),
      removeGarden: sl(),
      loadGardens: sl(),
      uploadGarden: sl(),
    ),
  );

  sl.registerLazySingleton(
    () => SetSelectedGarden(
      gardenRepository: sl(),
    ),
  );
  sl.registerLazySingleton(
    () => GetSelectedGarden(
      gardenRepository: sl(),
    ),
  );
  sl.registerLazySingleton(
    () => RemoveGarden(
      gardenRepository: sl(),
    ),
  );
  sl.registerLazySingleton(
    () => LoadGardens(
      gardenRepository: sl(),
    ),
  );
  sl.registerLazySingleton(
    () => UploadGarden(
      gardenRepository: sl(),
    ),
  );

  sl.registerLazySingleton<GardenRepository>(
    () => GardenRepositoryImpl(
      localDataSource: sl(),
      selectedGardenDatasource: sl(),
      networkInfo: sl(),
    ),
  );

  sl.registerLazySingleton<SelectedGardenDataSource>(
    () => SelectedGardenDataSourceImpl(prefs: prefs),
  );

  sl.registerLazySingletonAsync<GardenLocalDataSource>(() async {
    return GardenLocalDataSource(
      gardenBox: await Hive.openBox<GardenModel>('GardenBox'),
    );
  });

  await sl.isReady<GardenLocalDataSource>();

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
