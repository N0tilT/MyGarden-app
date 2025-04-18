import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:my_garden_app/core/data/datasource/datasource.dart';
import 'package:my_garden_app/core/data/error/exception.dart';
import 'package:my_garden_app/core/network/api_config.dart';
import 'package:my_garden_app/feature/plant_list/data/model/plant_model.dart';
import 'package:my_garden_app/feature/plant_list/data/model/plant_request_model.dart';

class PlantRemoteDataSource
    extends RemoteDataSource<List<PlantModel>, PlantRequestModel> {
  final http.Client client;

  PlantRemoteDataSource({required this.client});

  @override
  Future<List<PlantModel>> load(PlantRequestModel request, String token) async {
    try {
      final uri = Uri.parse('$BASE_URL/plant').replace(
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
        },
      );
      if (response.statusCode == 200) {
        final decoded = json.decode(response.body) as List<dynamic>;
        final responseModel = decoded
            .map(
              (dynamic value) =>
                  PlantModel.fromJson(value as Map<String, dynamic>),
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
  Future<void> upload(List<PlantModel> remoteLoad, String token) {
    // ignore: void_checks
    return Future.value(remoteLoad);
  }
}
