import 'package:dartz/dartz.dart';
import 'package:my_garden_app/core/data/error/failure.dart';
import 'package:my_garden_app/core/data/usecases/usecase.dart';
import 'package:my_garden_app/feature/auth/domain/repositories/auth_repository.dart';
import 'package:my_garden_app/feature/plant_list/data/model/group_model.dart';
import 'package:my_garden_app/feature/plant_list/domain/entities/group_entity.dart';
import 'package:my_garden_app/feature/plant_list/domain/repositories/group_repository.dart';

class UploadGroup extends Usecase<void, List<GroupEntity>> {
  final GroupRepository groupRepository;
  final AuthRepository authRepository;

  UploadGroup({required this.groupRepository, required this.authRepository});

  @override
  Future<Either<Failure, void>> call(
    List<GroupEntity> request, [
    bool remote = true,
  ]) async {
    final userData = await authRepository.getUserData();
    return userData.fold((l) {
      return Left(l);
    }, (r) async {
      final result = await groupRepository.add(
        request.map((x) {
          return GroupModel.fromEntity(x, r.user?.id ?? "");
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
