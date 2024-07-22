import 'package:hive/hive.dart';
import 'package:my_garden_app/core/data/datasource/datasource.dart';
import 'package:my_garden_app/core/data/error/exception.dart';
import 'package:my_garden_app/feature/event_journal/data/model/event_model.dart';

class EventLocalDataSource
    extends LocalDataSource<List<EventModel>, void> {
  Box<EventModel> EventBox;

  EventLocalDataSource({required this.EventBox});

  @override
  Future<void> add(List<EventModel> EventList) async {
    try {
      if (EventList.isEmpty) {
        EventBox.clear();
        return;
      }
      await updateBox<EventModel>(
        {for (final item in EventList) item.id: item},
        EventBox.values.map((e) => e.id).toList(),
        EventBox,
      );
    } catch (e) {
      throw CacheException();
    }
  }

  @override
  Future<List<EventModel>> load(void request) async {
    try {
      return EventBox.values.toList();
    } catch (e) {
      throw CacheException();
    }
  }
  
}
