import 'package:dartz/dartz.dart';
import 'package:my_garden_app/core/data/error/failure.dart';
import 'package:my_garden_app/core/data/model/common_request_model.dart';
import 'package:my_garden_app/core/data/model/i_common_model.dart';
import 'package:my_garden_app/core/domain/entities/i_common_entity.dart';
import 'package:my_garden_app/core/domain/repositories/common_repository.dart';
import 'package:my_garden_app/core/domain/usecases/usecase.dart';
import 'package:my_garden_app/feature/auth/domain/repositories/auth_repository.dart';

class UploadCommonEntity<CommonEntityType extends Iterable<ICommonEntity>,
        CommonModelType extends Iterable<ICommonModel>>
    extends Usecase<void, CommonEntityType> {
  final CommonRepository<CommonModelType, CommonRequestModel> commonRepository;
  final AuthRepository authRepository;
  final CommonModelType Function(CommonEntityType) fromEntityConverter;

  UploadCommonEntity({
    required this.commonRepository,
    required this.authRepository,
    required this.fromEntityConverter,
  });

  @override
  Future<Either<Failure, void>> call(
    CommonEntityType request, [
    bool remote = true,
  ]) async {
    final userData = await authRepository.getUserData(false);
    return userData.fold((l) {
      return Left(l);
    }, (r) async {
      final result = await commonRepository.add(
        (request as List<CommonEntityType>).map((x) {
          return fromEntityConverter(x);
        }).toList() as CommonModelType,
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
