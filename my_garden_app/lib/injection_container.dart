import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
import 'package:my_garden_app/core/data/datasource/datasource.dart';
import 'package:my_garden_app/core/data/model/common_request_model.dart';
import 'package:my_garden_app/core/data/model/has_plantId_request_model.dart';
import 'package:my_garden_app/core/domain/repositories/common_repository.dart';
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
import 'package:my_garden_app/feature/event_journal/domain/entities/event_entity.dart';
import 'package:my_garden_app/feature/event_journal/domain/usecases/add_event.dart';
import 'package:my_garden_app/feature/event_journal/domain/usecases/delete_event.dart';
import 'package:my_garden_app/feature/event_journal/domain/usecases/load_events.dart';
import 'package:my_garden_app/feature/event_journal/presentation/bloc/cubit/event_cubit.dart';
import 'package:my_garden_app/feature/garden_visual/data/datasource/local/garden_local_data_source.dart';
import 'package:my_garden_app/feature/garden_visual/data/datasource/remote/garden_remote_data_source.dart';
import 'package:my_garden_app/feature/garden_visual/data/model/flower_bed_model.dart';
import 'package:my_garden_app/feature/garden_visual/data/model/garden_model.dart';
import 'package:my_garden_app/feature/garden_visual/data/repository/garden_repository_impl.dart';
import 'package:my_garden_app/feature/garden_visual/domain/entities/garden_entity.dart';
import 'package:my_garden_app/feature/garden_visual/domain/usecases/delete_garden.dart';
import 'package:my_garden_app/feature/garden_visual/domain/usecases/load_gardens.dart';
import 'package:my_garden_app/feature/garden_visual/domain/usecases/upload_garden.dart';
import 'package:my_garden_app/feature/garden_visual/presentation/bloc/garden/garden_cubit.dart';
import 'package:my_garden_app/feature/plant_list/data/datasource/local/group_local_data_source.dart';
import 'package:my_garden_app/feature/plant_list/data/datasource/local/grow_stage_local_data_source.dart';
import 'package:my_garden_app/feature/plant_list/data/datasource/local/light_need_local_data_source.dart';
import 'package:my_garden_app/feature/plant_list/data/datasource/local/plant_local_data_source.dart';
import 'package:my_garden_app/feature/plant_list/data/datasource/local/plant_type_local_data_source.dart';
import 'package:my_garden_app/feature/plant_list/data/datasource/local/plant_variety_local_data_source.dart';
import 'package:my_garden_app/feature/plant_list/data/datasource/local/watering_need_local_data_source.dart';
import 'package:my_garden_app/feature/plant_list/data/datasource/remote/group_remote_data_source.dart';
import 'package:my_garden_app/feature/plant_list/data/datasource/remote/grow_stage_remote_data_source.dart';
import 'package:my_garden_app/feature/plant_list/data/datasource/remote/light_need_remote_data_source.dart';
import 'package:my_garden_app/feature/plant_list/data/datasource/remote/plant_remote_data_source.dart';
import 'package:my_garden_app/feature/plant_list/data/datasource/remote/plant_type_remote_data_source.dart';
import 'package:my_garden_app/feature/plant_list/data/datasource/remote/plant_variety_remote_data_source.dart';
import 'package:my_garden_app/feature/plant_list/data/datasource/remote/recognzie_plant_remote_data_source.dart';
import 'package:my_garden_app/feature/plant_list/data/datasource/remote/watering_need_remote_data_source.dart';
import 'package:my_garden_app/feature/plant_list/data/model/garden_type_model.dart';
import 'package:my_garden_app/feature/plant_list/data/model/group_model.dart';
import 'package:my_garden_app/feature/plant_list/data/model/grow_stage_model.dart';
import 'package:my_garden_app/feature/plant_list/data/model/light_need_model.dart';
import 'package:my_garden_app/feature/plant_list/data/model/plant_model.dart';
import 'package:my_garden_app/feature/plant_list/data/model/plant_type_model.dart';
import 'package:my_garden_app/feature/plant_list/data/model/plant_variety_model.dart';
import 'package:my_garden_app/feature/plant_list/data/model/watering_need_model.dart';
import 'package:my_garden_app/feature/plant_list/data/repository/group_repository_impl.dart';
import 'package:my_garden_app/feature/plant_list/data/repository/grow_stage_repository_impl.dart';
import 'package:my_garden_app/feature/plant_list/data/repository/light_need_repository_impl.dart';
import 'package:my_garden_app/feature/plant_list/data/repository/plant_recognition_repository_impl.dart';
import 'package:my_garden_app/feature/plant_list/data/repository/plant_repository_impl.dart';
import 'package:my_garden_app/feature/plant_list/data/repository/plant_type_repository_impl.dart';
import 'package:my_garden_app/feature/plant_list/data/repository/plant_variety_repository_impl.dart';
import 'package:my_garden_app/feature/plant_list/data/repository/watering_need_repository_impl.dart';
import 'package:my_garden_app/feature/plant_list/domain/entities/group_entity.dart';
import 'package:my_garden_app/feature/plant_list/domain/entities/grow_stage_entity.dart';
import 'package:my_garden_app/feature/plant_list/domain/entities/light_need_entity.dart';
import 'package:my_garden_app/feature/plant_list/domain/entities/plant_entity.dart';
import 'package:my_garden_app/feature/plant_list/domain/entities/plant_type_entity.dart';
import 'package:my_garden_app/feature/plant_list/domain/entities/plant_variety_entity.dart';
import 'package:my_garden_app/feature/plant_list/domain/entities/watering_need_entity.dart';
import 'package:my_garden_app/feature/plant_list/domain/usecases/delete/delete_plant.dart';
import 'package:my_garden_app/feature/plant_list/domain/usecases/load/load_groups.dart';
import 'package:my_garden_app/feature/plant_list/domain/usecases/load/load_grow_stages.dart';
import 'package:my_garden_app/feature/plant_list/domain/usecases/load/load_light_needs.dart';
import 'package:my_garden_app/feature/plant_list/domain/usecases/load/load_plant_types.dart';
import 'package:my_garden_app/feature/plant_list/domain/usecases/load/load_plant_varieties.dart';
import 'package:my_garden_app/feature/plant_list/domain/usecases/load/load_plants.dart';
import 'package:my_garden_app/feature/plant_list/domain/usecases/load/load_watering_needs.dart';
import 'package:my_garden_app/feature/plant_list/domain/usecases/recognize/recognize_plant.dart';
import 'package:my_garden_app/feature/plant_list/domain/usecases/upload/upload_group.dart';
import 'package:my_garden_app/feature/plant_list/domain/usecases/upload/upload_plant.dart';
import 'package:my_garden_app/feature/plant_list/presentation/bloc/group/group_cubit.dart';
import 'package:my_garden_app/feature/plant_list/presentation/bloc/grow_stage/grow_stage_cubit.dart';
import 'package:my_garden_app/feature/plant_list/presentation/bloc/light_need/light_need_cubit.dart';
import 'package:my_garden_app/feature/plant_list/presentation/bloc/plant_list/plant_list_cubit.dart';
import 'package:my_garden_app/feature/plant_list/presentation/bloc/plant_type/plant_type_cubit.dart';
import 'package:my_garden_app/feature/plant_list/presentation/bloc/plant_variety/plant_variety_cubit.dart';
import 'package:my_garden_app/feature/plant_list/presentation/bloc/watering_need/watering_need_cubit.dart';
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
      getUserData: sl(),
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
      recognizePlant: sl(),
      loadPlants: sl(),
      uploadPlant: sl(),
      deletePlant: sl(),
    ),
  );

  sl.registerLazySingleton(
    () => RecognizePlant(
      recognitionRepository: sl(),
      authRepository: sl(),
    ),
  );

  sl.registerLazySingleton(
    () => LoadPlants(
      commonRepository: sl(),
      authRepository: sl(),
      fromModelConverter: (e) {
        return PlantEntity.fromModel(e);
      },
    ),
  );
  sl.registerLazySingleton(
    () => UploadPlant(
      commonRepository: sl(),
      authRepository: sl(),
      fromEntityConverter: (e) {
        return PlantModel.fromEntity(e, "-1");
      },
    ),
  );
  sl.registerLazySingleton(
    () => DeletePlant(
      commonRepository: sl(),
      authRepository: sl(),
    ),
  );

  sl.registerLazySingleton(
    () => PlantRecognitionRepositoryImpl(
      remoteDataSource: sl(),
      networkInfo: sl(),
    ),
  );

  sl.registerLazySingleton<
      CommonRepository<List<PlantModel>, CommonRequestModel>>(
    () => PlantRepositoryImpl(
      remoteDataSource: sl(),
      localDataSource: sl(),
      networkInfo: sl(),
    ),
  );

  sl.registerLazySingleton(
    () => RecognziePlantRemoteDataSource(
      client: sl(),
    ),
  );

  sl.registerLazySingleton<
      RemoteDataSource<List<PlantModel>, CommonRequestModel>>(
    () => PlantRemoteDataSource(
      client: sl(),
    ),
  );

  sl.registerLazySingletonAsync<
      LocalDataSource<List<PlantModel>, CommonRequestModel>>(() async {
    return PlantLocalDataSource(
      plantBox: await Hive.openBox<PlantModel>('PlantBox'),
    );
  });

  await sl.isReady<LocalDataSource<List<PlantModel>, CommonRequestModel>>();
  //! Groups
  sl.registerFactory(
    () => GroupCubit(
      loadGroups: sl(),
      uploadGroups: sl(),
    ),
  );

  sl.registerLazySingleton(
    () => LoadGroups(
      commonRepository: sl(),
      authRepository: sl(),
      fromModelConverter: (e) {
        return GroupEntity.fromModel(e);
      },
    ),
  );
  sl.registerLazySingleton(
    () => UploadGroup(
      commonRepository: sl(),
      authRepository: sl(),
      fromEntityConverter: (e) {
        return GroupModel.fromEntity(e, "-1");
      },
    ),
  );

  sl.registerLazySingleton<
      CommonRepository<List<GroupModel>, CommonRequestModel>>(
    () => GroupRepositoryImpl(
      remoteDataSource: sl(),
      localDataSource: sl(),
      networkInfo: sl(),
    ),
  );

  sl.registerLazySingleton<
      RemoteDataSource<List<GroupModel>, CommonRequestModel>>(
    () => GroupRemoteDataSource(
      client: sl(),
    ),
  );

  sl.registerLazySingletonAsync<
      LocalDataSource<List<GroupModel>, CommonRequestModel>>(() async {
    return GroupLocalDataSource(
      groupBox: await Hive.openBox<GroupModel>('GroupBox'),
    );
  });

  await sl.isReady<LocalDataSource<List<GroupModel>, CommonRequestModel>>();
  //! GrowStage
  sl.registerFactory(
    () => GrowStageCubit(
      loadGrowStages: sl(),
    ),
  );
  sl.registerLazySingleton(
    () => LoadGrowStages(
      commonRepository: sl(),
      authRepository: sl(),
      fromModelConverter: (e) {
        return GrowStageEntity.fromModel(e);
      },
    ),
  );

  sl.registerLazySingleton<
      CommonRepository<List<GrowStageModel>, CommonRequestModel>>(
    () => GrowStageRepositoryImpl(
      remoteDataSource: sl(),
      localDataSource: sl(),
      networkInfo: sl(),
    ),
  );

  sl.registerLazySingleton<
      RemoteDataSource<List<GrowStageModel>, CommonRequestModel>>(
    () => GrowStageRemoteDataSource(
      client: sl(),
    ),
  );

  sl.registerLazySingletonAsync<
      LocalDataSource<List<GrowStageModel>, CommonRequestModel>>(() async {
    return GrowStageLocalDataSource(
      growStageBox: await Hive.openBox<GrowStageModel>('GrowStageBox'),
    );
  });

  await sl.isReady<LocalDataSource<List<GrowStageModel>, CommonRequestModel>>();
  //! LightNeed
  sl.registerFactory(
    () => LightNeedCubit(
      loadLightNeeds: sl(),
    ),
  );
  sl.registerLazySingleton(
    () => LoadLightNeeds(
      commonRepository: sl(),
      authRepository: sl(),
      fromModelConverter: (e) {
        return LightNeedEntity.fromModel(e);
      },
    ),
  );

  sl.registerLazySingleton<
      CommonRepository<List<LightNeedModel>, CommonRequestModel>>(
    () => LightNeedRepositoryImpl(
      remoteDataSource: sl(),
      localDataSource: sl(),
      networkInfo: sl(),
    ),
  );

  sl.registerLazySingleton<
      RemoteDataSource<List<LightNeedModel>, CommonRequestModel>>(
    () => LightNeedRemoteDataSource(
      client: sl(),
    ),
  );

  sl.registerLazySingletonAsync<
      LocalDataSource<List<LightNeedModel>, CommonRequestModel>>(() async {
    return LightNeedLocalDataSource(
      lightNeedBox: await Hive.openBox<LightNeedModel>('LightNeedBox'),
    );
  });

  await sl.isReady<LocalDataSource<List<LightNeedModel>, CommonRequestModel>>();
  //! WateringNeed
  sl.registerFactory(
    () => WateringNeedCubit(
      loadWateringNeeds: sl(),
    ),
  );
  sl.registerLazySingleton(
    () => LoadWateringNeeds(
      commonRepository: sl(),
      authRepository: sl(),
      fromModelConverter: (e) {
        return WateringNeedEntity.fromModel(e);
      },
    ),
  );

  sl.registerLazySingleton<
      CommonRepository<List<WateringNeedModel>, CommonRequestModel>>(
    () => WateringNeedRepositoryImpl(
      remoteDataSource: sl(),
      localDataSource: sl(),
      networkInfo: sl(),
    ),
  );

  sl.registerLazySingleton<
      RemoteDataSource<List<WateringNeedModel>, CommonRequestModel>>(
    () => WateringNeedRemoteDataSource(
      client: sl(),
    ),
  );

  sl.registerLazySingletonAsync<
      LocalDataSource<List<WateringNeedModel>, CommonRequestModel>>(() async {
    return WateringNeedLocalDataSource(
      wateringNeedBox: await Hive.openBox<WateringNeedModel>('WateringNeedBox'),
    );
  });

  await sl
      .isReady<LocalDataSource<List<WateringNeedModel>, CommonRequestModel>>();

  //! PlantType
  sl.registerFactory(
    () => PlantTypeCubit(
      loadPlantTypes: sl(),
    ),
  );
  sl.registerLazySingleton(
    () => LoadPlantTypes(
      commonRepository: sl(),
      authRepository: sl(),
      fromModelConverter: (e) {
        return PlantTypeEntity.fromModel(e);
      },
    ),
  );

  sl.registerLazySingleton<
      CommonRepository<List<PlantTypeModel>, CommonRequestModel>>(
    () => PlantTypeRepositoryImpl(
      remoteDataSource: sl(),
      localDataSource: sl(),
      networkInfo: sl(),
    ),
  );

  sl.registerLazySingleton<
      RemoteDataSource<List<PlantTypeModel>, CommonRequestModel>>(
    () => PlantTypeRemoteDataSource(
      client: sl(),
    ),
  );

  sl.registerLazySingletonAsync<
      LocalDataSource<List<PlantTypeModel>, CommonRequestModel>>(() async {
    return PlantTypeLocalDataSource(
      plantTypeBox: await Hive.openBox<PlantTypeModel>('PlantTypeBox'),
    );
  });

  await sl.isReady<LocalDataSource<List<PlantTypeModel>, CommonRequestModel>>();

  //! PlantVariety
  sl.registerFactory(
    () => PlantVarietyCubit(
      loadPlantVarieties: sl(),
    ),
  );
  sl.registerLazySingleton(
    () => LoadPlantVarieties(
      commonRepository: sl(),
      authRepository: sl(),
      fromModelConverter: (e) {
        return PlantVarietyEntity.fromModel(e);
      },
    ),
  );

  sl.registerLazySingleton<
      CommonRepository<List<PlantVarietyModel>, CommonRequestModel>>(
    () => PlantVarietyRepositoryImpl(
      remoteDataSource: sl(),
      localDataSource: sl(),
      networkInfo: sl(),
    ),
  );

  sl.registerLazySingleton<
      RemoteDataSource<List<PlantVarietyModel>, CommonRequestModel>>(
    () => PlantVarietyRemoteDataSource(
      client: sl(),
    ),
  );

  sl.registerLazySingletonAsync<
      LocalDataSource<List<PlantVarietyModel>, CommonRequestModel>>(() async {
    return PlantVarietyLocalDataSource(
      plantVarietyBox: await Hive.openBox<PlantVarietyModel>('PlantVarietyBox'),
    );
  });

  await sl
      .isReady<LocalDataSource<List<PlantVarietyModel>, CommonRequestModel>>();
  //! Events
  sl.registerFactory(
    () => EventCubit(loadEvents: sl(), uploadEvent: sl(), deleteEvent: sl()),
  );

  sl.registerLazySingleton(
    () => LoadEvents(
      commonRepository: sl(),
      authRepository: sl(),
      fromModelConverter: (e) {
        return EventEntity.fromModel(e);
      },
    ),
  );
  sl.registerLazySingleton(
    () => UploadEvent(
      commonRepository: sl(),
      authRepository: sl(),
      fromEntityConverter: (e) {
        return EventModel.fromEntity(e, "-1", -1);
      },
    ),
  );

  sl.registerLazySingleton(
    () => DeleteEvent(
      commonRepository: sl(),
      authRepository: sl(),
    ),
  );

  sl.registerLazySingleton<
      CommonRepository<List<EventModel>, HasPlantidRequestModel>>(
    () => EventRepositoryImpl(
      remoteDataSource: sl(),
      localDataSource: sl(),
      networkInfo: sl(),
    ),
  );

  sl.registerLazySingleton<
      RemoteDataSource<List<EventModel>, HasPlantidRequestModel>>(
    () => EventRemoteDataSource(
      client: sl(),
    ),
  );

  sl.registerLazySingletonAsync<
      LocalDataSource<List<EventModel>, HasPlantidRequestModel>>(() async {
    return EventLocalDataSource(
      eventBox: await Hive.openBox<EventModel>('EventBox'),
    );
  });

  await sl.isReady<LocalDataSource<List<EventModel>, HasPlantidRequestModel>>();

  //! Gardens
  sl.registerFactory(
    () => GardenCubit(
      deleteGarden: sl(),
      loadGardens: sl(),
      uploadGarden: sl(),
    ),
  );

  sl.registerLazySingleton(
    () => DeleteGarden(
      commonRepository: sl(),
      authRepository: sl(),
    ),
  );
  sl.registerLazySingleton(
    () => LoadGardens(
      commonRepository: sl(),
      authRepository: sl(),
      fromModelConverter: (e) {
        return GardenEntity.fromModel(e);
      },
    ),
  );
  sl.registerLazySingleton(
    () => UploadGarden(
      commonRepository: sl(),
      authRepository: sl(),
      fromEntityConverter: (e) {
        return GardenModel.fromEntity(e, "-1");
      },
    ),
  );

  sl.registerLazySingleton<
      CommonRepository<List<GardenModel>, CommonRequestModel>>(
    () => GardenRepositoryImpl(
      localDataSource: sl(),
      remoteDataSource: sl(),
      networkInfo: sl(),
    ),
  );

  sl.registerLazySingleton<
      RemoteDataSource<List<GardenModel>, CommonRequestModel>>(
    () => GardenRemoteDataSource(
      client: sl(),
    ),
  );

  sl.registerLazySingletonAsync<
      LocalDataSource<List<GardenModel>, CommonRequestModel>>(() async {
    return GardenLocalDataSource(
      gardenBox: await Hive.openBox<GardenModel>('GardenBox'),
    );
  });

  await sl.isReady<LocalDataSource<List<GardenModel>, CommonRequestModel>>();

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
