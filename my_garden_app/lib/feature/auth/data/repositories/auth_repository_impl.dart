import 'package:dartz/dartz.dart';
import 'package:my_garden_app/core/data/error/exception.dart';
import 'package:my_garden_app/core/data/error/failure.dart';
import 'package:my_garden_app/core/network/network_info.dart';
import 'package:my_garden_app/feature/auth/data/datasources/auth_local_data_source.dart';
import 'package:my_garden_app/feature/auth/data/datasources/auth_remote_data_source.dart';
import 'package:my_garden_app/feature/auth/data/models/security_request_model.dart';
import 'package:my_garden_app/feature/auth/data/models/security_response_model.dart';
import 'package:my_garden_app/feature/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;
  final AuthLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  AuthRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, SecurityResponseModel>> auth(
    SecurityRequestModel request,
  ) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteAuth = await remoteDataSource.auth(request);
        localDataSource.add(remoteAuth);
        return Right(remoteAuth);
      } on ServerException {
        return const Left(ServerFailure(message: "Ошибка сервера"));
      }
    } else {
      return const Left(
        CacheFailure(message: "Отсутствует подключение к сети"),
      );
    }
  }

  @override
  Future<Either<Failure, SecurityResponseModel>> getUserData(
    bool needValidate,
  ) async {
    try {
      SecurityResponseModel userData = await localDataSource.loadUserData();
      if (userData.token.isEmpty) throw CacheException();
      if (!needValidate) return Right(userData);

      if (await networkInfo.isConnected) {
        if (!await remoteDataSource.validateToken(
          userData.user?.userName ?? "",
          userData.token,
        )) {
          try {
            userData = await remoteDataSource.refreshToken(userData);
            localDataSource.updateToken(userData);
          } on ServerException {
            return const Left(ServerFailure(message: "Сервер не доступен"));
          }
        }
        return Right(userData);
      } else {
        return const Left(ServerFailure(message: "Сервер не доступен"));
      }
    } on CacheException {
      return const Left(CacheFailure(message: "Ошибка получения токена"));
    }
  }

  @override
  Future<Either<Failure, void>> logout() async {
    try {
      final token = await localDataSource.logout();
      return Right(token);
    } on CacheException {
      return const Left(ServerFailure(message: "Ошибка сервера"));
    }
  }
}
