class ServerException implements Exception {
  final String? message;
  final int? statusCode;

  const ServerException({
    this.message = 'ServerException',
    this.statusCode,
  });

  @override
  String toString() => 'ServerException(message: $message, statusCode: $statusCode)';
}

class UnauthenticatedException implements Exception {
  final String? message;
  final int? statusCode;

  const UnauthenticatedException({
    this.message = 'UnauthenticatedException',
    this.statusCode,
  });

  @override
  String toString() => 'UnauthenticatedException(message: $message, statusCode: $statusCode)';
}

class OperationFailedException implements Exception {
  final String? message;
  final int? statusCode;

  const OperationFailedException({
    this.message = 'OperationFailedException',
    this.statusCode,
  });

  @override
  String toString() => 'OperationFailedException(message: $message, statusCode: $statusCode)';
}

class DuplicatedCartItemException implements Exception {
  final String? message;
  final int? statusCode;

  const DuplicatedCartItemException({
    this.message = 'DuplicatedCartItemException',
    this.statusCode,
  });

  @override
  String toString() => 'DuplicatedCartItemException(message: $message, statusCode: $statusCode)';
}

class EmptyCartException implements Exception {
  final String? message;
  final int? statusCode;

  const EmptyCartException({
    this.message = 'EmptyCartException',
    this.statusCode,
  });

  @override
  String toString() => 'EmptyCartException(message: $message, statusCode: $statusCode)';
}

class DuplicateInvoiceException implements Exception {
  final String? message;
  final int? statusCode;

  const DuplicateInvoiceException({
    this.message = 'DuplicateInvoiceException',
    this.statusCode,
  });

  @override
  String toString() => 'DuplicateInvoiceException(message: $message, statusCode: $statusCode)';
}

class NoVisitEventException implements Exception {
  final String? message;
  final int? statusCode;

  const NoVisitEventException({
    this.message = 'NoVisitEventException',
    this.statusCode,
  });

  @override
  String toString() => 'NoVisitEventException(message: $message, statusCode: $statusCode)';
}

class NoInternetException implements Exception {
  final String? message;
  final int? statusCode;

  const NoInternetException({
    this.message = 'NoInternetException',
    this.statusCode,
  });

  @override
  String toString() => 'NoInternetException(message: $message, statusCode: $statusCode)';
}
