class AllPostModel {
  final int userId;
  final int id;
  final String title, body;

  AllPostModel({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  factory AllPostModel.fromJson(Map<String, dynamic> json) {
    return AllPostModel(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
      body: json['body'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userId'] = userId;
    data['id'] = id;
    data['title'] = title;
    data['body'] = body;
    return data;
  }
}
