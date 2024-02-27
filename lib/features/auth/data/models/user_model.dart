import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
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

  const UserModel({
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

  UserModel copyWith({
    int? id,
    String? fullName,
    String? userName,
    String? email,
    DateTime? emailVerifiedAt,
    DateTime? birthDate,
    DateTime? createdAt,
    DateTime? updatedAt,
    int? referrerId,
    String? accessToken,
  }) =>
      UserModel(
        id: id ?? this.id,
        fullName: fullName ?? this.fullName,
        userName: userName ?? this.userName,
        email: email ?? this.email,
        emailVerifiedAt: emailVerifiedAt ?? this.emailVerifiedAt,
        birthDate: birthDate ?? this.birthDate,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        referrerId: referrerId ?? this.referrerId,
        accessToken: accessToken ?? this.accessToken,
      );

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
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

  Map<String, dynamic> toJson() => {
        'id': id,
        'full_name': fullName,
        'user_name': userName,
        'email': email,
        'email_verified_at': emailVerifiedAt?.toIso8601String(),
        'birth_date':
            "${birthDate!.year.toString().padLeft(4, '0')}-${birthDate!.month.toString().padLeft(2, '0')}-${birthDate!.day.toString().padLeft(2, '0')}",
        'created_at': createdAt?.toIso8601String(),
        'updated_at': updatedAt?.toIso8601String(),
        'referrer_id': referrerId,
        'access_token': accessToken,
      };
}
