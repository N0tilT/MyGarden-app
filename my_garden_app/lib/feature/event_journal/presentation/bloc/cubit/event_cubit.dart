import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_garden_app/feature/event_journal/domain/entities/event_entity.dart';
import 'package:my_garden_app/feature/event_journal/domain/usecases/add_event.dart';
import 'package:my_garden_app/feature/event_journal/domain/usecases/delete_event.dart';
import 'package:my_garden_app/feature/event_journal/domain/usecases/load_events.dart';

part 'event_cubit.freezed.dart';
part 'event_state.dart';

class EventCubit extends Cubit<EventState> {
  final LoadEvents loadEvents;
  final UploadEvent uploadEvent;
  final DeleteEvent deleteEvent;
  List<EventEntity> eventList = [];

  EventCubit(
      {required this.loadEvents,
      required this.uploadEvent,
      required this.deleteEvent})
      : super(const EventState.initial());

  Future<void> upload(EventEntity event) async {
    final result = await uploadEvent([event]);
    result.fold(
      (error) => emit(EventState.fail(error.message)),
      (success) => emit(EventState.success(eventList)),
    );
  }

  Future<void> load() async {
    final events = await loadEvents([]);
    events.fold(
      (error) => emit(EventState.fail(error.message)),
      (succededEventList) {
        eventList = succededEventList;
        emit(
          EventState.success(
            eventList,
          ),
        );
      },
    );
  }

  Future<void> loadLocally() async {
    emit(const EventState.loading());
    final events = await loadEvents([], false);
    events.fold(
      (error) => emit(EventState.fail(error.message)),
      (succededEventList) {
        eventList = succededEventList;
        emit(
          EventState.success(
            eventList,
          ),
        );
      },
    );
  }

  Future<void> delete(int id) async {
    emit(const EventState.loading());
    final result = await deleteEvent(id);
    eventList.removeWhere((plant) => plant.id! == id);
    result.fold(
      (error) => emit(EventState.remoteFail(error.message)),
      (success) => emit(EventState.success(eventList)),
    );
  }
}
