// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'plant_model.freezed.dart';
part 'plant_model.g.dart';

@freezed
class PlantModel extends HiveObject with _$PlantModel {
  @HiveType(typeId: 1, adapterName: 'PlantModelAdapter')
  factory PlantModel({
    @JsonKey(name: 'id') @HiveField(0) required int id,
    @JsonKey(name: 'title') @HiveField(1) required String? title,
    @JsonKey(name: 'biologyTitle') @HiveField(2) required String? biologyTitle,
    @JsonKey(name: 'fertilization')
    @HiveField(3)
    required String? fertilization,
    @JsonKey(name: 'toxicity') @HiveField(4) required String? toxicity,
    @JsonKey(name: 'replacing') @HiveField(5) required String? replacing,
    @JsonKey(name: 'description') @HiveField(6) required String? description,
    @JsonKey(name: 'groupId') @HiveField(7) required int groupId,
    @JsonKey(name: 'wateringNeedId') @HiveField(8) required int wateringNeedId,
    @JsonKey(name: 'lightNeedId') @HiveField(9) required int lightNeedId,
    @JsonKey(name: 'stageId') @HiveField(10) required int stageId,
    @JsonKey(name: 'imageId') @HiveField(11) required int imageId,
    @JsonKey(name: 'ripeningPeriod') @HiveField(12) required int ripeningPeriod,
  }) = _PlantModel;

  PlantModel._();

  factory PlantModel.fromJson(Map<String, dynamic> json) =>
      _$PlantModelFromJson(json);
}
