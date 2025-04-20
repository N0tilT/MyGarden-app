// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:my_garden_app/core/data/model/i_has_userId_model.dart';
import 'package:my_garden_app/feature/plant_list/domain/entities/group_entity.dart';

part 'group_model.freezed.dart';
part 'group_model.g.dart';

@Freezed(copyWith: false)
class GroupModel extends HiveObject
    with _$GroupModel
    implements IHasUseridModel<GroupEntity> {
  @HiveType(typeId: 5, adapterName: 'GroupModelAdapter')
  factory GroupModel({
    @JsonKey(name: 'id') @HiveField(0) required int id,
    @JsonKey(name: 'title') @HiveField(1) required String? title,
    @JsonKey(name: 'userId') @HiveField(2) required String userId,
  }) = _GroupModel;

  GroupModel._();

  @override
  GroupModel copyWith({String? userId}) =>
      GroupModel(id: id, title: title, userId: userId ?? "");

  factory GroupModel.fromJson(Map<String, dynamic> json) =>
      _$GroupModelFromJson(json);

  factory GroupModel.fromEntity(GroupEntity entity, String userId) =>
      GroupModel(
        id: entity.id,
        title: entity.title,
        userId: userId,
      );
}
