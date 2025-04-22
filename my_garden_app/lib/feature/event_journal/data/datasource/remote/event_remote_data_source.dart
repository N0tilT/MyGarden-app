import 'package:http/http.dart' as http;
import 'package:my_garden_app/core/data/datasource/datasource.dart';
import 'package:my_garden_app/core/data/error/exception.dart';
import 'package:my_garden_app/feature/event_journal/data/model/event_model.dart';

class EventRemoteDataSource extends RemoteDataSource<List<EventModel>, void> {
  final http.Client client;

  EventRemoteDataSource({required this.client});

  @override
  Future<List<EventModel>> load(void request, String token) async {
    try {
      // final response = await client.get(
      //   Uri.parse('$BASE_URL/course'),
      // );
      // if (response.statusCode == 200) {
      //   final decoded = json.decode(response.body) as List<dynamic>;
      //   final responseModel = decoded
      //       .map((dynamic value) =>
      //           EventModel.fromJson(value as Map<String, dynamic>),)
      //       .toList();
      //   return responseModel;
      // } else {
      //   throw ServerException();
      // }
      return [
        EventModel(
          id: 0,
          title: "Полить",
          date: DateTime.now(),
          plantId: 0,
          userId: '',
        ),
        EventModel(
          id: 1,
          title: "Подкормка",
          date: DateTime.now(),
          plantId: 0,
          userId: '',
        ),
        EventModel(
          id: 2,
          title: "Полить",
          date: DateTime.now(),
          plantId: 1,
          userId: '',
        ),
        EventModel(
          id: 3,
          title: "Пересадить",
          date: DateTime.now(),
          plantId: 1,
          userId: '',
        ),
      ];
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Future<void> upload(List<EventModel> remoteLoad, String token) {
    // ignore: void_checks
    return Future.value(remoteLoad);
  }

  @override
  Future<void> delete(int id, String token) {
    // TODO: implement delete
    throw UnimplementedError();
  }
}
