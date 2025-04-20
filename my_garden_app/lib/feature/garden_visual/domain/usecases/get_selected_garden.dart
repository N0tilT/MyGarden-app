import 'package:dartz/dartz.dart';
import 'package:my_garden_app/core/data/error/failure.dart';
import 'package:my_garden_app/core/domain/usecases/usecase.dart';
import 'package:my_garden_app/feature/garden_visual/data/model/garden_model.dart';
import 'package:my_garden_app/feature/garden_visual/domain/repositories/garden_repository.dart';

class GetSelectedGarden extends Usecase<GardenModel, void> {
  final GardenRepository gardenRepository;

  GetSelectedGarden({required this.gardenRepository});

  @override
  Future<Either<Failure, GardenModel>> call(void request) async {
    // ignore: void_checks
    return await gardenRepository.getSelectedGarden(() {});
  }
}
