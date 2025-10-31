import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'features/todo/data/datasources/todo_local_datasource.dart';
import 'features/todo/data/repositories/todo_repository_impl.dart';
import 'features/todo/domain/usecases/add_todo.dart';
import 'features/todo/domain/usecases/get_todos.dart';
import 'features/todo/domain/usecases/toggle_todo_status.dart';
import 'features/todo/presentation/notifiers/todo_notifier.dart';
import 'features/todo/presentation/pages/todo_list_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Simple DI wiring
    final dataSource = TodoLocalDataSource();
    final repository = TodoRepositoryImpl(dataSource);
    final getTodos = GetTodos(repository);
    final addTodo = AddTodo(repository);
    final toggleTodo = ToggleTodoStatus(repository);

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => TodoNotifier(getTodos, addTodo, toggleTodo),
        ),
      ],
      child: MaterialApp(
        title: 'DDD Refactor Challenge',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        home: const TodoListScreen(),
      ),
    );
  }
}
