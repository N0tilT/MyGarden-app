import 'package:dartz/dartz.dart';
import 'package:my_garden_app/core/data/error/failure.dart';
import 'package:my_garden_app/core/data/usecases/usecase.dart';
import 'package:my_garden_app/feature/garden_visual/data/model/garden_model.dart';
import 'package:my_garden_app/feature/garden_visual/domain/entities/garden_entity.dart';
import 'package:my_garden_app/feature/garden_visual/domain/repositories/garden_repository.dart';

class SetSelectedCourse extends Usecase<void, GardenEntity> {
  final GardenRepository gardenRepository;

  SetSelectedCourse({required this.gardenRepository});

  @override
  Future<Either<Failure, void>> call(GardenEntity request) async {
    return await gardenRepository.setSelectedGarden(
      GardenModel(
        id: request.id,
        title: request.title,
      ),
    );
  }
}
