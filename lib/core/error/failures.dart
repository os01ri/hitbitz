abstract class Failure {
  final String message;
  final int? code;

  const Failure({required this.message, this.code});

  @override
  String toString() => 'Failure(message: $message, code: $code)';
}

// General failures
class ServerFailure extends Failure {
  const ServerFailure({
    String? message,
    int? code,
  }) : super(message: message ?? 'ServerFailure', code: code);
}

class OperationFailedFailure extends Failure {
  const OperationFailedFailure({
    String? message,
    int? code,
  }) : super(message: message ?? 'OperationFailedFailure', code: code);
}

class HttpFailure extends Failure {
  const HttpFailure({
    String? message,
    int? code,
  }) : super(message: message ?? 'HttpFailure', code: code);
}

class DuplicatedCartItemFailure extends Failure {
  const DuplicatedCartItemFailure({
    String? message,
    int? code,
  }) : super(message: message ?? 'DuplicatedCartItemFailure', code: code);
}

class EmptyCartFailure extends Failure {
  const EmptyCartFailure({
    String? message,
    int? code,
  }) : super(message: message ?? 'EmptyCartFailure', code: code);
}

class DuplicateInvoiceFailure extends Failure {
  const DuplicateInvoiceFailure({
    String? message,
    int? code,
  }) : super(message: message ?? 'DuplicateInvoiceFailure', code: code);
}

class NoVisitEventFailure extends Failure {
  const NoVisitEventFailure({
    String? message,
    int? code,
  }) : super(message: message ?? 'NoVisitEventFailure', code: code);
}

class NoInternetFailure extends Failure {
  const NoInternetFailure({
    String? message,
    int? code,
  }) : super(message: message ?? 'NoInternetFailure', code: code);
}

class UnknownFailure extends Failure {
  const UnknownFailure({
    String? message,
    int? code,
  }) : super(message: message ?? 'UnknownFailure', code: code);
}

class OutNumberOfDevicesFailure extends Failure {
  const OutNumberOfDevicesFailure({
    String? message,
    int? code,
  }) : super(message: message ?? 'OutNumberOfDevices', code: code);
}

class WrongApplicationIDFailure extends Failure {
  const WrongApplicationIDFailure({
    String? message,
    int? code,
  }) : super(message: message ?? 'WrongApplicationID', code: code);
}

class WrongKeyFailure extends Failure {
  const WrongKeyFailure({
    String? message,
    int? code,
  }) : super(message: message ?? 'WrongKey', code: code);
}
