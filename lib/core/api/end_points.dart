import 'package:hitbitz/core/config/type_defs.dart';

class EndPoints {
  const EndPoints._();

  ////////////!      General      !////////////
  static const scheme = 'http';
  static const host = '192.168.43.127';
  // static const host = '10.0.2.2';
  // static const host = '10.42.0.1';
  // static const host = 'hitbitz.online';
  static const port = 8000;

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
      scheme: scheme,
      host: host,
      path: 'api/$path',
      port: port,
      queryParameters: params,
    );
    return uri;
  }

  static Uri uploadImage({ParamsMap params}) => _mainUri(path: 'uploadImage', params: params);

  ////////////!        User        !////////////
  static Uri _user({required String path, ParamsMap params}) => _mainUri(path: 'user/$path', params: params);
  static Uri signUp({ParamsMap params}) => _user(path: 'register', params: params);
  static Uri logIn({ParamsMap params}) => _user(path: 'login', params: params);
  static Uri forgetPassword({ParamsMap params}) => _user(path: 'forgetPassword', params: params);
  static Uri resetPassword({ParamsMap params}) => _user(path: 'resetPassword', params: params);
  
  static Uri getProfile({ParamsMap params}) => _user(path: 'profile', params: params);
  static Uri updateProfile({ParamsMap params}) => _user(path: 'updateProfile', params: params);
  static Uri getUsers({ParamsMap params}) => _user(path: 'users', params: params);
  static Uri showUser({required int id, ParamsMap params}) => _user(path: 'users/$id', params: params);
  static Uri friendRequests({ParamsMap params}) => _user(path: 'friendRequests', params: params);
  static Uri acceptRequest({ParamsMap params}) => _user(path: 'acceptRequest', params: params);
  static Uri friends({ParamsMap params}) => _user(path: 'friends', params: params);

  static Uri redeemCertificate({ParamsMap params}) => _user(path: 'certificate', params: params);

  static Uri inviteToChallenge({ParamsMap params}) => _user(path: 'challenge', params: params);
  static Uri getChallenges({ParamsMap params}) => _user(path: 'challenges', params: params);

  static Uri getCategories({ParamsMap params}) => _user(path: 'categories', params: params);

  static Uri getHomeRoadmap({ParamsMap params}) => _user(path: 'getHomeRoadmap', params: params);
  static Uri getRoadMaps({ParamsMap params}) => _user(path: 'roadmaps', params: params);
  static Uri showRoadMap({required int id, ParamsMap params}) => _user(path: 'roadmaps/$id', params: params);
  static Uri startRoadMap({required int id, ParamsMap params}) => _user(path: 'roadmaps/$id/start', params: params);
  static Uri roadMapToggleBookmark({required int id}) => _user(path: 'roadmaps/$id/toggleFavorite');
  static Uri getSavedRoadmaps({ParamsMap params}) => _user(path: 'roadmaps/favorites/index');

  // static Uri getLevels({ParamsMap params}) => _user(path: 'levels', params: params);
  static Uri getSteps({ParamsMap params}) => _user(path: 'levelStep', params: params);

  static Uri getQuizzes({ParamsMap params}) => _user(path: 'quizzes', params: params);
  static Uri showQuiz({required int id}) => _user(path: 'quizzes/$id');
  static Uri createCustomQuiz({ParamsMap params}) => _user(path: 'quizzes/createCustomQuiz', params: params);
  static Uri completeQuiz({required int id}) => _user(path: 'quizzes/$id/complete');
  static Uri completeCustomQuiz({ParamsMap params}) => _user(path: 'quizzes/completeCustomQuiz', params: params);

  static Uri makeSuggestion({ParamsMap params}) => _user(path: 'makeSuggestion', params: params);
  static Uri sendCv() => _mainUri(path: 'admin/cvs');

  static Uri getNotifications({ParamsMap params}) => _user(path: 'notifications', params: params);
}
