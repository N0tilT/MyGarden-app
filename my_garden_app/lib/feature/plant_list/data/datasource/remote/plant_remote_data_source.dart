import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:my_garden_app/core/data/datasource/datasource.dart';
import 'package:my_garden_app/core/data/error/exception.dart';
import 'package:my_garden_app/core/network/api_config.dart';
import 'package:my_garden_app/feature/plant_list/data/model/plant_model.dart';

class PlantRemoteDataSource extends RemoteDataSource<List<PlantModel>, void> {
  final http.Client client;

  PlantRemoteDataSource({required this.client});

  @override
  Future<List<PlantModel>> studentLoad(void request) async {
    try {
      final response = await client.get(
        Uri.parse('$BASE_URL/course'),
      );
      if (response.statusCode == 200) {
        final decoded = json.decode(response.body) as List<dynamic>;
        final responseModel = decoded
            .map((dynamic value) =>
                PlantModel.fromJson(value as Map<String, dynamic>),)
            .toList();
        return responseModel;
      } else {
        throw ServerException();
      }
    } catch (e) {
      throw ServerException();
    }
  }
}
