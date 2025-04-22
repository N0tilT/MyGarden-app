import 'package:my_garden_app/core/domain/usecases/delete_common_entity.dart';
import 'package:my_garden_app/feature/plant_list/data/model/group_model.dart';
import 'package:my_garden_app/feature/plant_list/domain/entities/group_entity.dart';

class DeleteGroup extends DeleteCommonEntity<GroupEntity, GroupModel> {
  DeleteGroup({
    required super.commonRepository,
    required super.authRepository,
  });
}
