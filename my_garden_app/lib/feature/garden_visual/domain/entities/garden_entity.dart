// ignore_for_file: avoid_dynamic_calls, type_annotate_public_apis
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_garden_app/core/domain/entities/i_common_entity.dart';
import 'package:my_garden_app/feature/garden_visual/data/model/garden_model.dart';
import 'package:my_garden_app/feature/garden_visual/domain/entities/flower_bed_entity.dart';

part 'garden_entity.freezed.dart';

@Freezed(
  toStringOverride: false,
)
class GardenEntity with _$GardenEntity implements ICommonEntity {
  const factory GardenEntity({
    required int? id,
    required String title,
    required List<FlowerBedEntity> flowerBeds,
    required int gardenTypeId,
    String? gardenTypeTitle,
  }) = _GardenEntity;

  factory GardenEntity.fromModel(GardenModel model) => GardenEntity(
        id: model.id,
        title: model.title,
        flowerBeds: model.flowerBeds
            .map(
              (e) => FlowerBedEntity.fromModel(e),
            )
            .toList(),
        gardenTypeId: model.gardenTypeId,
      );

  factory GardenEntity.copyWith(
    GardenEntity entity,
    List<FlowerBedEntity> flowerBeds,
  ) =>
      GardenEntity(
        id: entity.id,
        title: entity.title,
        flowerBeds: flowerBeds,
        gardenTypeId: entity.gardenTypeId,
        gardenTypeTitle: entity.gardenTypeTitle,
      );
}
