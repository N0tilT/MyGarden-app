import 'package:dartz/dartz.dart';
import 'package:my_garden_app/core/data/error/failure.dart';
import 'package:my_garden_app/core/domain/usecases/usecase.dart';
import 'package:my_garden_app/feature/auth/domain/repositories/auth_repository.dart';
import 'package:my_garden_app/feature/event_journal/data/model/event_model.dart';
import 'package:my_garden_app/feature/event_journal/domain/repositories/event_repository.dart';

class LoadEvents extends Usecase<List<EventModel>, void> {
  final EventRepository eventRepository;
  final AuthRepository authRepository;

  LoadEvents({required this.eventRepository, required this.authRepository});

  @override
  Future<Either<Failure, List<EventModel>>> call(
    void request, [
    bool remote = true,
  ]) async {
    final token = await authRepository.getUserData();
    return token.fold((l) {
      return Left(l);
    }, (r) async {
      return await eventRepository.load(request, r.token, remote);
    });
  }
}
