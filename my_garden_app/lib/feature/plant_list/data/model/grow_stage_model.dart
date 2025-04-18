// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:my_garden_app/feature/plant_list/domain/entities/grow_stage_entity.dart';

part 'grow_stage_model.freezed.dart';
part 'grow_stage_model.g.dart';

@freezed
class GrowStageModel extends HiveObject with _$GrowStageModel {
  @HiveType(typeId: 7, adapterName: 'GrowStageModelAdapter')
  factory GrowStageModel({
    @JsonKey(name: 'id') @HiveField(0) required int id,
    @JsonKey(name: 'title') @HiveField(1) required String? title,
  }) = _GrowStageModel;

  GrowStageModel._();

  factory GrowStageModel.fromJson(Map<String, dynamic> json) =>
      _$GrowStageModelFromJson(json);

  factory GrowStageModel.fromEntity(GrowStageEntity entity) => GrowStageModel(
        id: entity.id,
        title: entity.title,
      );
}
