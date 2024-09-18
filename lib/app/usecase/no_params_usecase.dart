import 'package:akashx/core/domain/model/failure.dart';
import 'package:fpdart/fpdart.dart';

abstract class NoParamUsecase<Type> {
  Future<Either<Failure, Type>> call();
}
