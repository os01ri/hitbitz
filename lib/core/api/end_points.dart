import 'package:hitbitz/core/config/type_defs.dart';

class EndPoints {
  const EndPoints._();

  ////////////!      General      !////////////
  static const _scheme = 'http';
  // static const _host = '192.168.43.127';
  // static const _host = '10.0.2.2';
  static const _host = 'hitbitz.online';
  // static const _port = 8000;

  // static String imageUrl(String path) {
  //   const base = '~/osama-rida/Documents/projects/hitbitz_backend/public/images/temp/1/';
  //   final fileName = '${path.getFileName()}.${path.getFileType()}';
  //   log(base + fileName);
  //   return base + fileName;
  //   // return '$_scheme://$_host:$_port/ ${path.replaceAll('\\', '/')}';
  // }

  static Uri _mainUri({
    required String path,
    ParamsMap params,
  }) {
    final uri = Uri(
      scheme: _scheme,
      host: _host,
      path: 'api/$path',
      // port: _port,
      queryParameters: params,
    );
    return uri;
  }

  ////////////!        User        !////////////
  static Uri _user({required String path, ParamsMap params}) => _mainUri(path: 'user/$path', params: params);
  static Uri signUp({ParamsMap params}) => _user(path: 'register', params: params);
  static Uri logIn({ParamsMap params}) => _user(path: 'login', params: params);
  static Uri getUsers({ParamsMap params}) => _user(path: 'users', params: params);
  static Uri showUser({required int id, ParamsMap params}) => _user(path: 'users/$id', params: params);
  static Uri sendFriendRequest({ParamsMap params}) => _user(path: 'friendRequests', params: params);

  static Uri getCategories({ParamsMap params}) => _user(path: 'categories', params: params);

  static Uri getRoadMaps({ParamsMap params}) => _user(path: 'roadmaps', params: params);
  static Uri showRoadMap({required int id, ParamsMap params}) => _user(path: 'roadmaps/$id', params: params);
  static Uri startRoadMap({required int id, ParamsMap params}) => _user(path: 'roadmaps/$id/start', params: params);
  static Uri roadMapToggleBookmark({required int id}) => _user(path: 'roadmaps/$id/toggleFavorite');
  static Uri getSavedRoadmaps({ParamsMap params}) => _user(path: 'roadmaps/favorites/index');

  // static Uri getLevels({ParamsMap params}) => _user(path: 'levels', params: params);
  static Uri getSteps({ParamsMap params}) => _user(path: 'levelStep', params: params);

  static Uri getQuizzes({ParamsMap params}) => _user(path: 'quizzes', params: params);
  static Uri showQuiz({required int id}) => _user(path: 'quizzes/$id');
  static Uri completeQuiz({required int id}) => _user(path: 'quizzes/$id/complete');

  static Uri makeSuggestion({ParamsMap params}) => _user(path: 'makeSuggestion', params: params);

  static Uri getNotifications({ParamsMap params}) => _user(path: 'notifications', params: params);
}
