// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'event_model.freezed.dart';
part 'event_model.g.dart';

@freezed
class EventModel extends HiveObject with _$EventModel {
  @HiveType(typeId: 2, adapterName: 'EventModelAdapter')
  factory EventModel({
    @JsonKey(name: 'id') @HiveField(0) required int? id,
    @JsonKey(name: 'title') @HiveField(1) required String? title,
    @JsonKey(name: 'plantId') @HiveField(2) required int plantId,
    @JsonKey(name: 'userId') @HiveField(4) required String userId,
    @JsonKey(name: 'date') @HiveField(3) required DateTime date,
  }) = _EventModel;

  EventModel._();

  factory EventModel.fromJson(Map<String, dynamic> json) =>
      _$EventModelFromJson(json);
}
