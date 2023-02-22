class ToDo {
  int id;
  String? todoText;
  String? distext;
  String? enddate;
  String? priority;

  bool isDone;

  ToDo({
    required this.id,
    required this.todoText,
    required this.distext,
    required this.enddate,
    required this.priority,
    this.isDone = false,
  });

  static List<ToDo> todoList() {
    return [];
  }
}
