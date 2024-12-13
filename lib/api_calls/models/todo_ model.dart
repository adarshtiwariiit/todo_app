class TodoModel {
  String? title;
  String? description;
  bool? isCompleted;

  // Constructor
  TodoModel({
    this.title,
    this.description,
    this.isCompleted = false, // Default value for `isCompleted`
  });

  // Factory constructor for creating an instance from JSON
  factory TodoModel.fromJson(Map<dynamic, dynamic> json) {
    return TodoModel(
      title: json['title'] as String?,
      description: json['description'] as String?,
      isCompleted: json['isCompleted'] as bool? ?? false,
    );
  }

  // Method for converting an instance to JSON
  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
      'isCompleted': isCompleted,
    };
  }

  // CopyWith method to create a copy with updated fields
  TodoModel copyWith({
    String? title,
    String? description,
    bool? isCompleted,
  }) {
    return TodoModel(
      title: title ?? this.title,
      description: description ?? this.description,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }

  // Override toString for better debugging
  @override
  String toString() {
    return 'TodoModel(title: $title, description: $description, isCompleted: $isCompleted)';
  }
}

class TodoListModel {
  List<TodoModel> todos;

  // Constructor
  TodoListModel({required this.todos});

  // Factory constructor for creating an instance from JSON
  factory TodoListModel.fromJson(List<dynamic> json) {
    return TodoListModel(
      todos: (json)
          .map((item) => TodoModel.fromJson(item as Map<dynamic, dynamic>))
          .toList(),
    );
  }

  // Method for converting an instance to JSON
  List<dynamic> toJson() {
    return todos.map((todo) => todo.toJson()).toList();
  }

  // Override toString for better debugging
  @override
  String toString() {
    return 'TodoListModel(todos: $todos)';
  }
}
