import 'package:hitbitz/features/profile/data/models/user_profile_model.dart';
import 'package:hitbitz/features/quiz/data/models/quiz_model.dart';

List<ChallengeModel> challengeModelFromJson(dynamic decodedJson) =>
    List<ChallengeModel>.from(decodedJson.map((x) => ChallengeModel.fromJson(x)));

class ChallengeModel {
  final int id;
  final UserProfileModel? host;
  final UserProfileModel? guest;
  final QuizModel? quiz;
  final bool? isWinner;

  ChallengeModel({
    required this.id,
    this.host,
    this.guest,
    this.quiz,
    this.isWinner,
  });

  factory ChallengeModel.fromJson(Map<String, dynamic> json) => ChallengeModel(
        id: json['id'],
        host: json['host'] == null ? null : UserProfileModel.fromJson(json['host']),
        guest: json['guest'] == null ? null : UserProfileModel.fromJson(json['guest']),
        quiz: json['quiz'] == null ? null : QuizModel.fromJson(json['quiz']),
        isWinner: json['is_winner'],
      );
}
