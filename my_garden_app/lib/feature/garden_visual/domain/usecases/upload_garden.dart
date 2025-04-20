import 'package:dartz/dartz.dart';
import 'package:my_garden_app/core/data/error/failure.dart';
import 'package:my_garden_app/core/domain/usecases/usecase.dart';
import 'package:my_garden_app/feature/garden_visual/data/model/garden_model.dart';
import 'package:my_garden_app/feature/garden_visual/domain/repositories/garden_repository.dart';

class UploadGarden extends Usecase<void, List<GardenModel>> {
  final GardenRepository gardenRepository;

  UploadGarden({required this.gardenRepository});

  @override
  Future<Either<Failure, void>> call(
    List<GardenModel> request, [
    bool remote = true,
  ]) async {
    return await gardenRepository.update(request, remote);
  }
}
