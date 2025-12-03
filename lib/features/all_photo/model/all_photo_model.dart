class AllPhotoModel {
  final int albumId, id;
  final String title, url, thumbnailUrl;

  AllPhotoModel({
    required this.albumId,
    required this.id,
    required this.title,
    required this.url,
    required this.thumbnailUrl,
  });

  factory AllPhotoModel.fromJson(Map<String, dynamic> json) {
    return AllPhotoModel(
      albumId: json['albumId'],
      id: json['id'],
      title: json['title'],
      url: json['url'],
      thumbnailUrl: json['thumbnailUrl'],
    );
  }
}
