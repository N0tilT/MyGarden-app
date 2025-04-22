import 'package:my_garden_app/core/domain/usecases/delete_common_entity.dart';
import 'package:my_garden_app/feature/event_journal/data/model/event_model.dart';
import 'package:my_garden_app/feature/event_journal/domain/entities/event_entity.dart';

class DeleteEvent extends DeleteCommonEntity<EventEntity, EventModel> {
  DeleteEvent({
    required super.commonRepository,
    required super.authRepository,
  });
}
