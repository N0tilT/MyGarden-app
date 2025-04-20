import 'package:my_garden_app/core/domain/usecases/upload_hasUserId_entity.dart';
import 'package:my_garden_app/feature/plant_list/data/model/group_model.dart';
import 'package:my_garden_app/feature/plant_list/domain/entities/group_entity.dart';

class UploadGroup extends UploadHasuseridEntity<GroupEntity, GroupModel> {
  UploadGroup({
    required super.commonRepository,
    required super.authRepository,
    required super.fromEntityConverter,
  });
}
