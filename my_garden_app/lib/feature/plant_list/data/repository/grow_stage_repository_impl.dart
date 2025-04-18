import 'package:dartz/dartz.dart';
import 'package:my_garden_app/core/data/error/exception.dart';
import 'package:my_garden_app/core/data/error/failure.dart';
import 'package:my_garden_app/core/data/repository/repository.dart';
import 'package:my_garden_app/core/network/network_info.dart';
import 'package:my_garden_app/feature/plant_list/data/datasource/local/grow_stage_local_data_source.dart';
import 'package:my_garden_app/feature/plant_list/data/datasource/remote/grow_stage_remote_data_source.dart';
import 'package:my_garden_app/feature/plant_list/data/model/garden_request_model.dart';
import 'package:my_garden_app/feature/plant_list/data/model/grow_stage_model.dart';
import 'package:my_garden_app/feature/plant_list/domain/repositories/grow_stage_repository.dart';

class GrowStageRepositoryImpl implements GrowStageRepository {
  final GrowStageRemoteDataSource remoteDataSource;
  final GrowStageLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  GrowStageRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, List<GrowStageModel>>> load(
    GardenRequestModel request,
    String token, [
    bool remote = true,
  ]) async {
    return await loadData<GrowStageLocalDataSource, GrowStageRemoteDataSource,
        List<GrowStageModel>, GardenRequestModel>(
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
    List<GrowStageModel> request,
    String token, [
    bool remote = true,
  ]) async {
    return await uploadData<GrowStageLocalDataSource, GrowStageRemoteDataSource,
        List<GrowStageModel>, void>(
      localDataSource,
      remoteDataSource,
      remote,
      request,
      networkInfo,
      token,
    );
  }

  @override
  Future<Either<Failure, GrowStageModel>> loadById(
    int request,
    String token, [
    bool remote = false,
  ]) async {
    try {
      // ignore: void_checks
      final growStages = await localDataSource.load(() {});
      return Right(
        growStages
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
