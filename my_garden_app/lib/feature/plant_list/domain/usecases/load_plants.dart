import 'package:dartz/dartz.dart';
import 'package:my_garden_app/core/data/error/failure.dart';
import 'package:my_garden_app/core/data/usecases/usecase.dart';
import 'package:my_garden_app/feature/auth/domain/repositories/auth_repository.dart';
import 'package:my_garden_app/feature/plant_list/data/model/garden_request_model.dart';
import 'package:my_garden_app/feature/plant_list/domain/entities/plant_entity.dart';
import 'package:my_garden_app/feature/plant_list/domain/repositories/plant_repository.dart';

class LoadPlants extends Usecase<List<PlantEntity>, List<int>> {
  final PlantRepository plantRepository;
  final AuthRepository authRepository;

  LoadPlants({required this.plantRepository, required this.authRepository});

  @override
  Future<Either<Failure, List<PlantEntity>>> call(
    List<int> request, [
    bool remote = true,
  ]) async {
    final userData = await authRepository.getUserData();
    return userData.fold((l) {
      return Left(l);
    }, (r) async {
      final result = await plantRepository.load(
        GardenRequestModel(userId: r.user?.id ?? "", ids: request),
        r.token,
        remote,
      );

      return result.fold(
        (l) => Left(l),
        (r) => Right(
          r
              .map(
                (e) => PlantEntity.fromModel(e),
              )
              .toList(),
        ),
      );
    });
  }
}
