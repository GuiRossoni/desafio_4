// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:desafio_4/main.dart';

void main() {
  testWidgets('Todo List adds and toggles items', (WidgetTester tester) async {
    // Build the app
    await tester.pumpWidget(const MyApp());

    // App bar title should be present
    expect(find.text('Minhas Tarefas'), findsOneWidget);

    // Allow async loading to complete
    await tester.pumpAndSettle();

    // Initial seeded items should appear
    expect(find.text('Comprar leite'), findsOneWidget);
    expect(find.text('Estudar DDD'), findsOneWidget);

    // Add a new todo
    final textField = find.byType(TextField);
    expect(textField, findsOneWidget);
    await tester.enterText(textField, 'Nova tarefa de teste');
    await tester.tap(find.widgetWithText(ElevatedButton, 'Adicionar'));
    await tester.pumpAndSettle();

    // New item should be visible
    expect(find.text('Nova tarefa de teste'), findsOneWidget);
  });
}
