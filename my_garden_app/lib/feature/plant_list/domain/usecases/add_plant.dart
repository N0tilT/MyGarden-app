import 'package:dartz/dartz.dart';
import 'package:my_garden_app/core/data/error/failure.dart';
import 'package:my_garden_app/core/data/usecases/usecase.dart';
import 'package:my_garden_app/feature/plant_list/domain/entities/plant_entity.dart';
import 'package:my_garden_app/feature/plant_list/domain/repositories/plant_repository.dart';

class UploadPlant extends Usecase<void, List<PlantEntity>> {
  final PlantRepository plantRepository;

  UploadPlant({required this.plantRepository});

  @override
  Future<Either<Failure, void>> call(
    List<PlantEntity> request, [
    bool remote = true,
  ]) async {
    final result = await plantRepository.load(request, remote);

    return result.fold(
      (l) => Left(l),
      (r) => Right(r),
    );
  }
}
