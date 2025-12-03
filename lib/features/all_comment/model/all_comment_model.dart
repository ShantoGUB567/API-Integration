class AllCommentModel {
  final int postId, id;
  final String name, email, body;

  AllCommentModel({
    required this.postId,
    required this.id,
    required this.name,
    required this.email,
    required this.body,
  });

  factory AllCommentModel.fromJson(Map<String, dynamic> json) {
    return AllCommentModel(
      postId: json['postId'], 
      id: json['id'], 
      name: json['name'], 
      email: json['email'], 
      body: json['body']
      );
  }
}
