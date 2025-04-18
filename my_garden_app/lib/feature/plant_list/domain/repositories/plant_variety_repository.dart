import 'package:dartz/dartz.dart';
import 'package:my_garden_app/core/data/error/failure.dart';
import 'package:my_garden_app/feature/plant_list/data/model/garden_request_model.dart';
import 'package:my_garden_app/feature/plant_list/data/model/plant_variety_model.dart';

abstract class PlantVarietyRepository {
  Future<Either<Failure, PlantVarietyModel>> loadById(
    int request,
    String token, [
    bool remote = false,
  ]);

  Future<Either<Failure, List<PlantVarietyModel>>> load(
    GardenRequestModel request,
    String token, [
    bool remote = true,
  ]);

  Future<Either<Failure, void>> add(
    List<PlantVarietyModel> request,
    String token, [
    bool remote = true,
  ]);
}
