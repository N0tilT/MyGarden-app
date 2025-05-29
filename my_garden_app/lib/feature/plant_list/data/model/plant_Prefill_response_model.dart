// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:my_garden_app/core/data/model/i_common_model.dart';
import 'package:my_garden_app/feature/plant_list/domain/entities/plant_prefill_response_entity.dart';

part 'plant_Prefill_response_model.freezed.dart';
part 'plant_Prefill_response_model.g.dart';

@freezed
class PlantPrefillResponseModel extends HiveObject
    with _$PlantPrefillResponseModel
    implements ICommonModel {
  @HiveType(typeId: 12, adapterName: 'PlantPrefillResponseModelAdapter')
  factory PlantPrefillResponseModel({
    @JsonKey(name: 'type') @HiveField(0) required String type,
    @JsonKey(name: 'articles')
    @HiveField(1)
    required List<ArticleModel> articles,
    @JsonKey(name: 'labels') @HiveField(2) required LabelsModel labels,
    @JsonKey(name: 'summary') @HiveField(5) required String? summary,
  }) = _PlantPrefillResponseModel;

  PlantPrefillResponseModel._();

  factory PlantPrefillResponseModel.fromJson(Map<String, dynamic> json) =>
      _$PlantPrefillResponseModelFromJson(json);

  factory PlantPrefillResponseModel.fromEntity(
    PlantPrefillResponseEntity entity,
  ) =>
      PlantPrefillResponseModel(
          type: entity.type,
          articles:
              entity.articles.map((x) => ArticleModel.fromEntity(x)).toList(),
          labels: LabelsModel(
            wateringNeed: entity.wateringNeed,
            lightNeed: entity.lightNeed,
            fertilizer: entity.fertilizer,
          ),
          summary: entity.summary);
}

@freezed
class LabelsModel extends HiveObject with _$LabelsModel {
  @HiveType(typeId: 14, adapterName: 'LabelsModelAdapter')
  factory LabelsModel({
    @JsonKey(name: 'WateringNeed') @HiveField(0) required String wateringNeed,
    @JsonKey(name: 'LightNeed') @HiveField(1) required String lightNeed,
    @JsonKey(name: 'Fertilizer') @HiveField(2) required List<String> fertilizer,
  }) = _LabelsModel;

  LabelsModel._();

  factory LabelsModel.fromJson(Map<String, dynamic> json) =>
      _$LabelsModelFromJson(json);
}

@freezed
class ArticleModel extends HiveObject with _$ArticleModel {
  @HiveType(typeId: 15, adapterName: 'ArticleModelAdapter')
  factory ArticleModel({
    @JsonKey(name: 'title') @HiveField(0) required String title,
    @JsonKey(name: 'link') @HiveField(1) required String link,
  }) = _ArticleModel;

  ArticleModel._();

  factory ArticleModel.fromJson(Map<String, dynamic> json) =>
      _$ArticleModelFromJson(json);

  factory ArticleModel.fromEntity(
    ArticleEntity entity,
  ) =>
      ArticleModel(title: entity.title, link: entity.link);
}
