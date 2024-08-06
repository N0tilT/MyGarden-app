import 'package:dartz/dartz.dart';
import 'package:my_garden_app/core/data/error/failure.dart';
import 'package:my_garden_app/core/data/usecases/usecase.dart';
import 'package:my_garden_app/feature/garden_visual/data/model/garden_model.dart';
import 'package:my_garden_app/feature/garden_visual/domain/repositories/garden_repository.dart';

class RemoveGarden extends Usecase<void, List<GardenModel>> {
  final GardenRepository flowerBedRepository;

  RemoveGarden({required this.flowerBedRepository});

  @override
  Future<Either<Failure, void>> call(
    List<GardenModel> request, [
    bool remote = true,
  ]) async {
    return await flowerBedRepository.update(request, remote);
  }
}
