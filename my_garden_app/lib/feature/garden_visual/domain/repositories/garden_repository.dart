import 'package:dartz/dartz.dart';
import 'package:my_garden_app/core/data/error/failure.dart';
import 'package:my_garden_app/feature/garden_visual/data/model/garden_model.dart';

abstract class GardenRepository {

  Future<Either<Failure, List<GardenModel>>> load(
    void request, [
    bool remote = true,
  ]);

  Future<Either<Failure, void>> update(
    List<GardenModel> request, [
    bool remote = true,
  ]);

}
