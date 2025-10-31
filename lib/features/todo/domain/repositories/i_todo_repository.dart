import 'package:desafio_4/features/todo/domain/entities/todo.dart';

abstract class ITodoRepository {
  Future<List<Todo>> getTodos();
  Future<void> saveTodo(Todo todo);
  Future<void> updateTodo(Todo todo);
}
