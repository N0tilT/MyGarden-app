import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_garden_app/core/domain/entities/i_common_entity.dart';
import 'package:my_garden_app/feature/plant_list/data/model/group_model.dart';

part 'group_entity.freezed.dart';

@Freezed(
  toStringOverride: false,
)
class GroupEntity with _$GroupEntity implements ICommonEntity {
  const factory GroupEntity({
    required int id,
    required String? title,
  }) = _GroupEntity;

  const GroupEntity._();

  factory GroupEntity.fromModel(GroupModel model) => GroupEntity(
        id: model.id,
        title: model.title,
      );

  @override
  String toString() {
    return title.toString();
  }
}
