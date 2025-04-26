import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:my_garden_app/core/data/datasource/datasource.dart';
import 'package:my_garden_app/core/data/error/exception.dart';
import 'package:my_garden_app/core/network/api_config.dart';
import 'package:my_garden_app/feature/auth/data/models/security_request_model.dart';
import 'package:my_garden_app/feature/auth/data/models/security_response_model.dart';

class AuthRemoteDataSource
    implements RemoteDataSource<SecurityResponseModel, SecurityRequestModel> {
  final http.Client client;

  AuthRemoteDataSource({required this.client});

  Future<SecurityResponseModel> auth(SecurityRequestModel request) async {
    try {
      final response = await client.post(
        Uri.parse('$BASE_URL/auth/login'),
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

  Future<bool> validateToken(String email, String token) async {
    try {
      final response = await client.get(
        Uri.parse('$BASE_URL/auth/validate?email=$email&token=$token'),
        headers: {
          'Content-type': 'application/json; charset=UTF-8',
        },
      );
      if (response.statusCode == 200) {
        return true;
      }
      return false;
    } catch (e) {
      throw ServerException();
    }
  }

  Future<SecurityResponseModel> refreshToken(
    SecurityResponseModel token,
  ) async {
    try {
      final response = await client.post(
        Uri.parse('$BASE_URL/auth/refresh'),
        body: json.encode({"token": token.refreshToken}),
        headers: {
          'Content-type': 'application/json; charset=UTF-8',
        },
      );
      if (response.statusCode == 200) {
        final decoded = json.decode(response.body) as Map<String, dynamic>;
        final responseModel = SecurityResponseModel.fromJson(decoded);
        print(responseModel);
        return responseModel;
      } else {
        throw ServerException();
      }
    } catch (e) {
      throw ServerException();
    }
  }

  Future<bool> logout(String email) async {
    try {
      final response = await client.post(
        Uri.parse('$BASE_URL/auth/logout'),
        body: json.encode({"email": email}),
        headers: {
          'Content-type': 'application/json; charset=UTF-8',
        },
      );
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Future<SecurityResponseModel> load(
    SecurityRequestModel request,
    String token,
  ) {
    // TODO: implement load
    throw UnimplementedError();
  }

  @override
  Future<void> upload(SecurityResponseModel remoteLoad, String token) {
    // TODO: implement upload
    throw UnimplementedError();
  }

  @override
  Future<void> delete(int id, String token) {
    // TODO: implement delete
    throw UnimplementedError();
  }
}
