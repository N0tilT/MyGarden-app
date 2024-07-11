import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:my_garden_app/core/data/datasource/datasource.dart';
import 'package:my_garden_app/core/data/error/exception.dart';
import 'package:my_garden_app/core/network/api_config.dart';
import 'package:my_garden_app/feature/auth/data/models/security_request_model.dart';
import 'package:my_garden_app/feature/auth/data/models/security_response_model.dart';
import 'package:my_garden_app/feature/auth/data/models/token_model.dart';

class AuthRemoteDataSource implements RemoteDataSource<SecurityRequestModel,SecurityResponseModel> {
  final http.Client client;

  AuthRemoteDataSource({required this.client});

  Future<SecurityResponseModel> auth(SecurityRequestModel request) async {
    try {
      final response = await client.post(
        Uri.parse('$BASE_URL/security/login'),
        body: json.encode(request.toJson()),
        headers: {
          'Content-type': 'application/json; charset=UTF-8',
        },
      );
      if (response.statusCode == 200) {
        final decoded = json.decode(response.body) as Map<String, dynamic>;
        final responseModel = SecurityResponseModel.fromJson(decoded);
        return responseModel;
      } else {
        throw ServerException();
      }
    } catch (e) {
      throw ServerException();
    }
  }
  
  Future<TokenModel> refreshToken() async {
    try {
      final response = await client.post(
        Uri.parse('http://88.210.3.137/api/token/refresh'),
        headers: {
          'Content-type': 'application/json; charset=UTF-8',
        },
      );
      if (response.statusCode == 200) {
        final decoded = json.decode(response.body) as Map<String, dynamic>;
        final responseModel = TokenModel.fromJson(decoded);
        return responseModel;
      } else {
        throw ServerException();
      }
    } catch (e) {
      throw ServerException();
    }
  }
  
  @override
  Future<SecurityRequestModel> studentLoad(SecurityResponseModel request) {
    // TODO: implement load
    throw UnimplementedError();
  }
  
  @override
  Future<SecurityRequestModel> teacherLoad(SecurityResponseModel request) {
    // TODO: implement teacherLoad
    throw UnimplementedError();
  }
}
