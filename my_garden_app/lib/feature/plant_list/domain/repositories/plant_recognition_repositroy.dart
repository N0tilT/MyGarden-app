import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:my_garden_app/core/data/error/failure.dart';
import 'package:my_garden_app/feature/plant_list/domain/entities/plant_recognition_response_entity.dart';

abstract class PlantRecognitionRepository {
  Future<Either<Failure, PlantRecognitionResponseEntity>> recognize(
    File request,
    String token, [
    bool remote = true,
  ]);
}
