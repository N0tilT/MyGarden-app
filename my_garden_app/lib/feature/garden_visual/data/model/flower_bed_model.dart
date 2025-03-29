// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'flower_bed_model.freezed.dart';
part 'flower_bed_model.g.dart';

@freezed
class FlowerBedModel extends HiveObject with _$FlowerBedModel {
  @HiveType(typeId: 3, adapterName: 'FlowerBedModelAdapter')
  factory FlowerBedModel({
    @JsonKey(name: 'id') @HiveField(0) required int id,
    @JsonKey(name: 'width') @HiveField(1) required int width,
    @JsonKey(name: 'height') @HiveField(2) required int height,
    @JsonKey(name: 'trueDx') @HiveField(3) required double trueDx,
    @JsonKey(name: 'trueDy') @HiveField(4) required double trueDy,
    @JsonKey(name: 'dx') @HiveField(5) required double dx,
    @JsonKey(name: 'dy') @HiveField(6) required double dy,
    @JsonKey(name: 'rotation') @HiveField(7) required double rotation,
    @JsonKey(name: 'plantIds') @HiveField(8) required List<int> plantIds,
    @JsonKey(name: 'gardenId') @HiveField(9) required int gardenId,
  }) = _FlowerBedModel;

  FlowerBedModel._();

  factory FlowerBedModel.fromJson(Map<String, dynamic> json) =>
      _$FlowerBedModelFromJson(json);
}
