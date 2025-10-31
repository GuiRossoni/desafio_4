import 'package:desafio_4/features/todo/domain/entities/todo_title.dart';

class Todo {
  final TodoTitle title;
  final bool isCompleted;

  const Todo({required this.title, this.isCompleted = false});

  Todo copyWith({TodoTitle? title, bool? isCompleted}) {
    return Todo(
      title: title ?? this.title,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }

  Todo toggled() => copyWith(isCompleted: !isCompleted);
}
