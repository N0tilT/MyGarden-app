import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:my_garden_app/core/network/api_config.dart';
import 'package:http_parser/http_parser.dart';

class RecognziePlantRemoteDataSource {
  final http.Client client;

  RecognziePlantRemoteDataSource({required this.client});
  Future<void> upload(File remoteLoad, String token) async {
    try {
      final uri = Uri.parse('$BASE_URL/recognize');
      final request = http.MultipartRequest('POST', uri);

      request.files.add(await http.MultipartFile.fromPath(
        'image',
        remoteLoad!.path,
        contentType: MediaType('image', 'jpeg'),
      ));
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
                  WateringNeedModel.fromJson(value as Map<String, dynamic>),
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
}
