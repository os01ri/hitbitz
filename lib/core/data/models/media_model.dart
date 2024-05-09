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
    print(json['media_url']?.replaceRange(0, 16, 'http://10.0.2.2'));
    return MediaModel(
      id: json['id'],
      mediaUrl: json['media_url']?.replaceRange(0, 16, 'http://10.0.2.2'),
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
