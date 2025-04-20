// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:my_garden_app/core/data/model/i_common_model.dart';
import 'package:my_garden_app/feature/plant_list/domain/entities/watering_need_entity.dart';

part 'watering_need_model.freezed.dart';
part 'watering_need_model.g.dart';

@freezed
class WateringNeedModel extends HiveObject
    with _$WateringNeedModel
    implements ICommonModel {
  @HiveType(typeId: 9, adapterName: 'WateringNeedModelAdapter')
  factory WateringNeedModel({
    @JsonKey(name: 'id') @HiveField(0) required int id,
    @JsonKey(name: 'title') @HiveField(1) required String? title,
  }) = _WateringNeedModel;

  WateringNeedModel._();

  factory WateringNeedModel.fromJson(Map<String, dynamic> json) =>
      _$WateringNeedModelFromJson(json);

  factory WateringNeedModel.fromEntity(
    WateringNeedEntity entity,
  ) =>
      WateringNeedModel(
        id: entity.id,
        title: entity.title,
      );
}
