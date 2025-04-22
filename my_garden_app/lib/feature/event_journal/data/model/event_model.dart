// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:my_garden_app/core/data/model/i_has_userId_plantId_model.dart';
import 'package:my_garden_app/feature/event_journal/domain/entities/event_entity.dart';

part 'event_model.freezed.dart';
part 'event_model.g.dart';

@Freezed(copyWith: false)
class EventModel extends HiveObject
    with _$EventModel
    implements IHasUserIdPlantIdModel<EventEntity> {
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

  factory EventModel.fromEntity(
          EventEntity entity, String userId, int plantId) =>
      EventModel(
        id: entity.id,
        title: entity.title,
        plantId: plantId,
        userId: userId,
        date: entity.date,
      );

  @override
  IHasUserIdPlantIdModel<EventEntity> copyWith(
          {String? userId, int? plantId}) =>
      EventModel(
        id: id,
        title: title,
        plantId: plantId ?? -1,
        date: date,
        userId: userId ?? "",
      );
}
