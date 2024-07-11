import 'package:dartz/dartz.dart';
import 'package:my_garden_app/core/data/error/failure.dart';
import 'package:my_garden_app/core/data/usecases/usecase.dart';
import 'package:my_garden_app/feature/auth/data/models/token_model.dart';
import 'package:my_garden_app/feature/auth/domain/repositories/auth_repository.dart';

class GetToken extends Usecase<TokenModel,void>{
  final AuthRepository authRepository;

  GetToken({required this.authRepository});

  @override
  Future<Either<Failure,TokenModel>> call(void request) async {
    return await authRepository.getToken();
  }
}
