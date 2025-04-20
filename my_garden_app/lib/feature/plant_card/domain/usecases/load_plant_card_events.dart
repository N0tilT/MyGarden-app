// ignore_for_file: void_checks

import 'package:dartz/dartz.dart';
import 'package:my_garden_app/core/data/error/failure.dart';
import 'package:my_garden_app/core/domain/usecases/usecase.dart';
import 'package:my_garden_app/feature/auth/domain/repositories/auth_repository.dart';
import 'package:my_garden_app/feature/event_journal/data/model/event_model.dart';
import 'package:my_garden_app/feature/event_journal/domain/repositories/event_repository.dart';

class LoadPlantEvents extends Usecase<List<EventModel>, int> {
  final EventRepository eventRepository;
  final AuthRepository authRepository;

  LoadPlantEvents({
    required this.eventRepository,
    required this.authRepository,
  });

  @override
  Future<Either<Failure, List<EventModel>>> call(
    int request, [
    bool remote = true,
  ]) async {
    final userData = await authRepository.getUserData();
    return userData.fold((l) {
      return Left(l);
    }, (r) async {
      var events = await eventRepository.load(() {}, r.token, remote);
      if (events.length() == 0) {
        events = await eventRepository.load(() {}, r.token, !remote);
      }
      return events.fold(
        (error) => Left(error),
        (succededEvents) => Right(
          succededEvents
              .where(
                (element) => element.plantId == request,
              )
              .toList(),
        ),
      );
    });
  }
}
