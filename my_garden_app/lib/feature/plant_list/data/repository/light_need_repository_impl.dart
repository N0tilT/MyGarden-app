import 'package:dartz/dartz.dart';
import 'package:my_garden_app/core/data/error/exception.dart';
import 'package:my_garden_app/core/data/error/failure.dart';
import 'package:my_garden_app/core/data/repository/repository.dart';
import 'package:my_garden_app/core/network/network_info.dart';
import 'package:my_garden_app/feature/plant_list/data/datasource/local/light_need_local_data_source.dart';
import 'package:my_garden_app/feature/plant_list/data/datasource/remote/light_need_remote_data_source.dart';
import 'package:my_garden_app/feature/plant_list/data/model/garden_request_model.dart';
import 'package:my_garden_app/feature/plant_list/data/model/light_need_model.dart';
import 'package:my_garden_app/feature/plant_list/domain/repositories/light_need_repository.dart';

class LightNeedRepositoryImpl implements LightNeedRepository {
  final LightNeedRemoteDataSource remoteDataSource;
  final LightNeedLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  LightNeedRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, List<LightNeedModel>>> load(
    GardenRequestModel request,
    String token, [
    bool remote = true,
  ]) async {
    return await loadData<LightNeedLocalDataSource, LightNeedRemoteDataSource,
        List<LightNeedModel>, GardenRequestModel>(
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
    List<LightNeedModel> request,
    String token, [
    bool remote = true,
  ]) async {
    return await uploadData<LightNeedLocalDataSource, LightNeedRemoteDataSource,
        List<LightNeedModel>, void>(
      localDataSource,
      remoteDataSource,
      remote,
      request,
      networkInfo,
      token,
    );
  }

  @override
  Future<Either<Failure, LightNeedModel>> loadById(
    int request,
    String token, [
    bool remote = false,
  ]) async {
    try {
      // ignore: void_checks
      final lightNeeds = await localDataSource.load(() {});
      return Right(
        lightNeeds
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
