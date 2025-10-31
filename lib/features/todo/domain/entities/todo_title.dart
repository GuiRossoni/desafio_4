class TodoTitle {
  final String value;

  const TodoTitle._(this.value);

  factory TodoTitle(String input) {
    final trimmed = input.trim();
    if (trimmed.isEmpty) {
      throw ArgumentError('O título não pode ser vazio.');
    }
    if (trimmed.length > 50) {
      throw ArgumentError('O título deve ter no máximo 50 caracteres.');
    }
    return TodoTitle._(trimmed);
  }

  @override
  String toString() => value;

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is TodoTitle && other.value == value;

  @override
  int get hashCode => value.hashCode;
}
