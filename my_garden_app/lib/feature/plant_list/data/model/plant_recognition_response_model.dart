// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:my_garden_app/core/data/model/i_common_model.dart';
import 'package:my_garden_app/feature/plant_list/domain/entities/light_need_entity.dart';
import 'package:my_garden_app/feature/plant_list/domain/entities/plant_recognition_response_entity.dart';

part 'plant_recognition_response_model.freezed.dart';
part 'plant_recognition_response_model.g.dart';

@freezed
class PlantRecognitionResponseModel extends HiveObject
    with _$PlantRecognitionResponseModel
    implements ICommonModel {
  @HiveType(typeId: 11, adapterName: 'PlantRecognitionResponseModelAdapter')
  factory PlantRecognitionResponseModel({
    @JsonKey(name: 'id') @HiveField(0) required int id,
    @JsonKey(name: 'title') @HiveField(1) required String? title,
    @JsonKey(name: 'description') @HiveField(2) required String? description,
  }) = _PlantRecognitionResponseModel;

  PlantRecognitionResponseModel._();

  factory PlantRecognitionResponseModel.fromJson(Map<String, dynamic> json) =>
      _$PlantRecognitionResponseModelFromJson(json);

  factory PlantRecognitionResponseModel.fromEntity(PlantRecognitionResponseEntity entity) => PlantRecognitionResponseModel(
        id: entity.id,
        title: entity.title,
        description: entity.description
      );
}
