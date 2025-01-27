import 'package:dartz/dartz.dart';
import 'package:my_garden_app/core/data/error/failure.dart';
import 'package:my_garden_app/feature/plant_list/data/model/plant_model.dart';

abstract class PlantRepository {
  Future<Either<Failure, PlantModel>> loadByPlantId(
    int request, [
    bool remote = false,
  ]);

  Future<Either<Failure, List<PlantModel>>> load(
    void request, [
    bool remote = true,
  ]);

  Future<Either<Failure, void>> add(
    List<PlantModel> request, [
    bool remote = true,
  ]);
}
