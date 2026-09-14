import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:voiceassistant/Frontend Code/Reusable Widgets/showMessage.dart';

void main() {
  testWidgets('showMessage renders non-string payloads', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: Builder(
          builder: (context) => ElevatedButton(
            onPressed: () => showMessage(context, Exception('boom')),
            child: const Text('show'),
          ),
        ),
      ),
    ));

    await tester.tap(find.text('show'));
    await tester.pump();

    expect(find.text('Exception: boom'), findsOneWidget);
  });
}
