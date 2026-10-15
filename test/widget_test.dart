
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:projeto_cont_fiap/main.dart';

void main() {
  testWidgets(
    'CREED cadastra pessoa e atualiza a lotacao',
    (tester) async {
      await tester.pumpWidget(const MyApp());

      // Confirma que o contador inicia em zero
      expect(find.text('0'), findsOneWidget);

      // Preenche o nome da pessoa
      await tester.enterText(
        find.byType(TextField).at(0),
        'Maria Silva',
      );

      // Preenche a identificacao
      await tester.enterText(
        find.byType(TextField).at(1),
        '123456',
      );

      // Registra a entrada
      await tester.ensureVisible(find.text('ENTROU'));
      await tester.tap(find.text('ENTROU'));
      await tester.pump();

      // Confirma o cadastro
      expect(find.text('1'), findsOneWidget);
      expect(find.text('Maria Silva'), findsOneWidget);
      expect(find.text('ID: 123456'), findsOneWidget);
    },
  );
}
