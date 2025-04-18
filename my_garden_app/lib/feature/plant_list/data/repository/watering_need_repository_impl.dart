import 'package:dartz/dartz.dart';
import 'package:my_garden_app/core/data/error/exception.dart';
import 'package:my_garden_app/core/data/error/failure.dart';
import 'package:my_garden_app/core/data/repository/repository.dart';
import 'package:my_garden_app/core/network/network_info.dart';
import 'package:my_garden_app/feature/plant_list/data/datasource/local/watering_need_local_data_source.dart';
import 'package:my_garden_app/feature/plant_list/data/datasource/remote/watering_need_remote_data_source.dart';
import 'package:my_garden_app/feature/plant_list/data/model/garden_request_model.dart';
import 'package:my_garden_app/feature/plant_list/data/model/watering_need_model.dart';
import 'package:my_garden_app/feature/plant_list/domain/repositories/watering_need_repository.dart';

class WateringNeedRepositoryImpl implements WateringNeedRepository {
  final WateringNeedRemoteDataSource remoteDataSource;
  final WateringNeedLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  WateringNeedRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, List<WateringNeedModel>>> load(
    GardenRequestModel request,
    String token, [
    bool remote = true,
  ]) async {
    return await loadData<
        WateringNeedLocalDataSource,
        WateringNeedRemoteDataSource,
        List<WateringNeedModel>,
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
    List<WateringNeedModel> request,
    String token, [
    bool remote = true,
  ]) async {
    return await uploadData<WateringNeedLocalDataSource,
        WateringNeedRemoteDataSource, List<WateringNeedModel>, void>(
      localDataSource,
      remoteDataSource,
      remote,
      request,
      networkInfo,
      token,
    );
  }

  @override
  Future<Either<Failure, WateringNeedModel>> loadById(
    int request,
    String token, [
    bool remote = false,
  ]) async {
    try {
      // ignore: void_checks
      final wateringNeeds = await localDataSource.load(() {});
      return Right(
        wateringNeeds
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
