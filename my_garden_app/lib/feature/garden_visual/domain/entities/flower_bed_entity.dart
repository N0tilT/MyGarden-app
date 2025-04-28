// ignore_for_file: avoid_dynamic_calls, type_annotate_public_apis

import 'dart:ui';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_garden_app/core/domain/entities/i_common_entity.dart';
import 'package:my_garden_app/feature/garden_visual/data/model/flower_bed_model.dart';

part 'flower_bed_entity.freezed.dart';

@Freezed(
  toStringOverride: false,
)
class FlowerBedEntity with _$FlowerBedEntity implements ICommonEntity {
  const factory FlowerBedEntity({
    required int id,
    required int width,
    required int height,
    required Offset truePosition,
    required Offset position,
    required double rotation,
    required List<int> plantIds,
    required int gardenId,
    required bool isMoving,
  }) = _FlowerBedEntity;

  factory FlowerBedEntity.fromModel(FlowerBedModel model) => FlowerBedEntity(
        id: model.id,
        width: model.width,
        height: model.height,
        truePosition: Offset(model.trueDx, model.trueDy),
        position: Offset(model.trueDx, model.trueDy),
        rotation: model.rotation,
        plantIds: model.plantIds,
        gardenId: model.gardenId ?? -1,
        isMoving: false,
      );
}
