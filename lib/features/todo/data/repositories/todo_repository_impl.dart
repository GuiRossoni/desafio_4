import 'package:desafio_4/features/todo/data/datasources/todo_local_datasource.dart';
import 'package:desafio_4/features/todo/domain/entities/todo.dart';
import 'package:desafio_4/features/todo/domain/repositories/i_todo_repository.dart';

class TodoRepositoryImpl implements ITodoRepository {
  final TodoLocalDataSource _local;

  TodoRepositoryImpl(this._local);

  @override
  Future<List<Todo>> getTodos() => _local.getTodos();

  @override
  Future<void> saveTodo(Todo todo) => _local.addTodo(todo);

  @override
  Future<void> updateTodo(Todo todo) => _local.updateTodo(todo);
}
