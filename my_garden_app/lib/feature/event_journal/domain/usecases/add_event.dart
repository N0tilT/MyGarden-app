import 'package:dartz/dartz.dart';
import 'package:my_garden_app/core/data/error/failure.dart';
import 'package:my_garden_app/core/domain/usecases/usecase.dart';
import 'package:my_garden_app/feature/auth/domain/repositories/auth_repository.dart';
import 'package:my_garden_app/feature/event_journal/data/model/event_model.dart';
import 'package:my_garden_app/feature/event_journal/domain/repositories/event_repository.dart';

class UploadEvent extends Usecase<void, List<EventModel>> {
  final EventRepository eventRepository;
  final AuthRepository authRepository;

  UploadEvent({required this.eventRepository, required this.authRepository});

  @override
  Future<Either<Failure, void>> call(
    List<EventModel> request, [
    bool remote = true,
  ]) async {
    final token = await authRepository.getUserData();
    return token.fold((l) {
      return Left(l);
    }, (r) async {
      return await eventRepository.add(request, r.token, remote);
    });
  }
}
