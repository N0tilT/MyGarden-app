import 'package:dartz/dartz.dart';
import 'package:my_garden_app/core/data/error/exception.dart';
import 'package:my_garden_app/core/data/error/failure.dart';
import 'package:my_garden_app/core/data/repository/repository.dart';
import 'package:my_garden_app/core/network/network_info.dart';
import 'package:my_garden_app/feature/plant_list/data/datasource/local/garden_type_local_data_source.dart';
import 'package:my_garden_app/feature/plant_list/data/datasource/remote/garden_type_remote_data_source.dart';
import 'package:my_garden_app/feature/plant_list/data/model/garden_request_model.dart';
import 'package:my_garden_app/feature/plant_list/data/model/garden_type_model.dart';
import 'package:my_garden_app/feature/plant_list/domain/repositories/garden_type_repository.dart';

class GardenTypeRepositoryImpl implements GardenTypeRepository {
  final GardenTypeRemoteDataSource remoteDataSource;
  final GardenTypeLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  GardenTypeRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, List<GardenTypeModel>>> load(
    GardenRequestModel request,
    String token, [
    bool remote = true,
  ]) async {
    return await loadData<GardenTypeLocalDataSource, GardenTypeRemoteDataSource,
        List<GardenTypeModel>, GardenRequestModel>(
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
    List<GardenTypeModel> request,
    String token, [
    bool remote = true,
  ]) async {
    return await uploadData<GardenTypeLocalDataSource,
        GardenTypeRemoteDataSource, List<GardenTypeModel>, void>(
      localDataSource,
      remoteDataSource,
      remote,
      request,
      networkInfo,
      token,
    );
  }

  @override
  Future<Either<Failure, GardenTypeModel>> loadById(
    int request,
    String token, [
    bool remote = false,
  ]) async {
    try {
      // ignore: void_checks
      final gardenTypes = await localDataSource.load(() {});
      return Right(
        gardenTypes
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
