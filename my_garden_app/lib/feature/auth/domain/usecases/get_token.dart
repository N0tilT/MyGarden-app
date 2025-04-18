import 'package:dartz/dartz.dart';
import 'package:my_garden_app/core/data/error/failure.dart';
import 'package:my_garden_app/core/data/usecases/usecase.dart';
import 'package:my_garden_app/feature/auth/data/models/security_response_model.dart';
import 'package:my_garden_app/feature/auth/domain/repositories/auth_repository.dart';

class GetUserData extends Usecase<SecurityResponseModel, void> {
  final AuthRepository authRepository;

  GetUserData({required this.authRepository});

  @override
  Future<Either<Failure, SecurityResponseModel>> call(void request) async {
    return await authRepository.getUserData();
  }
}
