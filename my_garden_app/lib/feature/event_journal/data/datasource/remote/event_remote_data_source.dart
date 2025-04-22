import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:my_garden_app/core/data/datasource/datasource.dart';
import 'package:my_garden_app/core/data/error/exception.dart';
import 'package:my_garden_app/core/data/model/has_plantId_request_model.dart';
import 'package:my_garden_app/core/network/api_config.dart';
import 'package:my_garden_app/feature/event_journal/data/model/event_model.dart';

class EventRemoteDataSource
    extends RemoteDataSource<List<EventModel>, HasPlantidRequestModel> {
  final http.Client client;

  EventRemoteDataSource({required this.client});

  @override
  Future<List<EventModel>> load(
    HasPlantidRequestModel request,
    String token,
  ) async {
    try {
      final uri = Uri.parse('$BASE_URL/event').replace(
        queryParameters: {
          'userId': [request.userId],
          if (request.plantIds != null && request.plantIds!.isNotEmpty)
            'plantIds': request.plantIds!.map((id) => id.toString()).toList(),
          if (request.ids != null && request.ids!.isNotEmpty)
            'ids': request.ids!.map((id) => id.toString()).toList(),
        },
      );

      final response = await client.get(
        uri,
        headers: {
          "Authorization": "Bearer $token",
          'Content-type': 'application/json; charset=UTF-8',
        },
      );
      if (response.statusCode == 200) {
        final decoded = json.decode(response.body) as List<dynamic>;
        final responseModel = decoded
            .map(
              (dynamic value) =>
                  EventModel.fromJson(value as Map<String, dynamic>),
            )
            .toList();
        return responseModel;
      } else {
        throw ServerException();
      }
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Future<void> upload(List<EventModel> remoteLoad, String token) async {
    try {
      final uri = Uri.parse('$BASE_URL/event');

      final response = await client.post(
        uri,
        body: json.encode(remoteLoad),
        headers: {
          "Authorization": "Bearer $token",
          'Content-type': 'application/json; charset=UTF-8',
        },
      );
      if (response.statusCode == 200) {
        return;
      } else {
        throw ServerException();
      }
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Future<void> delete(int id, String token) async {
    try {
      final uri = Uri.parse('$BASE_URL/event');

      final response = await client.delete(
        uri,
        body: json.encode([id]),
        headers: {
          "Authorization": "Bearer $token",
          'Content-type': 'application/json; charset=UTF-8',
        },
      );
      if (response.statusCode == 200) {
        return;
      } else {
        throw ServerException();
      }
    } catch (e) {
      throw ServerException();
    }
  }
}
