import 'package:my_garden_app/core/domain/usecases/load_common_entity.dart';
import 'package:my_garden_app/feature/plant_list/data/model/group_model.dart';
import 'package:my_garden_app/feature/plant_list/domain/entities/group_entity.dart';

class LoadGroups extends LoadCommonEntity<GroupEntity, GroupModel> {
  LoadGroups({
    required super.commonRepository,
    required super.authRepository,
    required super.fromModelConverter,
  });
}
