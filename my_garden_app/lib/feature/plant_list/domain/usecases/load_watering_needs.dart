import 'package:dartz/dartz.dart';
import 'package:my_garden_app/core/data/error/failure.dart';
import 'package:my_garden_app/core/data/usecases/usecase.dart';
import 'package:my_garden_app/feature/auth/domain/repositories/auth_repository.dart';
import 'package:my_garden_app/feature/plant_list/data/model/garden_request_model.dart';
import 'package:my_garden_app/feature/plant_list/domain/entities/group_entity.dart';
import 'package:my_garden_app/feature/plant_list/domain/repositories/group_repository.dart';

class LoadGroups extends Usecase<List<GroupEntity>, List<int>> {
  final GroupRepository groupRepository;
  final AuthRepository authRepository;

  LoadGroups({required this.groupRepository, required this.authRepository});

  @override
  Future<Either<Failure, List<GroupEntity>>> call(
    List<int> request, [
    bool remote = true,
  ]) async {
    final userData = await authRepository.getUserData();
    return userData.fold((l) {
      return Left(l);
    }, (r) async {
      final result = await groupRepository.load(
        GardenRequestModel(userId: r.user?.id ?? "", ids: request),
        r.token,
        remote,
      );

      return result.fold(
        (l) => Left(l),
        (r) => Right(
          r
              .map(
                (e) => GroupEntity.fromModel(e),
              )
              .toList(),
        ),
      );
    });
  }
}
