import 'package:dartz/dartz.dart';
import 'package:my_garden_app/core/data/error/failure.dart';
import 'package:my_garden_app/core/data/usecases/usecase.dart';
import 'package:my_garden_app/feature/garden_visual/data/model/flower_bed_model.dart';
import 'package:my_garden_app/feature/garden_visual/domain/repositories/flower_bed_repository.dart';

class UploadFlowerBed extends Usecase<void, List<FlowerBedModel>> {
  final FlowerBedRepository flowerBedRepository;

  UploadFlowerBed({required this.flowerBedRepository});

  @override
  Future<Either<Failure, void>> call(
    List<FlowerBedModel> request, [
    bool remote = true,
  ]) async {
    return await flowerBedRepository.add(request, remote);
  }
}
