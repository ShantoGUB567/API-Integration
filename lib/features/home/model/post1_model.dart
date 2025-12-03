class Post1Model {
  final int userId;
  final int id;
  final String title;
  final String body;

  Post1Model({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  factory Post1Model.fromJson(Map<String, dynamic> json) {
    return Post1Model(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
      body: json['body'],
    );
  }
}