import 'package:dartz/dartz.dart';
import 'package:my_garden_app/core/data/error/failure.dart';
import 'package:my_garden_app/core/data/usecases/usecase.dart';
import 'package:my_garden_app/feature/auth/domain/repositories/auth_repository.dart';
import 'package:my_garden_app/feature/plant_list/data/model/plant_model.dart';
import 'package:my_garden_app/feature/plant_list/domain/entities/plant_entity.dart';
import 'package:my_garden_app/feature/plant_list/domain/repositories/plant_repository.dart';

class UploadPlant extends Usecase<void, List<PlantEntity>> {
  final PlantRepository plantRepository;
  final AuthRepository authRepository;

  UploadPlant({required this.plantRepository, required this.authRepository});

  @override
  Future<Either<Failure, void>> call(
    List<PlantEntity> request, [
    bool remote = true,
  ]) async {
    final userData = await authRepository.getUserData();
    return userData.fold((l) {
      return Left(l);
    }, (r) async {
      final result = await plantRepository.add(
        request.map((x) {
          return PlantModel.fromEntity(x, r.user?.id ?? "");
        }).toList(),
        r.token,
        remote,
      );

      return result.fold(
        (l) => Left(l),
        (r) => Right(r),
      );
    });
  }
}
