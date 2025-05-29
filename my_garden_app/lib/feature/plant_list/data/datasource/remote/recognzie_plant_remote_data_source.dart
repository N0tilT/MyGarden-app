import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:my_garden_app/core/data/error/exception.dart';
import 'package:my_garden_app/core/network/api_config.dart';
import 'package:my_garden_app/feature/plant_list/data/model/plant_Prefill_response_model.dart';
import 'package:my_garden_app/feature/plant_list/data/model/plant_recognition_response_model.dart';

class RecognziePlantRemoteDataSource {
  final http.Client client;

  RecognziePlantRemoteDataSource({required this.client});
  Future<PlantRecognitionResponseModel> recognize(
    File remoteLoad,
    String token,
  ) async {
    try {
      final uri = Uri.parse('$BASE_URL/recognize');
      final request = http.MultipartRequest('POST', uri);

      request.files.add(
        await http.MultipartFile.fromPath(
          'image',
          remoteLoad.path,
          contentType: MediaType('image', 'jpeg'),
        ),
      );
      request.headers.addAll({
        "Authorization": "Bearer $token",
        'Content-type': 'application/json; charset=UTF-8',
      });
      final response = await request.send();
      if (response.statusCode == 200) {
        final responseBody = await response.stream.bytesToString();
        final responseModel = PlantRecognitionResponseModel.fromJson(
          json.decode(responseBody) as Map<String, dynamic>,
        );
        return responseModel;
      } else {
        throw ServerException();
      }
    } catch (e) {
      throw ServerException();
    }
  }

  Future<PlantPrefillResponseModel> prefill(
    String remoteLoad,
    String token,
  ) async {
    try {
      final uri = Uri.parse('$BASE_URL/prefill?type=$remoteLoad');
      final request = http.MultipartRequest('GET', uri);
      request.headers.addAll({
        "Authorization": "Bearer $token",
        'Content-type': 'application/json; charset=UTF-8',
      });
      final response = await request.send();
      if (response.statusCode == 200) {
        final responseBody = await response.stream.bytesToString();
        final responseModel = PlantPrefillResponseModel.fromJson(
          json.decode(responseBody) as Map<String, dynamic>,
        );
        return responseModel;
      } else {
        throw ServerException();
      }
    } catch (e) {
      throw ServerException();
    }
  }
}
