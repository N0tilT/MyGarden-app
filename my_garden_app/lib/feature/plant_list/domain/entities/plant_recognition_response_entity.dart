import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_garden_app/feature/plant_list/data/model/plant_recognition_response_model.dart';

part 'plant_recognition_response_entity.freezed.dart';

@Freezed(
  toStringOverride: false,
)
class PlantRecognitionResponseEntity with _$PlantRecognitionResponseEntity {
  const factory PlantRecognitionResponseEntity(
      {required int id,
      required String? title,
      required String? description,}) = _PlantRecognitionResponseEntity;

  const PlantRecognitionResponseEntity._();

  factory PlantRecognitionResponseEntity.fromModel(
          PlantRecognitionResponseModel model,) =>
      PlantRecognitionResponseEntity(
          id: model.id, title: model.title, description: model.description,);

  @override
  String toString() {
    return title.toString();
  }
}
