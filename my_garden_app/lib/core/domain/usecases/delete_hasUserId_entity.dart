import 'package:dartz/dartz.dart';
import "package:my_garden_app/core/data/error/failure.dart";
import 'package:my_garden_app/core/data/model/common_request_model.dart';
import 'package:my_garden_app/core/data/model/i_has_userId_model.dart';
import 'package:my_garden_app/core/domain/entities/i_common_entity.dart';
import 'package:my_garden_app/core/domain/repositories/common_repository.dart';
import 'package:my_garden_app/core/domain/usecases/usecase.dart';
import 'package:my_garden_app/feature/auth/domain/repositories/auth_repository.dart';

class DeleteHasuseridEntity<CommonEntityType extends ICommonEntity,
        CommonModelType extends IHasUseridModel<ICommonEntity>>
    extends Usecase<void, int> {
  final CommonRepository<List<CommonModelType>, CommonRequestModel>
      commonRepository;
  final AuthRepository authRepository;

  DeleteHasuseridEntity({
    required this.commonRepository,
    required this.authRepository,
  });

  @override
  Future<Either<Failure, void>> call(
    int request, [
    bool remote = true,
  ]) async {
    final userData = await authRepository.getUserData(remote);
    return userData.fold((l) {
      return Left(l);
    }, (r) async {
      final result = await commonRepository.delete(
        request,
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
