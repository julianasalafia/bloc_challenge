class Task {
  final int userId;
  final int id;
  final String title;
  final bool completed;

  Task({
    required this.userId,
    required this.id,
    required this.title,
    required this.completed,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'userId': userId,
      'id': id,
      'title': title,
      'completed': completed,
    };
  }

  factory Task.fromJson(Map<String, dynamic> map) {
    return Task(
      userId: map['userId'] ?? 0,
      id: map['id'] ?? 0,
      title: map['title'] ?? '',
      completed: map['completed'] ?? false,
    );
  }
}
