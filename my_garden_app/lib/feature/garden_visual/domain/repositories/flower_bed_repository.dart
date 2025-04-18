import 'package:dartz/dartz.dart';
import 'package:my_garden_app/core/data/error/failure.dart';
import 'package:my_garden_app/feature/garden_visual/data/model/flower_bed_model.dart';

abstract class FlowerBedRepository {
  Future<Either<Failure, List<FlowerBedModel>>> load(
    void request, [
    bool remote = true,
  ]);

  Future<Either<Failure, void>> update(
    List<FlowerBedModel> request, [
    bool remote = true,
  ]);
}
