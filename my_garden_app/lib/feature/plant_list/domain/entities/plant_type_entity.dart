import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_garden_app/feature/plant_list/data/model/plant_type_model.dart';

part 'plant_type_entity.freezed.dart';

@Freezed(
  toStringOverride: false,
)
class PlantTypeEntity with _$PlantTypeEntity {
  const factory PlantTypeEntity({
    required int id,
    required String? title,
  }) = _PlantTypeEntity;

  const PlantTypeEntity._();

  factory PlantTypeEntity.fromModel(PlantTypeModel model) => PlantTypeEntity(
        id: model.id,
        title: model.title,
      );

  @override
  String toString() {
    return title.toString();
  }
}
