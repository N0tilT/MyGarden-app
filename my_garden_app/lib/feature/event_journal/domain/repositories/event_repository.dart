import 'package:my_garden_app/core/data/model/has_plantId_request_model.dart';
import 'package:my_garden_app/core/domain/repositories/common_repository.dart';
import 'package:my_garden_app/feature/event_journal/data/model/event_model.dart';

abstract class EventRepository
    extends CommonRepository<EventModel, HasPlantidRequestModel> {}
