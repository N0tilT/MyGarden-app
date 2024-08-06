// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'garden_model.freezed.dart';
part 'garden_model.g.dart';

@freezed
class GardenModel extends HiveObject with _$GardenModel {
  @HiveType(typeId: 4, adapterName: 'GardenModelAdapter')
  factory GardenModel({
    @JsonKey(name: 'id') @HiveField(0) required int id,
    @JsonKey(name: 'title') @HiveField(1) required String title,
  }) = _GardenModel;

  GardenModel._();

  factory GardenModel.fromJson(Map<String, dynamic> json) =>
      _$GardenModelFromJson(json);
}
