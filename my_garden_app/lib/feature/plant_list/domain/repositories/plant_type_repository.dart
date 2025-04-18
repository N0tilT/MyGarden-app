import 'package:dartz/dartz.dart';
import 'package:my_garden_app/core/data/error/failure.dart';
import 'package:my_garden_app/feature/plant_list/data/model/garden_request_model.dart';
import 'package:my_garden_app/feature/plant_list/data/model/plant_type_model.dart';

abstract class PlantTypeRepository {
  Future<Either<Failure, PlantTypeModel>> loadById(
    int request,
    String token, [
    bool remote = false,
  ]);

  Future<Either<Failure, List<PlantTypeModel>>> load(
    GardenRequestModel request,
    String token, [
    bool remote = true,
  ]);

  Future<Either<Failure, void>> add(
    List<PlantTypeModel> request,
    String token, [
    bool remote = true,
  ]);
}
