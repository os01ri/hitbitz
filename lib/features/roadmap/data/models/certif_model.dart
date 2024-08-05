// To parse this JSON data, do
//
//     final redeemCertificateModel = redeemCertificateModelFromJson(jsonString);

import 'dart:convert';

RedeemCertificateModel redeemCertificateModelFromJson(String str) =>
    RedeemCertificateModel.fromJson(json.decode(str));

String redeemCertificateModelToJson(RedeemCertificateModel data) =>
    json.encode(data.toJson());

class RedeemCertificateModel {
  final bool? status;
  final String? message;
  final Data? data;

  RedeemCertificateModel({
    this.status,
    this.message,
    this.data,
  });

  factory RedeemCertificateModel.fromJson(Map<String, dynamic> json) =>
      RedeemCertificateModel(
        status: json['status'],
        message: json['message'],
        data: json['data'] == null ? null : Data.fromJson(json['data']),
      );

  Map<String, dynamic> toJson() => {
        'status': status,
        'message': message,
        'data': data?.toJson(),
      };
}

class Data {
  final String? image;

  Data({
    this.image,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        image: json['image'],
      );

  Map<String, dynamic> toJson() => {
        'image': image,
      };
}
