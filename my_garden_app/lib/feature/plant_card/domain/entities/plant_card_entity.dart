import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_garden_app/feature/event_journal/domain/entities/event_entity.dart';
import 'package:my_garden_app/feature/plant_list/domain/entities/plant_entity.dart';

part 'plant_card_entity.freezed.dart';

@Freezed(
  toStringOverride: false,
)
class PlantCardEntity with _$PlantCardEntity {
  const factory PlantCardEntity({
    required PlantEntity plant,
    required List<EventEntity> event,
  }) = _PlantCardEntity;

  const PlantCardEntity._();

  @override
  String toString() {
    return plant.toString();
  }
}
