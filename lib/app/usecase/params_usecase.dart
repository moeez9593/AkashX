import 'package:akashx/core/domain/model/failure.dart';
import 'package:fpdart/fpdart.dart';

abstract class ParamUsecase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}
