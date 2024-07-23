import 'package:dartz/dartz.dart';
import 'package:my_garden_app/core/data/error/failure.dart';
import 'package:my_garden_app/core/data/usecases/usecase.dart';
import 'package:my_garden_app/feature/event_journal/data/model/event_model.dart';
import 'package:my_garden_app/feature/event_journal/domain/repositories/event_repository.dart';

class LoadPlantEvents extends Usecase<List<EventModel>, int> {
  final EventRepository eventRepository;

  LoadPlantEvents({required this.eventRepository});

  @override
  Future<Either<Failure, List<EventModel>>> call(
    int request, [
    bool remote = false,
  ]) async {
    return await eventRepository.loadByPlantId(request, remote);
  }
}
