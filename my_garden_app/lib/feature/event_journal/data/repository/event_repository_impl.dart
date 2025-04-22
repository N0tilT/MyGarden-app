import 'package:my_garden_app/core/data/model/has_plantId_request_model.dart';
import 'package:my_garden_app/core/data/repository/common_repository_Impl.dart';
import 'package:my_garden_app/feature/event_journal/data/model/event_model.dart';

class EventRepositoryImpl
    extends CommonRepositoryImpl<List<EventModel>, HasPlantidRequestModel> {
  EventRepositoryImpl({
    required super.remoteDataSource,
    required super.localDataSource,
    required super.networkInfo,
  });
}
