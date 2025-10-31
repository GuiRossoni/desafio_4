import 'package:desafio_4/features/todo/domain/entities/todo.dart';
import 'package:desafio_4/features/todo/domain/entities/todo_title.dart';

class TodoLocalDataSource {
  final List<Todo> _todos = [
    Todo(title: TodoTitle('Comprar leite'), isCompleted: false),
    Todo(title: TodoTitle('Estudar DDD'), isCompleted: true),
  ];

  Future<List<Todo>> getTodos() async {
    return List.unmodifiable(_todos);
  }

  Future<void> addTodo(Todo todo) async {
    _todos.add(todo);
  }

  Future<void> updateTodo(Todo todo) async {
    // Atualiza pela primeira correspondência de título
    final index = _todos.indexWhere((t) => t.title == todo.title);
    if (index != -1) {
      _todos[index] = todo;
    }
  }
}
