import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:my_garden_app/core/data/datasource/datasource.dart';
import 'package:my_garden_app/core/data/error/exception.dart';
import 'package:my_garden_app/core/data/model/common_request_model.dart';
import 'package:my_garden_app/core/network/api_config.dart';
import 'package:my_garden_app/feature/plant_list/data/model/garden_type_model.dart';

class GardenTypeRemoteDataSource
    extends RemoteDataSource<List<GardenTypeModel>, CommonRequestModel> {
  final http.Client client;

  GardenTypeRemoteDataSource({required this.client});

  @override
  Future<List<GardenTypeModel>> load(
    CommonRequestModel request,
    String token,
  ) async {
    try {
      final uri = Uri.parse('$BASE_URL/garden_type').replace(
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
                  GardenTypeModel.fromJson(value as Map<String, dynamic>),
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
  Future<void> upload(List<GardenTypeModel> remoteLoad, String token) async {}
}
