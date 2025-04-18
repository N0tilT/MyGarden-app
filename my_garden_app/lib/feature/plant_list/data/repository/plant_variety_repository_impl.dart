import 'package:dartz/dartz.dart';
import 'package:my_garden_app/core/data/error/exception.dart';
import 'package:my_garden_app/core/data/error/failure.dart';
import 'package:my_garden_app/core/data/repository/repository.dart';
import 'package:my_garden_app/core/network/network_info.dart';
import 'package:my_garden_app/feature/plant_list/data/datasource/local/plant_variety_local_data_source.dart';
import 'package:my_garden_app/feature/plant_list/data/datasource/remote/plant_variety_remote_data_source.dart';
import 'package:my_garden_app/feature/plant_list/data/model/garden_request_model.dart';
import 'package:my_garden_app/feature/plant_list/data/model/plant_variety_model.dart';
import 'package:my_garden_app/feature/plant_list/domain/repositories/plant_variety_repository.dart';

class PlantVarietyRepositoryImpl implements PlantVarietyRepository {
  final PlantVarietyRemoteDataSource remoteDataSource;
  final PlantVarietyLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  PlantVarietyRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, List<PlantVarietyModel>>> load(
    GardenRequestModel request,
    String token, [
    bool remote = true,
  ]) async {
    return await loadData<
        PlantVarietyLocalDataSource,
        PlantVarietyRemoteDataSource,
        List<PlantVarietyModel>,
        GardenRequestModel>(
      localDataSource,
      remoteDataSource,
      remote,
      request,
      networkInfo,
      token,
    );
  }

  @override
  Future<Either<Failure, void>> add(
    List<PlantVarietyModel> request,
    String token, [
    bool remote = true,
  ]) async {
    return await uploadData<PlantVarietyLocalDataSource,
        PlantVarietyRemoteDataSource, List<PlantVarietyModel>, void>(
      localDataSource,
      remoteDataSource,
      remote,
      request,
      networkInfo,
      token,
    );
  }

  @override
  Future<Either<Failure, PlantVarietyModel>> loadById(
    int request,
    String token, [
    bool remote = false,
  ]) async {
    try {
      // ignore: void_checks
      final plantVarietys = await localDataSource.load(() {});
      return Right(
        plantVarietys
            .where(
              (element) => element.id == request,
            )
            .first,
      );
    } on CacheException {
      return const Left(
        CacheFailure(message: "Ошибка локального хранилища"),
      );
    }
  }
}
