import 'package:dartz/dartz.dart';
import 'package:my_garden_app/core/data/error/failure.dart';
import 'package:my_garden_app/core/domain/usecases/usecase.dart';
import 'package:my_garden_app/feature/garden_visual/data/model/flower_bed_model.dart';
import 'package:my_garden_app/feature/garden_visual/domain/repositories/flower_bed_repository.dart';

class LoadFlowerBeds extends Usecase<List<FlowerBedModel>, void> {
  final FlowerBedRepository flowerBedRepository;

  LoadFlowerBeds({required this.flowerBedRepository});

  @override
  Future<Either<Failure, List<FlowerBedModel>>> call(
    void request, [
    bool remote = true,
  ]) async {
    return await flowerBedRepository.load(request, remote);
  }
}
