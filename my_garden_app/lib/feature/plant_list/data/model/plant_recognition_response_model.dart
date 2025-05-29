// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:my_garden_app/core/data/model/i_common_model.dart';
import 'package:my_garden_app/feature/plant_list/domain/entities/plant_recognition_response_entity.dart';

part 'plant_recognition_response_model.freezed.dart';
part 'plant_recognition_response_model.g.dart';

@freezed
class PlantRecognitionResponseModel extends HiveObject
    with _$PlantRecognitionResponseModel
    implements ICommonModel {
  @HiveType(typeId: 13, adapterName: 'PlantRecognitionResponseModelAdapter')
  factory PlantRecognitionResponseModel({
    @JsonKey(name: 'message') @HiveField(0) required String message,
    @JsonKey(name: 'filename') @HiveField(1) required String filename,
  }) = _PlantRecognitionResponseModel;

  PlantRecognitionResponseModel._();

  factory PlantRecognitionResponseModel.fromJson(Map<String, dynamic> json) =>
      _$PlantRecognitionResponseModelFromJson(json);

  factory PlantRecognitionResponseModel.fromEntity(
    PlantRecognitionResponseEntity entity,
  ) =>
      PlantRecognitionResponseModel(
        filename: entity.name,
        message: entity.message,
      );
}
