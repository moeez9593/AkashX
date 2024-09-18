import 'package:akashx/app/enums/status_code_enum.dart';

sealed class Failure {
  const Failure(); // Base constructor

  const factory Failure.emptyString({required String? property}) = _EmptyString;
  const factory Failure.exceedingCharacterLength({int? min, int? max}) = _ExceedingCharacterLength;
  const factory Failure.exceedingListLength({
    required List<dynamic> failedValue,
    required int max,
  }) = _ExceedingListLength;
  const factory Failure.invalidEmailFormat() = _InvalidEmailFormat;
  const factory Failure.invalidValue({required dynamic failedValue}) = _InvalidValue;
  const factory Failure.invalidUrl({required String failedValue}) = _InvalidUrl;
  const factory Failure.unexpected(String? error) = _UnexpectedError;
  const factory Failure.serverError(StatusCode code, String? error) = _ServerError;
  const factory Failure.userNotFound() = _UserNotFound;
}

// Each Failure type should be implemented as a separate class:
final class _EmptyString extends Failure {
  final String? property;

  const _EmptyString({required this.property});
}

final class _ExceedingCharacterLength extends Failure {
  final int? min;
  final int? max;

  const _ExceedingCharacterLength({this.min, this.max});
}

final class _ExceedingListLength extends Failure {
  final List<dynamic> failedValue;
  final int max;

  const _ExceedingListLength({
    required this.failedValue,
    required this.max,
  });
}

final class _InvalidEmailFormat extends Failure {
  const _InvalidEmailFormat();
}

final class _InvalidValue extends Failure {
  final dynamic failedValue;

  const _InvalidValue({required this.failedValue});
}

final class _InvalidUrl extends Failure {
  final String failedValue;

  const _InvalidUrl({required this.failedValue});
}

final class _UnexpectedError extends Failure {
  final String? error;

  const _UnexpectedError(this.error);
}

final class _ServerError extends Failure {
  final StatusCode code;
  final String? error;

  const _ServerError(this.code, this.error);
}

final class _UserNotFound extends Failure {
  const _UserNotFound();
}
