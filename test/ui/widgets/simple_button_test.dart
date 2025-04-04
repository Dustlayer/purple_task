import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:purple_task/core/ui/widgets/simple_button.dart';

void main() {
  testWidgets('finds a FlatButton widget', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: SimpleButton(
          text: '',
          onPressed: null,
        ),
      ),
    );
    final button = find.byType(TextButton);
    expect(button, findsOneWidget);
  });

  testWidgets('finds text', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: SimpleButton(
          text: 'text',
          onPressed: null,
        ),
      ),
    );
    final text = find.text('text');
    expect(text, findsOneWidget);
  });

  testWidgets('onPressed callback', (tester) async {
    var pressed = false;
    await tester.pumpWidget(
      MaterialApp(
        home: SimpleButton(
          text: 'text',
          onPressed: () => pressed = true,
        ),
      ),
    );
    final button = find.byType(TextButton);
    await tester.tap(button);
    expect(pressed, true);
  });
}
