// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:my_garden_app/feature/plant_list/domain/entities/group_entity.dart';

part 'group_model.freezed.dart';
part 'group_model.g.dart';

@freezed
class GroupModel extends HiveObject with _$GroupModel {
  @HiveType(typeId: 5, adapterName: 'GroupModelAdapter')
  factory GroupModel({
    @JsonKey(name: 'id') @HiveField(0) required int id,
    @JsonKey(name: 'title') @HiveField(1) required String? title,
    @JsonKey(name: 'userId') @HiveField(2) required String userId,
  }) = _GroupModel;

  GroupModel._();

  factory GroupModel.fromJson(Map<String, dynamic> json) =>
      _$GroupModelFromJson(json);

  factory GroupModel.fromEntity(GroupEntity entity, String userId) =>
      GroupModel(
        id: entity.id,
        title: entity.title,
        userId: userId,
      );
}
