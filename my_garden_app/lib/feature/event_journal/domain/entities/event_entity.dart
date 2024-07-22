import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_garden_app/feature/event_journal/data/model/event_model.dart';

part 'event_entity.freezed.dart';

@Freezed(
  toStringOverride: false,
)
class EventEntity with _$EventEntity {
  const factory EventEntity({
    required int id,
    required String? title,
    required int plantId,
    required DateTime date,
  }) = _EventEntity;

  const EventEntity._();

  factory EventEntity.fromModel(EventModel model) => EventEntity(
        id: model.id,
        title: model.title,
        plantId: model.plantId,
        date: model.date,
      );

  @override
  String toString() {
    return title.toString();
  }
}
