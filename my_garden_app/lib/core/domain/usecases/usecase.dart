import 'package:dartz/dartz.dart';
import 'package:my_garden_app/core/data/error/failure.dart';

abstract class Usecase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}
