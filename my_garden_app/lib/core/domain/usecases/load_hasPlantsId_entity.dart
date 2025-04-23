import 'package:dartz/dartz.dart';
import 'package:my_garden_app/core/data/error/failure.dart';
import 'package:my_garden_app/core/data/model/has_plantId_request_model.dart';
import 'package:my_garden_app/core/data/model/i_has_userId_plantId_model.dart';
import 'package:my_garden_app/core/domain/entities/i_common_entity.dart';
import 'package:my_garden_app/core/domain/repositories/common_repository.dart';
import 'package:my_garden_app/core/domain/usecases/usecase.dart';
import 'package:my_garden_app/feature/auth/domain/repositories/auth_repository.dart';

class LoadHasPlantsidEntity<CommonEntityType extends ICommonEntity,
        CommonModelType extends IHasUserIdPlantIdModel<ICommonEntity>>
    extends Usecase<List<CommonEntityType>, List<int>> {
  final CommonRepository<List<CommonModelType>, HasPlantidRequestModel>
      commonRepository;
  final AuthRepository authRepository;
  final CommonEntityType Function(CommonModelType) fromModelConverter;

  LoadHasPlantsidEntity({
    required this.commonRepository,
    required this.authRepository,
    required this.fromModelConverter,
  });

  @override
  Future<Either<Failure, List<CommonEntityType>>> call(
    List<int> request, [
    bool remote = true,
    List<int>? plantIds,
  ]) async {
    final userData = await authRepository.getUserData(remote);
    return userData.fold((l) {
      return Left(l);
    }, (r) async {
      final result = await commonRepository.load(
        HasPlantidRequestModel(
          userId: r.user?.id ?? "",
          ids: request,
          plantIds: plantIds ?? [],
        ),
        r.token,
        remote,
      );

      return result.fold(
        (l) => Left(l),
        (r) => Right(
          r.map((x) => fromModelConverter(x)).toList(),
        ),
      );
    });
  }
}
