import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:my_garden_app/core/data/error/exception.dart';
import 'package:my_garden_app/feature/auth/data/models/security_response_model.dart';
import 'package:my_garden_app/feature/auth/data/models/user_model/account_model.dart';

abstract class AuthLocalDataSource {
  Future<SecurityResponseModel> loadUserData();
  Future<void> updateToken(SecurityResponseModel token);
  Future<void> add(SecurityResponseModel remoteLoad);
  Future<void> logout();
}

class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  FlutterSecureStorage userStorage;

  AuthLocalDataSourceImpl({required this.userStorage});

  @override
  Future<void> add(SecurityResponseModel response) async {
    try {
      await userStorage.write(key: 'jwt_access_token', value: response.token);
      await userStorage.write(
        key: 'jwt_refresh_token',
        value: response.refreshToken,
      );
      await userStorage.write(
        key: 'userName',
        value: response.user?.userName ?? "",
      );
      await userStorage.write(key: 'userId', value: response.user?.id ?? "");
    } catch (e) {
      throw CacheException();
    }
  }

  @override
  Future<void> updateToken(SecurityResponseModel token) async {
    try {
      await userStorage.write(key: 'jwt_access_token', value: token.token);
      await userStorage.write(
        key: 'jwt_refresh_token',
        value: token.refreshToken,
      );
    } catch (e) {
      throw CacheException();
    }
  }

  @override
  Future<SecurityResponseModel> loadUserData() async {
    try {
      final token = await userStorage.read(key: 'jwt_access_token');
      final refreshToken = await userStorage.read(key: 'jwt_refresh_token');
      final userName = await userStorage.read(key: 'userName');
      final userId = await userStorage.read(key: 'userId');
      return SecurityResponseModel(
        token: token ?? "",
        refreshToken: refreshToken ?? "",
        user: AccountModel(id: userId ?? "", userName: userName),
      );
    } catch (e) {
      throw CacheException();
    }
  }

  @override
  Future<void> logout() async {
    await userStorage.delete(key: 'jwt_access_token');
    await userStorage.delete(key: 'jwt_refresh_token');
    await userStorage.delete(key: 'userName');
    await userStorage.delete(key: 'userId');
  }
}
