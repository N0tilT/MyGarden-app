import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_garden_app/core/domain/entities/i_common_entity.dart';
import 'package:my_garden_app/feature/plant_list/data/model/plant_variety_model.dart';

part 'plant_variety_entity.freezed.dart';

@Freezed(
  toStringOverride: false,
)
class PlantVarietyEntity with _$PlantVarietyEntity implements ICommonEntity {
  const factory PlantVarietyEntity({
    required int id,
    required String? title,
  }) = _PlantVarietyEntity;

  const PlantVarietyEntity._();

  factory PlantVarietyEntity.fromModel(PlantVarietyModel model) =>
      PlantVarietyEntity(
        id: model.id,
        title: model.title,
      );

  @override
  String toString() {
    return title.toString();
  }
}
