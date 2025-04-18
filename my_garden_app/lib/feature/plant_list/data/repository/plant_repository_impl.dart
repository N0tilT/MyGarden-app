import 'package:dartz/dartz.dart';
import 'package:my_garden_app/core/data/error/exception.dart';
import 'package:my_garden_app/core/data/error/failure.dart';
import 'package:my_garden_app/core/data/repository/repository.dart';
import 'package:my_garden_app/core/network/network_info.dart';
import 'package:my_garden_app/feature/plant_list/data/datasource/local/plant_local_data_source.dart';
import 'package:my_garden_app/feature/plant_list/data/datasource/remote/plant_remote_data_source.dart';
import 'package:my_garden_app/feature/plant_list/data/model/plant_model.dart';
import 'package:my_garden_app/feature/plant_list/data/model/plant_request_model.dart';
import 'package:my_garden_app/feature/plant_list/domain/repositories/plant_repository.dart';

class PlantRepositoryImpl implements PlantRepository {
  final PlantRemoteDataSource remoteDataSource;
  final PlantLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  PlantRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, List<PlantModel>>> load(
    PlantRequestModel request,
    String token, [
    bool remote = true,
  ]) async {
    return await loadData<PlantLocalDataSource, PlantRemoteDataSource,
            List<PlantModel>, PlantRequestModel>(
        localDataSource, remoteDataSource, remote, request, networkInfo, token);
  }

  @override
  Future<Either<Failure, void>> add(
    List<PlantModel> request,
    String token, [
    bool remote = true,
  ]) async {
    return await uploadData<PlantLocalDataSource, PlantRemoteDataSource,
            List<PlantModel>, void>(
        localDataSource, remoteDataSource, remote, request, networkInfo, token);
  }

  @override
  Future<Either<Failure, PlantModel>> loadByPlantId(
    int request,
    String token, [
    bool remote = false,
  ]) async {
    try {
      // ignore: void_checks
      final plants = await localDataSource.load(() {});
      return Right(
        plants
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
