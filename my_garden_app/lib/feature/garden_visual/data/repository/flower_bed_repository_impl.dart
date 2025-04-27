import 'package:dartz/dartz.dart';
import 'package:my_garden_app/core/data/error/exception.dart';
import 'package:my_garden_app/core/data/error/failure.dart';
import 'package:my_garden_app/core/network/network_info.dart';
import 'package:my_garden_app/feature/garden_visual/data/datasource/local/flower_bed_local_data_source.dart';
import 'package:my_garden_app/feature/garden_visual/data/model/flower_bed_model.dart';
import 'package:my_garden_app/feature/garden_visual/domain/repositories/flower_bed_repository.dart';

class FlowerBedRepositoryImpl implements FlowerBedRepository {
  final FlowerBedLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  FlowerBedRepositoryImpl({
    required this.localDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, List<FlowerBedModel>>> load(
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
    List<FlowerBedModel> request, [
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
