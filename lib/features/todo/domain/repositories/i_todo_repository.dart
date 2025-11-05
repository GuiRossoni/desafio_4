// Propósito: Interface de repositório (listar/salvar/atualizar Todos).
// Camada: Domínio (contrato independente de dados/apresentação).
import 'package:desafio_4/features/todo/domain/entities/todo.dart';

abstract class ITodoRepository {
  Future<List<Todo>> getTodos();
  Future<void> saveTodo(Todo todo);
  Future<void> updateTodo(Todo todo);
}
