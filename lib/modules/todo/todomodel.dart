class Todolist {
  int id;
  String title;
  bool completed;

  Todolist({
    required this.id,
    required this.title,
    required this.completed,
  });

  // Factory constructor to create an instance from a JSON map
  factory Todolist.fromJson(Map<String, dynamic> json) {
    return Todolist(
      id: json['id'],
      title: json['title'],
      completed: json['completed'],
    );
  }

  // Method to convert an instance to a JSON map
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'completed': completed,
    };
  }
}
