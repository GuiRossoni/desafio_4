import 'package:desafio_4/features/todo/domain/entities/todo.dart';
import 'package:desafio_4/features/todo/domain/entities/todo_title.dart';
import 'package:desafio_4/features/todo/domain/repositories/i_todo_repository.dart';

class AddTodo {
  final ITodoRepository _repository;
  AddTodo(this._repository);

  Future<void> call(String title) async {
    final todo = Todo(title: TodoTitle(title));
    await _repository.saveTodo(todo);
  }
}
