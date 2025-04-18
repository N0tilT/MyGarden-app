import 'package:dartz/dartz.dart';
import 'package:my_garden_app/core/data/error/exception.dart';
import 'package:my_garden_app/core/data/error/failure.dart';
import 'package:my_garden_app/core/data/repository/repository.dart';
import 'package:my_garden_app/core/network/network_info.dart';
import 'package:my_garden_app/feature/plant_list/data/datasource/local/group_local_data_source.dart';
import 'package:my_garden_app/feature/plant_list/data/datasource/remote/group_remote_data_source.dart';
import 'package:my_garden_app/feature/plant_list/data/model/garden_request_model.dart';
import 'package:my_garden_app/feature/plant_list/data/model/group_model.dart';
import 'package:my_garden_app/feature/plant_list/domain/repositories/group_repository.dart';

class GroupRepositoryImpl implements GroupRepository {
  final GroupRemoteDataSource remoteDataSource;
  final GroupLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  GroupRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, List<GroupModel>>> load(
    GardenRequestModel request,
    String token, [
    bool remote = true,
  ]) async {
    return await loadData<GroupLocalDataSource, GroupRemoteDataSource,
        List<GroupModel>, GardenRequestModel>(
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
    List<GroupModel> request,
    String token, [
    bool remote = true,
  ]) async {
    return await uploadData<GroupLocalDataSource, GroupRemoteDataSource,
        List<GroupModel>, void>(
      localDataSource,
      remoteDataSource,
      remote,
      request,
      networkInfo,
      token,
    );
  }

  @override
  Future<Either<Failure, GroupModel>> loadById(
    int request,
    String token, [
    bool remote = false,
  ]) async {
    try {
      // ignore: void_checks
      final groups = await localDataSource.load(() {});
      return Right(
        groups
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
