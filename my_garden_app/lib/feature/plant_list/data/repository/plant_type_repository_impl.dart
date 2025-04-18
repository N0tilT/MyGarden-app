import 'package:dartz/dartz.dart';
import 'package:my_garden_app/core/data/error/exception.dart';
import 'package:my_garden_app/core/data/error/failure.dart';
import 'package:my_garden_app/core/data/repository/repository.dart';
import 'package:my_garden_app/core/network/network_info.dart';
import 'package:my_garden_app/feature/plant_list/data/datasource/local/plant_type_local_data_source.dart';
import 'package:my_garden_app/feature/plant_list/data/datasource/remote/plant_type_remote_data_source.dart';
import 'package:my_garden_app/feature/plant_list/data/model/garden_request_model.dart';
import 'package:my_garden_app/feature/plant_list/data/model/plant_type_model.dart';
import 'package:my_garden_app/feature/plant_list/domain/repositories/plant_type_repository.dart';

class PlantTypeRepositoryImpl implements PlantTypeRepository {
  final PlantTypeRemoteDataSource remoteDataSource;
  final PlantTypeLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  PlantTypeRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, List<PlantTypeModel>>> load(
    GardenRequestModel request,
    String token, [
    bool remote = true,
  ]) async {
    return await loadData<PlantTypeLocalDataSource, PlantTypeRemoteDataSource,
        List<PlantTypeModel>, GardenRequestModel>(
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
    List<PlantTypeModel> request,
    String token, [
    bool remote = true,
  ]) async {
    return await uploadData<PlantTypeLocalDataSource, PlantTypeRemoteDataSource,
        List<PlantTypeModel>, void>(
      localDataSource,
      remoteDataSource,
      remote,
      request,
      networkInfo,
      token,
    );
  }

  @override
  Future<Either<Failure, PlantTypeModel>> loadById(
    int request,
    String token, [
    bool remote = false,
  ]) async {
    try {
      // ignore: void_checks
      final plantTypes = await localDataSource.load(() {});
      return Right(
        plantTypes
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
