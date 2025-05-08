import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:my_garden_app/core/data/error/exception.dart';
import 'package:my_garden_app/core/data/error/failure.dart';
import 'package:my_garden_app/core/network/network_info.dart';
import 'package:my_garden_app/feature/plant_list/data/datasource/remote/recognzie_plant_remote_data_source.dart';
import 'package:my_garden_app/feature/plant_list/domain/entities/plant_recognition_response_entity.dart';
import 'package:my_garden_app/feature/plant_list/domain/repositories/plant_recognition_repositroy.dart';

class PlantRecognitionRepositoryImpl implements PlantRecognitionRepository {
  final RecognziePlantRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  PlantRecognitionRepositoryImpl({
    required this.remoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, PlantRecognitionResponseEntity>> recognize(
      File request, String token,
      [bool remote = true,]) async {
    if (!(await networkInfo.isConnected && remote)) {
      return const Left(
        CacheFailure(message: "Ошибка подключения к сети"),
      );
    } else {
      try {
        final remoteLoad = await remoteDataSource.recognize(request, token);
        return Right(PlantRecognitionResponseEntity.fromModel(remoteLoad));
      } on ServerException {
        return const Left(ServerFailure(message: "Ошибка сервера"));
      } on AuthException {
        return const Left(AuthFailure(message: "Ошибка авторизации"));
      }
    }
  }
}
