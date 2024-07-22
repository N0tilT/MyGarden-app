import 'package:dartz/dartz.dart';
import 'package:my_garden_app/core/data/error/failure.dart';
import 'package:my_garden_app/core/data/usecases/usecase.dart';
import 'package:my_garden_app/feature/event_journal/data/model/event_model.dart';
import 'package:my_garden_app/feature/event_journal/domain/repositories/event_repository.dart';

class UploadEvent extends Usecase<void, List<EventModel>> {
  final EventRepository eventRepository;

  UploadEvent({required this.eventRepository});

  @override
  Future<Either<Failure, void>> call(
    List<EventModel> request, [
    bool remote = true,
  ]) async {
    return await eventRepository.add(request, remote);
  }
}
