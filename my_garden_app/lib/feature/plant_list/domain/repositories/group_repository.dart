import 'package:dartz/dartz.dart';
import 'package:my_garden_app/core/data/error/failure.dart';
import 'package:my_garden_app/feature/plant_list/data/model/garden_request_model.dart';
import 'package:my_garden_app/feature/plant_list/data/model/group_model.dart';

abstract class GroupRepository {
  Future<Either<Failure, GroupModel>> loadById(
    int request,
    String token, [
    bool remote = false,
  ]);

  Future<Either<Failure, List<GroupModel>>> load(
    GardenRequestModel request,
    String token, [
    bool remote = true,
  ]);

  Future<Either<Failure, void>> add(
    List<GroupModel> request,
    String token, [
    bool remote = true,
  ]);
}
