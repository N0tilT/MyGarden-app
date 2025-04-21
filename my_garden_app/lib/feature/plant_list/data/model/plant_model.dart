// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:my_garden_app/core/data/model/i_has_userId_model.dart';
import 'package:my_garden_app/feature/plant_list/domain/entities/plant_entity.dart';

part 'plant_model.freezed.dart';
part 'plant_model.g.dart';

@Freezed(copyWith: false)
class PlantModel extends HiveObject
    with _$PlantModel
    implements IHasUseridModel<PlantEntity> {
  @HiveType(typeId: 1, adapterName: 'PlantModelAdapter')
  factory PlantModel({
    @JsonKey(name: 'id') @HiveField(0) required int? id,
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
    @JsonKey(name: 'userId') @HiveField(13) required String userId,
    @JsonKey(name: 'plantTypeId') @HiveField(14) required int plantTypeId,
    @JsonKey(name: 'plantVarietyId') @HiveField(15) required int plantVarietyId,
  }) = _PlantModel;

  PlantModel._();

  @override
  PlantModel copyWith({String? userId}) => PlantModel(
        id: id,
        title: title,
        biologyTitle: biologyTitle,
        fertilization: fertilization,
        toxicity: toxicity,
        replacing: replacing,
        description: description,
        groupId: groupId,
        wateringNeedId: wateringNeedId,
        lightNeedId: lightNeedId,
        stageId: stageId,
        imageId: imageId,
        ripeningPeriod: ripeningPeriod,
        userId: userId ?? "",
        plantTypeId: plantTypeId,
        plantVarietyId: plantVarietyId,
      );

  factory PlantModel.fromJson(Map<String, dynamic> json) =>
      _$PlantModelFromJson(json);

  factory PlantModel.fromEntity(PlantEntity entity, String userId) =>
      PlantModel(
        id: entity.id,
        title: entity.title,
        biologyTitle: entity.biologyTitle,
        fertilization: entity.fertilization,
        toxicity: entity.toxicity,
        replacing: entity.replacing,
        description: entity.description,
        groupId: entity.groupId,
        wateringNeedId: entity.wateringNeedId,
        lightNeedId: entity.lightNeedId,
        plantTypeId: entity.plantTypeId,
        plantVarietyId: entity.plantVarietyId,
        stageId: entity.stageId,
        imageId: entity.imageId,
        ripeningPeriod: entity.ripeningPeriod,
        userId: userId,
      );
}
