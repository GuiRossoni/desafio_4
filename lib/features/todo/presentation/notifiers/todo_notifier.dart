// Propósito: ChangeNotifier que orquestra casos de uso e expõe o estado para a UI.
// Camada: Apresentação (depende apenas de casos de uso do domínio).
import 'package:flutter/foundation.dart';
import 'package:desafio_4/features/todo/domain/entities/todo.dart';
import 'package:desafio_4/features/todo/domain/usecases/add_todo.dart';
import 'package:desafio_4/features/todo/domain/usecases/get_todos.dart';
import 'package:desafio_4/features/todo/domain/usecases/toggle_todo_status.dart';

class TodoNotifier extends ChangeNotifier {
  final GetTodos _getTodos;
  final AddTodo _addTodo;
  final ToggleTodoStatus _toggleTodoStatus;

  TodoNotifier(this._getTodos, this._addTodo, this._toggleTodoStatus) {
    loadTodos();
  }

  List<Todo> _todos = [];
  String? lastError;
  bool _loading = false;

  List<Todo> get todos => List.unmodifiable(_todos);
  bool get isLoading => _loading;

  Future<void> loadTodos() async {
    _loading = true;
    notifyListeners();
    try {
      _todos = await _getTodos();
    } finally {
      _loading = false;
      notifyListeners();
    }
  }

  Future<bool> addTodo(String title) async {
    try {
      await _addTodo(title);
      await loadTodos();
      lastError = null;
      return true;
    } catch (e) {
      lastError = e.toString();
      notifyListeners();
      return false;
    }
  }

  Future<void> toggleTodo(Todo todo) async {
    await _toggleTodoStatus(todo);
    await loadTodos();
  }
}
