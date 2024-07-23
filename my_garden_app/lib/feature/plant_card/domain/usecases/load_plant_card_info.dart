import 'package:dartz/dartz.dart';
import 'package:my_garden_app/core/data/error/failure.dart';
import 'package:my_garden_app/core/data/usecases/usecase.dart';
import 'package:my_garden_app/feature/plant_list/data/model/plant_model.dart';
import 'package:my_garden_app/feature/plant_list/domain/repositories/plant_repository.dart';

class LoadPlant extends Usecase<PlantModel, int> {
  final PlantRepository plantRepository;

  LoadPlant({required this.plantRepository});

  @override
  Future<Either<Failure, PlantModel>> call(
    int request, [
    bool remote = true,
  ]) async {
    return await plantRepository.loadByPlantId(request, remote);
  }
}
