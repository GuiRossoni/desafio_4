import 'package:desafio_4/features/todo/domain/entities/todo.dart';
import 'package:desafio_4/features/todo/domain/repositories/i_todo_repository.dart';

class ToggleTodoStatus {
  final ITodoRepository _repository;
  ToggleTodoStatus(this._repository);

  Future<void> call(Todo todo) async {
    final updated = todo.toggled();
    await _repository.updateTodo(updated);
  }
}
