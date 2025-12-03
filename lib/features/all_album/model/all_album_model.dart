class AllAlbumModel {
  final int userId, id;
  final String title;

  AllAlbumModel({
    required this.userId,
    required this.id,
    required this.title,
  });

  factory AllAlbumModel.fromJson(Map<String, dynamic> json) {
    return AllAlbumModel(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
    );
  }
}
