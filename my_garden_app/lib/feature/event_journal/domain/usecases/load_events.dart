import 'package:dartz/dartz.dart';
import 'package:my_garden_app/core/data/error/failure.dart';
import 'package:my_garden_app/core/data/usecases/usecase.dart';
import 'package:my_garden_app/feature/event_journal/data/model/event_model.dart';
import 'package:my_garden_app/feature/event_journal/domain/repositories/event_repository.dart';

class LoadEvents extends Usecase<List<EventModel>, void> {
  final EventRepository eventRepository;

  LoadEvents({required this.eventRepository});

  @override
  Future<Either<Failure, List<EventModel>>> call(
    void request, [
    bool remote = true,
  ]) async {
    return await eventRepository.load(request, remote);
  }
}
