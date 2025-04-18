import 'package:dartz/dartz.dart';
import 'package:my_garden_app/core/data/error/failure.dart';
import 'package:my_garden_app/feature/plant_list/data/model/garden_request_model.dart';
import 'package:my_garden_app/feature/plant_list/data/model/watering_need_model.dart';

abstract class WateringNeedRepository {
  Future<Either<Failure, WateringNeedModel>> loadById(
    int request,
    String token, [
    bool remote = false,
  ]);

  Future<Either<Failure, List<WateringNeedModel>>> load(
    GardenRequestModel request,
    String token, [
    bool remote = true,
  ]);

  Future<Either<Failure, void>> add(
    List<WateringNeedModel> request,
    String token, [
    bool remote = true,
  ]);
}
