// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:my_garden_app/core/data/model/i_common_model.dart';
import 'package:my_garden_app/feature/plant_list/domain/entities/light_need_entity.dart';

part 'light_need_model.freezed.dart';
part 'light_need_model.g.dart';

@freezed
class LightNeedModel extends HiveObject
    with _$LightNeedModel
    implements ICommonModel {
  @HiveType(typeId: 8, adapterName: 'LightNeedModelAdapter')
  factory LightNeedModel({
    @JsonKey(name: 'id') @HiveField(0) required int id,
    @JsonKey(name: 'title') @HiveField(1) required String? title,
  }) = _LightNeedModel;

  LightNeedModel._();

  factory LightNeedModel.fromJson(Map<String, dynamic> json) =>
      _$LightNeedModelFromJson(json);

  factory LightNeedModel.fromEntity(LightNeedEntity entity) => LightNeedModel(
        id: entity.id,
        title: entity.title,
      );
}
