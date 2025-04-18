import 'package:dartz/dartz.dart';
import 'package:my_garden_app/core/data/error/failure.dart';
import 'package:my_garden_app/feature/auth/data/models/security_request_model.dart';
import 'package:my_garden_app/feature/auth/data/models/security_response_model.dart';

abstract class AuthRepository {
  Future<Either<Failure, SecurityResponseModel>> auth(
    SecurityRequestModel request,
  );
  Future<Either<Failure, SecurityResponseModel>> getUserData();
  Future<Either<Failure, void>> logout();
}
