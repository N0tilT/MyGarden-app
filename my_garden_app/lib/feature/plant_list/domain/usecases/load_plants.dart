import 'package:dartz/dartz.dart';
import 'package:my_garden_app/core/data/error/failure.dart';
import 'package:my_garden_app/core/data/usecases/usecase.dart';
import 'package:my_garden_app/feature/plant_list/data/model/plant_model.dart';
import 'package:my_garden_app/feature/plant_list/domain/repositories/plant_repository.dart';

class LoadPlants extends Usecase<List<PlantModel>, void> {
  final PlantRepository plantRepository;

  LoadPlants({required this.plantRepository});

  @override
  Future<Either<Failure, List<PlantModel>>> call(
    void request, [
    bool remote = true,
  ]) async {
    return await plantRepository.load(request, remote);
  }
}
