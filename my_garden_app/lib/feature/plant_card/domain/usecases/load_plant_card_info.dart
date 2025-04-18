// ignore_for_file: void_checks

import 'package:dartz/dartz.dart';
import 'package:my_garden_app/core/data/error/failure.dart';
import 'package:my_garden_app/core/data/usecases/usecase.dart';
import 'package:my_garden_app/feature/auth/domain/repositories/auth_repository.dart';
import 'package:my_garden_app/feature/plant_list/data/model/garden_request_model.dart';
import 'package:my_garden_app/feature/plant_list/data/model/plant_model.dart';
import 'package:my_garden_app/feature/plant_list/domain/repositories/plant_repository.dart';

class LoadPlant extends Usecase<PlantModel, int> {
  final PlantRepository plantRepository;
  final AuthRepository authRepository;

  LoadPlant({required this.plantRepository, required this.authRepository});

  @override
  Future<Either<Failure, PlantModel>> call(
    int request, [
    bool remote = true,
  ]) async {
    final getUserData = await authRepository.getUserData();
    return getUserData.fold((l) {
      return Left(l);
    }, (r) async {
      var plants = await plantRepository.load(
        GardenRequestModel(userId: r.user?.id ?? "", ids: [request]),
        r.token,
        remote,
      );
      if (plants.length() == 0) {
        plants = await plantRepository.load(
          GardenRequestModel(userId: r.user?.id ?? "", ids: [request]),
          r.token,
          !remote,
        );
      }
      return plants.fold(
        (error) => Left(error),
        (succededPlants) => Right(
          succededPlants.firstWhere(
            (element) => element.id == request,
          ),
        ),
      );
    });
  }
}
