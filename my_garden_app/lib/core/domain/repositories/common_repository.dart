import 'package:dartz/dartz.dart';
import 'package:my_garden_app/core/data/error/failure.dart';

abstract class CommonRepository<CommonResponseType, CommonRequestType> {
  Future<Either<Failure, CommonResponseType>> load(
    CommonRequestType request,
    String token, [
    bool remote = true,
  ]);

  Future<Either<Failure, void>> add(
    CommonResponseType request,
    String token, [
    bool remote = true,
  ]);
}
