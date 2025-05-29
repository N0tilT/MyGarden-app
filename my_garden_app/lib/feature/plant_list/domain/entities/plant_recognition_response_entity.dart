import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_garden_app/feature/plant_list/data/model/plant_recognition_response_model.dart';

part 'plant_recognition_response_entity.freezed.dart';

@Freezed(
  toStringOverride: false,
)
class PlantRecognitionResponseEntity with _$PlantRecognitionResponseEntity {
  const factory PlantRecognitionResponseEntity({
    required String name,
    required String message,
  }) = _PlantRecognitionResponseEntity;

  const PlantRecognitionResponseEntity._();

  factory PlantRecognitionResponseEntity.fromModel(
    PlantRecognitionResponseModel model,
  ) =>
      PlantRecognitionResponseEntity(
        name: model.filename,
        message: model.message,
      );

  @override
  String toString() {
    return message.toString();
  }
}
