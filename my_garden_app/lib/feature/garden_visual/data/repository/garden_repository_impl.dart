import 'package:dartz/dartz.dart';
import 'package:my_garden_app/core/data/error/exception.dart';
import 'package:my_garden_app/core/data/error/failure.dart';
import 'package:my_garden_app/core/network/network_info.dart';
import 'package:my_garden_app/feature/garden_visual/data/datasource/garden_local_data_source.dart';
import 'package:my_garden_app/feature/garden_visual/data/model/garden_model.dart';
import 'package:my_garden_app/feature/garden_visual/domain/repositories/garden_repository.dart';

class GardenRepositoryImpl implements GardenRepository {
  final GardenLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  GardenRepositoryImpl({
    required this.localDataSource,
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
}
