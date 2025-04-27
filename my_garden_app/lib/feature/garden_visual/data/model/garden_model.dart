// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:my_garden_app/core/data/model/i_has_userId_model.dart';
import 'package:my_garden_app/feature/garden_visual/data/model/flower_bed_model.dart';
import 'package:my_garden_app/feature/garden_visual/domain/entities/garden_entity.dart';

part 'garden_model.freezed.dart';
part 'garden_model.g.dart';

@Freezed(copyWith: false)
class GardenModel extends HiveObject
    with _$GardenModel
    implements IHasUseridModel<GardenEntity> {
  @HiveType(typeId: 4, adapterName: 'GardenModelAdapter')
  factory GardenModel({
    @JsonKey(name: 'id') @HiveField(0) required int? id,
    @JsonKey(name: 'title') @HiveField(1) required String title,
    @JsonKey(name: 'flowerBeds')
    @HiveField(2)
    required List<FlowerBedModel> flowerBeds,
    @JsonKey(name: 'gardenTypeId') @HiveField(3) required int gardenTypeId,
    @JsonKey(name: 'userId') @HiveField(4) required String userId,
  }) = _GardenModel;

  GardenModel._();
  @override
  GardenModel copyWith({String? userId}) => GardenModel(
        id: id,
        title: title,
        userId: userId ?? "",
        flowerBeds: flowerBeds,
        gardenTypeId: gardenTypeId,
      );

  factory GardenModel.fromJson(Map<String, dynamic> json) =>
      _$GardenModelFromJson(json);

  factory GardenModel.fromEntity(GardenEntity entity, String userId) =>
      GardenModel(
        id: entity.id,
        title: entity.title,
        flowerBeds: entity.flowerBeds
            .map((e) => FlowerBedModel.fromEntity(e, userId))
            .toList(),
        gardenTypeId: entity.gardenTypeId,
        userId: userId,
      );
}
