import 'package:FLUTTERPROJECT/app/modules/home/controllers/services/add_todo.dart';
import 'package:FLUTTERPROJECT/app/provider/todo_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

void main() {
  group('AddTodoScreen Widget Test', () {
    late TodoProvider todoProvider;

    setUp(() {
      todoProvider = TodoProvider();
    });

    testWidgets('Renders AddTodoScreen', (WidgetTester tester) async {
      // Build our app and trigger a frame.
      await tester.pumpWidget(
        ChangeNotifierProvider(
          create: (context) => todoProvider,
          child: MaterialApp(
            home: AddTodoScreen(),
          ),
        ),
      );

      // Verify that the AddTodoScreen has the correct title.
      expect(find.text('Tambahkan Catatan'), findsOneWidget);
      expect(find.text('Title'), findsOneWidget);
      expect(find.text('Description'), findsOneWidget);
      expect(find.text('Tambahkan'), findsOneWidget);
    });

    
    ;
  });
}
