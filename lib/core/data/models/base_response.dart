import 'package:hitbitz/core/config/type_defs.dart';

class BaseResponse<T> {
  final bool errorCode;
  final String message;
  final T data;

  const BaseResponse({
    required this.data,
    required this.message,
    required this.errorCode,
  });

  factory BaseResponse.fromJson({
    required BodyMap json,
    required DataConverter dataConverter,
  }) =>
      BaseResponse(
        errorCode: json['status'],
        message: json['message'],
        data: dataConverter(json['data']),
      );
}
