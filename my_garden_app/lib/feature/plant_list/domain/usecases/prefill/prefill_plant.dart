import 'package:dartz/dartz.dart';
import 'package:my_garden_app/core/data/error/failure.dart';
import 'package:my_garden_app/feature/auth/domain/repositories/auth_repository.dart';
import 'package:my_garden_app/feature/plant_list/domain/entities/plant_prefill_response_entity.dart';
import 'package:my_garden_app/feature/plant_list/domain/repositories/plant_recognition_repositroy.dart';

class PrefillPlant {
  final PlantRecognitionRepository recognitionRepository;
  final AuthRepository authRepository;

  PrefillPlant({
    required this.recognitionRepository,
    required this.authRepository,
  });

  Future<Either<Failure, PlantPrefillResponseEntity>> call(
    String request, [
    bool remote = true,
  ]) async {
    final userData = await authRepository.getUserData(false);
    return userData.fold((l) {
      return Left(l);
    }, (r) async {
      final result = await recognitionRepository.prefill(
        request,
        r.token,
        remote,
      );

      return result.fold(
        (l) => Left(l),
        (r) => Right(
          r,
        ),
      );
    });
  }
}
