import 'package:dartz/dartz.dart';
import 'package:my_garden_app/core/data/error/failure.dart';
import 'package:my_garden_app/core/data/usecases/usecase.dart';
import 'package:my_garden_app/feature/garden_visual/data/model/garden_model.dart';
import 'package:my_garden_app/feature/garden_visual/domain/repositories/garden_repository.dart';

class LoadGardens extends Usecase<List<GardenModel>, void> {
  final GardenRepository flowerBedRepository;

  LoadGardens({required this.flowerBedRepository});

  @override
  Future<Either<Failure, List<GardenModel>>> call(
    void request, [
    bool remote = true,
  ]) async {
    return await flowerBedRepository.load(request, remote);
  }
}
