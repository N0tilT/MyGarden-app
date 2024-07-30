// ignore_for_file: avoid_dynamic_calls, type_annotate_public_apis

import 'dart:ui';

import 'package:my_garden_app/feature/garden_visual/data/model/flower_bed_model.dart';

class FlowerBedEntity {
  int id;
  int width;
  int height;
  Offset truePosition;
  Offset position;
  double rotation;
  List<int> plantIds;
  bool isMoving;

  FlowerBedEntity({
    required this.id,
    required this.width,
    required this.height,
    required this.truePosition,
    required this.position,
    required this.rotation,
    required this.plantIds,
    required this.isMoving,
  });

  factory FlowerBedEntity.fromModel(FlowerBedModel model) => FlowerBedEntity(
        id: model.id,
        width: model.width,
        height: model.height,
        truePosition: Offset(model.trueDx, model.trueDy),
        position: Offset(model.dx, model.dy),
        rotation: model.rotation,
        plantIds: model.plantIds,
        isMoving: false,
      );
}
