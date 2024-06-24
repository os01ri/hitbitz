import 'dart:convert';

UserDataModel userDataModelFromJson(String str) => UserDataModel.fromJson(json.decode(str));

class UserDataModel {
  final int id;
  final String? fullName;
  final String? userName;
  final String? email;
  final DateTime? emailVerifiedAt;
  final DateTime? birthDate;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? referrerId;
  final String? accessToken;

  const UserDataModel({
    required this.id,
    this.fullName,
    this.userName,
    this.email,
    this.emailVerifiedAt,
    this.birthDate,
    this.createdAt,
    this.updatedAt,
    this.referrerId,
    this.accessToken,
  });

  factory UserDataModel.fromJson(Map<String, dynamic> json) => UserDataModel(
        id: json['id'],
        fullName: json['full_name'],
        userName: json['user_name'],
        email: json['email'],
        emailVerifiedAt: json['email_verified_at'] == null ? null : DateTime.parse(json['email_verified_at']),
        birthDate: json['birth_date'] == null ? null : DateTime.parse(json['birth_date']),
        createdAt: json['created_at'] == null ? null : DateTime.parse(json['created_at']),
        updatedAt: json['updated_at'] == null ? null : DateTime.parse(json['updated_at']),
        referrerId: json['referrer_id'],
        accessToken: json['access_token'],
      );
}
