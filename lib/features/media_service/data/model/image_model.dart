class ImageUploadModel {
  final String? mediaUrl;

  const ImageUploadModel({this.mediaUrl});

  ImageUploadModel copyWith({String? mediaUrl}) => ImageUploadModel(mediaUrl: mediaUrl ?? this.mediaUrl);

  factory ImageUploadModel.fromJson(Map<String, dynamic> json) => ImageUploadModel(mediaUrl: json['image']);
}
