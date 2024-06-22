import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:hitbitz/core/error/exception.dart';
import 'package:hitbitz/core/services/device_info_service.dart';
import 'package:http/http.dart' as http;

import '../config/type_defs.dart';
import '../extensions/colorful_logging_extension.dart';
import '../services/shared_preferences_service.dart';

mixin RequestExceptionsHandler {
  static Future<String> tryCallRequest(
    String method, {
    required Uri uri,
    BodyMap? body,
    bool sendDeviceId = false,
  }) async =>
      handelExceptions(
        method: method,
        function: () async {
          String? token = SharedPreferencesService.getToken();
          bool isAuth = SharedPreferencesService.isAuth();
          String? fcmToken = await FirebaseMessaging.instance.getToken();

          log(token.toString().logWhite);

          final Map<String, String> headers = {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            if (fcmToken != null) 'fcm_token': fcmToken,
            if (isAuth) 'Authorization': 'Bearer $token',
          };

          if (body != null && sendDeviceId) {
            final deviceId = await DeviceInfoService.getDeviceId();
            body['deviceId'] = deviceId;
          }

          http.Request request = http.Request(method, uri);
          request.body = jsonEncode(body);
          request.headers.addAll(headers);

          log('=====================================  API  ====================================='.logBlue, name: '');
          log(uri.toString().logMagenta, name: 'api');
          log(method.logWhite, name: 'method');
          log(request.body.logGreen, name: 'request body');

          http.StreamedResponse streamedResponse = await request.send().timeout(const Duration(seconds: 30));
          http.Response response = await http.Response.fromStream(streamedResponse);
          log(response.body.logGreen, name: 'response body');
          log(response.statusCode.toString().logGreen, name: 'status code');
          log('=====================================  END  ====================================='.logBlue, name: '');

          if (response.statusCode == 200) {
            return response.body;
          } else {
            Exception exception = getException(response: response);
            throw exception;
          }
        },
      );

  static Future<String> handelExceptions({
    required String method,
    required Future<String> Function() function,
  }) async {
    try {
      return function();
    } on HttpException {
      log(
        'http exception'.logRed,
        name: 'RequestManager $method function',
      );
      rethrow;
    } on FormatException {
      log(
        'something went wrong in parsing the uri'.logRed,
        name: 'RequestManager $method function',
      );
      rethrow;
    } on SocketException {
      log(
        'socket exception'.logRed,
        name: 'RequestManager $method function',
      );
      rethrow;
    } catch (e) {
      log(
        e.toString().logRed,
        name: 'RequestManager $method function',
      );
      rethrow;
    }
  }

  static Exception getException({required http.Response response}) {
    final String message = json.decode(response.body)['message'] ?? json.decode(response.body)['title'];

    if (response.statusCode == 401) return UnauthenticatedException(message: message, statusCode: 401);
    // else if (response.statusCode == 422) return ValidationException(message);
    // else if (response.statusCode == 413) return EmailUsedException();
    // else if (response.statusCode == 200) return PasswordOrUsernameWrongException();
    // else if (response.statusCode == 415) return PhoneNumberUsedException();
    // else if (response.statusCode == 420) return UserBlockedException();

    return ServerException(message: message, statusCode: response.statusCode);
  }
}
