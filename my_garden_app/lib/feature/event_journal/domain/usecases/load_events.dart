import 'package:my_garden_app/core/domain/usecases/load_hasPlantsId_entity.dart';
import 'package:my_garden_app/feature/event_journal/data/model/event_model.dart';
import 'package:my_garden_app/feature/event_journal/domain/entities/event_entity.dart';

class LoadEvents extends LoadHasPlantsidEntity<EventEntity, EventModel> {
  LoadEvents({
    required super.commonRepository,
    required super.authRepository,
    required super.fromModelConverter,
  });
}
