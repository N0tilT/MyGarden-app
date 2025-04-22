import 'package:dartz/dartz.dart';
import 'package:my_garden_app/core/data/error/failure.dart';
import 'package:my_garden_app/core/data/repository/repository.dart';
import 'package:my_garden_app/core/network/network_info.dart';
import 'package:my_garden_app/feature/event_journal/data/datasource/local/event_local_data_source.dart';
import 'package:my_garden_app/feature/event_journal/data/datasource/remote/event_remote_data_source.dart';
import 'package:my_garden_app/feature/event_journal/data/model/event_model.dart';
import 'package:my_garden_app/feature/event_journal/domain/repositories/event_repository.dart';

class EventRepositoryImpl implements EventRepository {
  final EventRemoteDataSource remoteDataSource;
  final EventLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  EventRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, List<EventModel>>> load(
    void request,
    String token, [
    bool remote = true,
  ]) async {
    return await loadData<EventLocalDataSource, EventRemoteDataSource,
        List<EventModel>, void>(
      localDataSource,
      remoteDataSource,
      remote,
      request,
      networkInfo,
      token,
    );
  }

  @override
  Future<Either<Failure, void>> add(
    List<EventModel> request,
    String token, [
    bool remote = true,
  ]) async {
    return await uploadData<EventLocalDataSource, EventRemoteDataSource,
        List<EventModel>, void>(
      localDataSource,
      remoteDataSource,
      remote,
      // ignore: void_checks
      request,
      networkInfo,
      token,
    );
  }
}
