import 'package:hitbitz/core/data/models/media_model.dart';
import 'package:hitbitz/features/home/data/models/category_model.dart';

List<UserProfileModel> usersListFromJson(dynamic decodedJson) =>
    List<UserProfileModel>.from(decodedJson.map((x) => UserProfileModel.fromJson(x)));

class UserProfileModel {
  final int id;
  final String? userName;
  final String? fullName;
  final DateTime? birthDate;
  final String? email;
  final int? totalRoadmaps;
  final int? totalFails;
  final int? totalSuccess;
  final MediaModel? profileImage;
  final CategoryModel? category;

  UserProfileModel({
    required this.id,
    this.userName,
    this.fullName,
    this.birthDate,
    this.email,
    this.totalRoadmaps,
    this.totalFails,
    this.totalSuccess,
    this.profileImage,
    this.category,
  });

  factory UserProfileModel.fromJson(Map<String, dynamic> json) => UserProfileModel(
        id: json['id'],
        userName: json['user_name'],
        fullName: json['full_name'],
        birthDate: json['birth_date'] == null ? null : DateTime.parse(json['birth_date']),
        email: json['email'],
        totalRoadmaps: json['totalRoadmaps'],
        totalFails: json['totalFails'],
        totalSuccess: json['totalSuccess'],
        profileImage: json['profileImage'] == null ? null : MediaModel.fromJson(json['profileImage']),
        category: json['category'] == null ? null : CategoryModel.fromJson(json['category']),
      );
}
