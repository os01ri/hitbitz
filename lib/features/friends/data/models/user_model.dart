import 'package:hitbitz/core/data/models/media_model.dart';

List<UserModel> usersListFromJson(dynamic decodedJson) => List<UserModel>.from(decodedJson.map((x) => UserModel.fromJson(x)));

class UserModel {
  final int? id;
  final String? userName;
  final String? fullName;
  final DateTime? birthDate;
  final String? email;
  final MediaModel? profileImage;

  UserModel({
    this.id,
    this.userName,
    this.fullName,
    this.birthDate,
    this.email,
    this.profileImage,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json['id'],
        userName: json['user_name'],
        fullName: json['full_name'],
        birthDate: json['birth_date'] == null ? null : DateTime.parse(json['birth_date']),
        email: json['email'],
        profileImage: json['profileImage'] == null ? null : MediaModel.fromJson(json['profileImage']),
      );
}
