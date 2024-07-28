import 'package:hitbitz/core/api/end_points.dart';

class MediaModel {
  final int? id;
  final String? mediaUrl;
  final String? hash;
  final int? order;

  MediaModel({
    this.id,
    this.mediaUrl,
    this.hash,
    this.order,
  });

  factory MediaModel.fromJson(Map<String, dynamic> json) {
    return MediaModel(
      id: json['id'],
      // mediaUrl: json['media_url'],
      // mediaUrl: json['media_url']?.replaceRange(0, 16, 'http://10.42.0.1:8001'),
      mediaUrl: json['media_url']?.replaceRange(0, 21, '${EndPoints.scheme}://${EndPoints.host}:${EndPoints.port}'),
      hash: json['hash'],
      order: json['order'],
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'media_url': mediaUrl,
        'hash': hash,
        'order': order,
      };
}
