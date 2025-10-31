import 'package:desafio_4/features/todo/presentation/notifiers/todo_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TodoListScreen extends StatelessWidget {
  const TodoListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final notifier = context.watch<TodoNotifier>();

    return Scaffold(
      appBar: AppBar(title: const Text('Minhas Tarefas')),
      body: Column(
        children: [
          const Padding(padding: EdgeInsets.all(8.0), child: _AddTodoBar()),
          if (notifier.isLoading) const LinearProgressIndicator(),
          Expanded(
            child: ListView.builder(
              itemCount: notifier.todos.length,
              itemBuilder: (context, index) {
                final todo = notifier.todos[index];
                return ListTile(
                  title: Text(
                    todo.title.value,
                    style: TextStyle(
                      decoration: todo.isCompleted
                          ? TextDecoration.lineThrough
                          : null,
                    ),
                  ),
                  trailing: Checkbox(
                    value: todo.isCompleted,
                    onChanged: (_) => notifier.toggleTodo(todo),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _AddTodoBar extends StatefulWidget {
  const _AddTodoBar();

  @override
  State<_AddTodoBar> createState() => _AddTodoBarState();
}

class _AddTodoBarState extends State<_AddTodoBar> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: _controller,
            decoration: const InputDecoration(labelText: 'Nova Tarefa'),
          ),
        ),
        const SizedBox(width: 8),
        ElevatedButton(
          onPressed: () async {
            final notifier = context.read<TodoNotifier>();
            final ok = await notifier.addTodo(_controller.text);
            if (ok) {
              _controller.clear();
            } else if (notifier.lastError != null && context.mounted) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(notifier.lastError!)));
            }
          },
          child: const Text('Adicionar'),
        ),
      ],
    );
  }
}
