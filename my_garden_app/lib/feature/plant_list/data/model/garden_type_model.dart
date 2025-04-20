// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:my_garden_app/core/data/model/i_common_model.dart';
import 'package:my_garden_app/feature/plant_list/domain/entities/garden_type_entity.dart';

part 'garden_type_model.freezed.dart';
part 'garden_type_model.g.dart';

@freezed
class GardenTypeModel extends HiveObject
    with _$GardenTypeModel
    implements ICommonModel {
  @HiveType(typeId: 6, adapterName: 'GardenTypeModelAdapter')
  factory GardenTypeModel({
    @JsonKey(name: 'id') @HiveField(0) required int id,
    @JsonKey(name: 'title') @HiveField(1) required String? title,
    @JsonKey(name: 'userId') @HiveField(2) required String userId,
  }) = _GardenTypeModel;

  GardenTypeModel._();

  factory GardenTypeModel.fromJson(Map<String, dynamic> json) =>
      _$GardenTypeModelFromJson(json);

  factory GardenTypeModel.fromEntity(GardenTypeEntity entity, String userId) =>
      GardenTypeModel(
        id: entity.id,
        title: entity.title,
        userId: userId,
      );
}
