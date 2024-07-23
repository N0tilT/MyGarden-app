import 'package:dartz/dartz.dart';
import 'package:my_garden_app/core/data/error/failure.dart';
import 'package:my_garden_app/feature/event_journal/data/model/event_model.dart';

abstract class EventRepository {
  Future<Either<Failure, List<EventModel>>> loadByPlantId(
    int request, [
    bool remote = true,
  ]);

  Future<Either<Failure, List<EventModel>>> load(
    void request, [
    bool remote = true,
  ]);

  Future<Either<Failure, void>> add(
    List<EventModel> request, [
    bool remote = true,
  ]);
}
