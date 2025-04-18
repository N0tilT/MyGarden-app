import 'package:dartz/dartz.dart';
import 'package:my_garden_app/core/data/error/failure.dart';
import 'package:my_garden_app/core/data/usecases/usecase.dart';
import 'package:my_garden_app/feature/auth/data/models/security_request_model.dart';
import 'package:my_garden_app/feature/auth/data/models/security_response_model.dart';
import 'package:my_garden_app/feature/auth/domain/repositories/auth_repository.dart';

class Auth extends Usecase<SecurityResponseModel, SecurityRequestModel> {
  final AuthRepository authRepository;

  Auth({required this.authRepository});

  @override
  Future<Either<Failure, SecurityResponseModel>> call(
      SecurityRequestModel request) async {
    return await authRepository.auth(request);
  }
}
