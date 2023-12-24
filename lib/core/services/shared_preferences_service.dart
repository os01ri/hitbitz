import 'dart:developer';

import 'package:hitbitz/core/extensions/colorful_logging_extension.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {
  const SharedPreferencesService._();

  static late final SharedPreferences _sp;

  static Future<void> init() async => _sp = await SharedPreferences.getInstance();

  static bool isAuth() {
    final bool isAuth = _sp.containsKey(SharedPreferencesKeys.accessToken) &&
        _sp.containsKey(SharedPreferencesKeys.serverHost) &&
        _sp.containsKey(SharedPreferencesKeys.serverPort);

    if (isAuth) {
      getToken();
      getServerPort();
      getServerHost();
    }

    return isAuth;
  }

  static Future<bool> clearStorage() async {
    return await _sp.clear();
  }

  ////////////!         Token          ////////////

  static Future<bool> setToken(String token) async {
    final isDone = await _sp.setString(SharedPreferencesKeys.accessToken, token);
    if (isDone) {
      log(token.logGreen, name: 'token saved to storage');
    } else {
      log(token.logRed, name: 'token hasn\'t been saved to storage');
    }
    return isDone;
  }

  static String? getToken() {
    String? token = _sp.getString(SharedPreferencesKeys.accessToken);
    // log(token.toString().logWhite, name: 'user token');
    return token; //"eyJhbGciOiJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNobWFjLXNoYTI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1laWRlbnRpZmllciI6IjY1ODE4NTYwLTkyODYtNDY0OC1iMmE0LTQ0NjBlNGNhMjc4YSIsImp0aSI6IjI1ODU4MTBlLWNiOWMtNDA0OS1iYjA4LTY0MjFmOGNkNzM5ZCIsImh0dHA6Ly9zY2hlbWFzLm1pY3Jvc29mdC5jb20vd3MvMjAwOC8wNi9pZGVudGl0eS9jbGFpbXMvcm9sZSI6IiIsInN1YiI6ItmF2YbYr9mI2KggMiIsIkNvbm5lY3Rpb25TdHJpbmciOiJQYXNzd29yZD0xMjMxMjM7Q29ubmVjdGlvbiBUaW1lb3V0PTU7UGVyc2lzdCBTZWN1cml0eSBJbmZvPVRydWU7VXNlciBJRD1TYWxlc01hbjtJbml0aWFsIENhdGFsb2c9TmV3U2FsZXNNYW5UZXN0O0RhdGEgU291cmNlPTE4NS4yMTkuMTMyLjExMywxNDk5O1RydXN0U2VydmVyQ2VydGlmaWNhdGU9VHJ1ZSIsInByb2plY3RJZCI6Ijc1YjhlYjUxLTM5MTAtNDI1ZS1iMmU1LTU1OGFjYTA3ODc2MyIsInJvbGVJZCI6ImZkNzA4MjFmLTE2NGYtNGUxYS05OTJiLTExMjlhMDcxNzg1YiIsImV4cCI6MTY5OTYwMTAzM30.bcKHI0gfEE1MvCYK6G3J6ZByy3PlOaMMvB04RIW9AKI";
  }

  static Future<bool> deleteToken() async {
    final isDone = await _sp.remove(SharedPreferencesKeys.accessToken);
    if (isDone) {
      log('token deleted from storage'.logGreen);
    } else {
      log('token hasn\'t been deleted from storage'.logRed);
    }
    return isDone;
  }

  ////////////!         ServerUrl [host]         ////////////

  static Future<bool> setServerHost(String host) async {
    final isDone = await _sp.setString(SharedPreferencesKeys.serverHost, host);
    if (isDone) {
      log(host.logGreen, name: 'host saved to storage');
    } else {
      log(host.logRed, name: 'host hasn\'t been saved to storage');
    }
    return isDone;
  }

  static String? getServerHost() {
    String? host = _sp.getString(SharedPreferencesKeys.serverHost);
    log(host.toString().logWhite, name: 'host');
    return host;
  }

  static Future<bool> deleteServerHost() async {
    final isDone = await _sp.remove(SharedPreferencesKeys.serverHost);
    if (isDone) {
      log('host deleted from storage'.logGreen);
    } else {
      log('host hasn\'t been deleted from storage'.logRed);
    }
    return isDone;
  }

  ////////////!         ServerUrl [port]         ////////////

  static Future<bool> setServerPort(int? port) async {
    if (port == null) {
      _sp.remove(SharedPreferencesKeys.serverPort);
      return true;
    }

    final isDone = await _sp.setInt(SharedPreferencesKeys.serverPort, port);
    if (isDone) {
      log(port.toString().logGreen, name: 'port saved to storage');
    } else {
      log(port.toString().logRed, name: 'port hasn\'t been saved to storage');
    }
    return isDone;
  }

  static int? getServerPort() {
    int? port = _sp.getInt(SharedPreferencesKeys.serverPort);
    log(port.toString().logWhite, name: 'port');
    return port;
  }

  static Future<bool> deleteServerPort() async {
    final isDone = await _sp.remove(SharedPreferencesKeys.serverPort);
    if (isDone) {
      log('port deleted from storage'.logGreen);
    } else {
      log('port hasn\'t been deleted from storage'.logRed);
    }
    return isDone;
  }
}

class SharedPreferencesKeys {
  const SharedPreferencesKeys._();

  static const String accessToken = 'accessToken';
  static const String serverHost = 'serverHost';
  static const String serverPort = 'serverPort';
}
