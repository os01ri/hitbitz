List<NotificationModel> notificationModelFromJson(dynamic decodedJson) =>
    List<NotificationModel>.from(decodedJson.map((x) => NotificationModel.fromJson(x)));

class NotificationModel {
  final int? id;
  final String? title;
  final String? body;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  const NotificationModel({
    this.id,
    this.title,
    this.body,
    this.createdAt,
    this.updatedAt,
  });

  factory NotificationModel.fromJson(Map<String, dynamic> json) => NotificationModel(
        id: json['id'],
        title: json['title'],
        body: json['body'],
        createdAt: json['created_at'] == null ? null : DateTime.parse(json['created_at']),
        updatedAt: json['updated_at'] == null ? null : DateTime.parse(json['updated_at']),
      );
}
