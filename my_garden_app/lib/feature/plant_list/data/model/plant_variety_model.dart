// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:my_garden_app/feature/plant_list/domain/entities/plant_variety_entity.dart';

part 'plant_variety_model.freezed.dart';
part 'plant_variety_model.g.dart';

@freezed
class PlantVarietyModel extends HiveObject with _$PlantVarietyModel {
  @HiveType(typeId: 11, adapterName: 'PlantVarietyModelAdapter')
  factory PlantVarietyModel({
    @JsonKey(name: 'id') @HiveField(0) required int id,
    @JsonKey(name: 'title') @HiveField(1) required String? title,
  }) = _PlantVarietyModel;

  PlantVarietyModel._();

  factory PlantVarietyModel.fromJson(Map<String, dynamic> json) =>
      _$PlantVarietyModelFromJson(json);

  factory PlantVarietyModel.fromEntity(
    PlantVarietyEntity entity,
  ) =>
      PlantVarietyModel(
        id: entity.id,
        title: entity.title,
      );
}
