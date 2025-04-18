import 'package:dartz/dartz.dart';
import 'package:my_garden_app/core/data/error/failure.dart';
import 'package:my_garden_app/feature/plant_list/data/model/garden_request_model.dart';
import 'package:my_garden_app/feature/plant_list/data/model/grow_stage_model.dart';

abstract class GrowStageRepository {
  Future<Either<Failure, GrowStageModel>> loadById(
    int request,
    String token, [
    bool remote = false,
  ]);

  Future<Either<Failure, List<GrowStageModel>>> load(
    GardenRequestModel request,
    String token, [
    bool remote = true,
  ]);

  Future<Either<Failure, void>> add(
    List<GrowStageModel> request,
    String token, [
    bool remote = true,
  ]);
}
