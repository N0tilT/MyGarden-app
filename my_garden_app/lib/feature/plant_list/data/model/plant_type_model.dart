// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:my_garden_app/core/data/model/i_common_model.dart';
import 'package:my_garden_app/feature/plant_list/domain/entities/plant_type_entity.dart';

part 'plant_type_model.freezed.dart';
part 'plant_type_model.g.dart';

@freezed
class PlantTypeModel extends HiveObject
    with _$PlantTypeModel
    implements ICommonModel {
  @HiveType(typeId: 10, adapterName: 'PlantTypeModelAdapter')
  factory PlantTypeModel({
    @JsonKey(name: 'id') @HiveField(0) required int id,
    @JsonKey(name: 'title') @HiveField(1) required String? title,
  }) = _PlantTypeModel;

  PlantTypeModel._();

  factory PlantTypeModel.fromJson(Map<String, dynamic> json) =>
      _$PlantTypeModelFromJson(json);

  factory PlantTypeModel.fromEntity(PlantTypeEntity entity) => PlantTypeModel(
        id: entity.id,
        title: entity.title,
      );
}
