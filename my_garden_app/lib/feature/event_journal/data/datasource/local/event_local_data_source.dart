import 'package:hive/hive.dart';
import 'package:my_garden_app/core/data/datasource/datasource.dart';
import 'package:my_garden_app/core/data/error/exception.dart';
import 'package:my_garden_app/feature/event_journal/data/model/event_model.dart';

class EventLocalDataSource extends LocalDataSource<List<EventModel>, void> {
  Box<EventModel> eventBox;

  EventLocalDataSource({
    required this.eventBox,
  });

  @override
  Future<void> update(List<EventModel> eventList) async {
    try {
      if (eventList.isEmpty) {
        eventBox.clear();
        return;
      }
      await updateBox<EventModel>(
        {for (final item in eventList) item.id: item},
        eventBox.values.map((e) => e.id).toList(),
        eventBox,
      );
    } catch (e) {
      throw CacheException();
    }
  }

  @override
  Future<List<EventModel>> load(void request) async {
    try {
      return eventBox.values.toList();
    } catch (e) {
      throw CacheException();
    }
  }
}
