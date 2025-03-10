class Todo {
  final String id;
  final String todoText;
  bool isDone;

  Todo({
    required this.id,
    required this.todoText,
    this.isDone = false, // Default value for isDone
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'todoText': todoText,
      'isDone': isDone ? 1 : 0,
    };
  }

  factory Todo.fromMap(Map<String, dynamic> map){
    return Todo(id: map['id'],
     todoText: map['todoText'],
     isDone: map['isDone'] == 1,
     );
  }
}
