class AllTodoModel {
  final int userId, id;
  final String title;
  final bool completed;

  AllTodoModel({
    required this.userId,
    required this.id,
    required this.title,
    required this.completed,
  });

  factory AllTodoModel.fromJson(Map<String, dynamic> json) {
    return AllTodoModel(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
      completed: json['completed'],
    );
  }
}
