import 'package:dartz/dartz.dart' show Either;
import 'package:my_garden_app/core/data/datasource/datasource.dart';
import 'package:my_garden_app/core/data/error/failure.dart';
import 'package:my_garden_app/core/data/repository/repository.dart';
import 'package:my_garden_app/core/domain/repositories/common_repository.dart';
import 'package:my_garden_app/core/network/network_info.dart';

class CommonRepositoryImpl<CommonResponseType, CommonRequestType>
    implements CommonRepository<CommonResponseType, CommonRequestType> {
  final RemoteDataSource<CommonResponseType, CommonRequestType>
      remoteDataSource;
  final LocalDataSource<CommonResponseType, CommonRequestType> localDataSource;
  final NetworkInfo networkInfo;

  CommonRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, void>> add(
    CommonResponseType request,
    String token, [
    bool remote = true,
  ]) async {
    return await uploadData<LocalDataSource, RemoteDataSource,
        CommonResponseType, void>(
      localDataSource,
      remoteDataSource,
      remote,
      // ignore: void_checks
      request,
      networkInfo,
      token,
    );
  }

  @override
  Future<Either<Failure, void>> delete(
    int request,
    String token, [
    bool remote = true,
  ]) async {
    return await deleteData<LocalDataSource, RemoteDataSource>(
      localDataSource,
      remoteDataSource,
      remote,
      // ignore: void_checks
      request,
      networkInfo,
      token,
    );
  }

  @override
  Future<Either<Failure, CommonResponseType>> load(
    CommonRequestType request,
    String token, [
    bool remote = true,
  ]) async {
    return await loadData<LocalDataSource, RemoteDataSource, CommonResponseType,
        CommonRequestType>(
      localDataSource,
      remoteDataSource,
      remote,
      request,
      networkInfo,
      token,
    );
  }
}
