import 'package:dartz/dartz.dart';
import 'package:my_garden_app/core/data/datasource/datasource.dart';
import 'package:my_garden_app/core/data/error/exception.dart';
import 'package:my_garden_app/core/data/error/failure.dart';
import 'package:my_garden_app/core/network/network_info.dart';

Future<Either<Failure, ResponseType>> loadData<Local extends LocalDataSource,
    Remote extends RemoteDataSource, ResponseType, RequestType>(
  Local localDataSource,
  Remote remoteDataSource,
  bool remote,
  RequestType request,
  NetworkInfo networkInfo,
  String token,
) async {
  if (!(await networkInfo.isConnected && remote)) {
    try {
      return Right(await localDataSource.load(request) as ResponseType);
    } on CacheException {
      return const Left(
        CacheFailure(message: "Ошибка локального хранилища"),
      );
    }
  } else {
    try {
      final remoteLoad =
          await remoteDataSource.load(request, token) as ResponseType;
      await localDataSource.update(remoteLoad);
      return Right(await localDataSource.load(request) as ResponseType);
    } on ServerException {
      return const Left(ServerFailure(message: "Ошибка сервера"));
    } on AuthException {
      return const Left(AuthFailure(message: "Ошибка авторизации"));
    }
  }
}

Future<Either<Failure, bool>> uploadData<Local extends LocalDataSource,
    Remote extends RemoteDataSource, ResponseType, RequestType>(
  Local localDataSource,
  Remote remoteDataSource,
  bool remote,
  RequestType request,
  NetworkInfo networkInfo,
  String token,
) async {
  if (!(await networkInfo.isConnected && remote)) {
    try {
      await localDataSource.update(request);
      return const Right(true);
    } on CacheException {
      return const Left(
        CacheFailure(message: "Ошибка локального хранилища"),
      );
    }
  } else {
    try {
      await remoteDataSource.upload(request, token);
      return const Right(true);
    } on ServerException {
      return const Left(ServerFailure(message: "Ошибка сервера"));
    } on AuthException {
      return const Left(AuthFailure(message: "Ошибка авторизации"));
    }
  }
}

Future<Either<Failure, bool>>
    deleteData<Local extends LocalDataSource, Remote extends RemoteDataSource>(
  Local localDataSource,
  Remote remoteDataSource,
  bool remote,
  int request,
  NetworkInfo networkInfo,
  String token,
) async {
  if (!(await networkInfo.isConnected && remote)) {
    try {
      await localDataSource.delete(request);
      return const Right(true);
    } on CacheException {
      return const Left(
        CacheFailure(message: "Ошибка локального хранилища"),
      );
    }
  } else {
    try {
      await remoteDataSource.delete(request, token);
      return const Right(true);
    } on ServerException {
      return const Left(ServerFailure(message: "Ошибка сервера"));
    } on AuthException {
      return const Left(AuthFailure(message: "Ошибка авторизации"));
    }
  }
}
