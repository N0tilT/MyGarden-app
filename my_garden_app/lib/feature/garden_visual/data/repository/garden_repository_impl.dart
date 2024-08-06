import 'package:dartz/dartz.dart';
import 'package:my_garden_app/core/data/error/exception.dart';
import 'package:my_garden_app/core/data/error/failure.dart';
import 'package:my_garden_app/core/network/network_info.dart';
import 'package:my_garden_app/feature/garden_visual/data/datasource/garden_local_data_source.dart';
import 'package:my_garden_app/feature/garden_visual/data/datasource/selected_garden_datasource.dart';
import 'package:my_garden_app/feature/garden_visual/data/model/garden_model.dart';
import 'package:my_garden_app/feature/garden_visual/domain/repositories/garden_repository.dart';

class GardenRepositoryImpl implements GardenRepository {
  final GardenLocalDataSource localDataSource;
  final SelectedGardenDataSource selectedGardenDatasource;
  final NetworkInfo networkInfo;

  GardenRepositoryImpl({
    required this.localDataSource,
    required this.selectedGardenDatasource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, List<GardenModel>>> load(
    void request, [
    bool remote = true,
  ]) async {
    try {
      return Right(await localDataSource.load(request));
    } on CacheException {
      return const Left(
        CacheFailure(message: "Ошибка локального хранилища"),
      );
    }
  }

  @override
  Future<Either<Failure, void>> update(
    List<GardenModel> request, [
    bool remote = true,
  ]) async {
    try {
      return Right(await localDataSource.update(request));
    } on CacheException {
      return const Left(
        CacheFailure(message: "Ошибка локального хранилища"),
      );
    }
  }

  @override
  Future<Either<Failure, GardenModel>> getSelectedGarden(void request) async {
    try {
      final localLoad = await selectedGardenDatasource.getGarden();
      return Right(localLoad);
    } on CacheException {
      return const Left(CacheFailure(message: "Ошибка сервера"));
    }
  }

  @override
  Future<Either<Failure, void>> setSelectedGarden(GardenModel request) async {
    try {
      final localLoad = await selectedGardenDatasource.setGarden(request);
      return Right(localLoad);
    } on CacheException {
      return const Left(CacheFailure(message: "Ошибка сервера"));
    }
  }
}
