import 'package:desafio_4/features/todo/domain/entities/todo.dart';
import 'package:desafio_4/features/todo/domain/repositories/i_todo_repository.dart';

class GetTodos {
  final ITodoRepository _repository;
  GetTodos(this._repository);

  Future<List<Todo>> call() {
    return _repository.getTodos();
  }
}
