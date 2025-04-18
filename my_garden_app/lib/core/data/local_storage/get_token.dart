import 'package:dartz/dartz.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:my_garden_app/core/data/error/exception.dart';
import 'package:my_garden_app/core/data/error/failure.dart';
import 'package:my_garden_app/feature/auth/data/models/token_model.dart';

Future<Either<Failure, TokenModel>> getTokenFromLocalStorage(
  FlutterSecureStorage storage,
) async {
  try {
    final token = await storage.read(key: 'jwt_access_token');
    if (token != null) {
      return Right(
        TokenModel(
          token: token,
        ),
      );
    } else {
      throw CacheException();
    }
  } on CacheException {
    return const Left(
      CacheFailure(message: "Ошибка локального хранилища данных"),
    );
  }
}
