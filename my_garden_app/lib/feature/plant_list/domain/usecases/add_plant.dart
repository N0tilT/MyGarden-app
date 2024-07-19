import 'package:dartz/dartz.dart';
import 'package:my_garden_app/core/data/error/failure.dart';
import 'package:my_garden_app/core/data/usecases/usecase.dart';
import 'package:my_garden_app/feature/plant_list/data/model/plant_model.dart';
import 'package:my_garden_app/feature/plant_list/domain/repositories/plant_repository.dart';

class UploadPlant extends Usecase<void, List<PlantModel>> {
  final PlantRepository plantRepository;

  UploadPlant({required this.plantRepository});

  @override
  Future<Either<Failure, void>> call(
    List<PlantModel> request, [
    bool remote = true,
  ]) async {
    return await plantRepository.add(request, remote);
  }
}
