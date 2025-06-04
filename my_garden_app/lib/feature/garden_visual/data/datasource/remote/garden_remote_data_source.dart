import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:my_garden_app/core/data/datasource/datasource.dart';
import 'package:my_garden_app/core/data/error/exception.dart';
import 'package:my_garden_app/core/data/model/common_request_model.dart';
import 'package:my_garden_app/core/network/api_config.dart';
import 'package:my_garden_app/feature/garden_visual/data/model/garden_model.dart';

class GardenRemoteDataSource
    extends RemoteDataSource<List<GardenModel>, CommonRequestModel> {
  final http.Client client;

  GardenRemoteDataSource({required this.client});

  @override
  Future<List<GardenModel>> load(
    CommonRequestModel request,
    String token,
  ) async {
    try {
      final uri = Uri.parse('$BASE_URL/garden').replace(
        queryParameters: {
          'userId': [request.userId],
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
                  GardenModel.fromJson(value as Map<String, dynamic>),
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
  Future<void> upload(List<GardenModel> remoteLoad, String token) async {
    try {
      final uri = Uri.parse('$BASE_URL/garden');
      final body = json.encode(remoteLoad);
      final response = await client.post(
        uri,
        body: body,
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
      final uri = Uri.parse('$BASE_URL/garden');

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
