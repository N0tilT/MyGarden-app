import 'package:my_garden_app/core/domain/usecases/upload_hasUserIdPlantId_entity.dart';
import 'package:my_garden_app/feature/event_journal/data/model/event_model.dart';
import 'package:my_garden_app/feature/event_journal/domain/entities/event_entity.dart';

class UploadEvent
    extends UploadHasUserIdPlantIdEntity<EventEntity, EventModel> {
  UploadEvent({
    required super.commonRepository,
    required super.authRepository,
    required super.fromEntityConverter,
  });
}
