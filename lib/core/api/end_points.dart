import 'package:hitbitz/core/config/type_defs.dart';

class EndPoints {
  const EndPoints._();

  ////////////!      General      !////////////
  static const _scheme = 'http';
  static const _host = '10.0.2.2';
  static const _port = 8000;

  static String imageUrl(String path) => '$_scheme://$_host:$_port/${path.replaceAll('\\', '/')}';

  static Uri _mainUri({
    required String path,
    ParamsMap params,
  }) {
    final uri = Uri(
      scheme: _scheme,
      host: _host,
      path: 'api/$path',
      port: _port,
      queryParameters: params,
    );
    return uri;
  }

  ////////////!        User        !////////////
  static Uri _user({required String path, ParamsMap params}) => _mainUri(path: 'user/$path', params: params);
  static Uri signUp({ParamsMap params}) => _user(path: 'register', params: params);
  static Uri logIn({ParamsMap params}) => _user(path: 'login', params: params);

  static Uri getCategories({ParamsMap params}) => _user(path: 'categories', params: params);
  static Uri getRoadMaps({ParamsMap params}) => _user(path: 'roadmaps', params: params);
  static Uri getLevels({ParamsMap params}) => _user(path: 'levels', params: params);
}
