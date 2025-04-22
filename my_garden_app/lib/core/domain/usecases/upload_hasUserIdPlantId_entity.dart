import 'package:dartz/dartz.dart';
import "package:my_garden_app/core/data/error/failure.dart";
import 'package:my_garden_app/core/data/model/common_request_model.dart';
import 'package:my_garden_app/core/data/model/i_has_userId_plantId_model.dart';
import 'package:my_garden_app/core/domain/entities/i_common_entity.dart';
import 'package:my_garden_app/core/domain/repositories/common_repository.dart';
import 'package:my_garden_app/core/domain/usecases/usecase.dart';
import 'package:my_garden_app/feature/auth/domain/repositories/auth_repository.dart';

class UploadHasUserIdPlantIdEntity<CommonEntityType extends ICommonEntity,
        CommonModelType extends IHasUserIdPlantIdModel<ICommonEntity>>
    extends Usecase<void, List<CommonEntityType>> {
  final CommonRepository<List<CommonModelType>, CommonRequestModel>
      commonRepository;
  final AuthRepository authRepository;
  final CommonModelType Function(CommonEntityType) fromEntityConverter;

  UploadHasUserIdPlantIdEntity({
    required this.commonRepository,
    required this.authRepository,
    required this.fromEntityConverter,
  });

  @override
  Future<Either<Failure, void>> call(List<CommonEntityType> request,
      [bool remote = true, int plantId = -1]) async {
    final userData = await authRepository.getUserData(remote);
    return userData.fold((l) {
      return Left(l);
    }, (r) async {
      final result = await commonRepository.add(
        request
            .map((x) => fromEntityConverter(x))
            .map(
              (y) => y.copyWith(userId: r.user?.id ?? "", plantId: plantId)
                  as CommonModelType,
            )
            .toList(),
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
