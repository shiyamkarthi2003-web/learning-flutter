// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_application_1/main.dart';

void main() {
  testWidgets('opens and edits the personal info screen', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const FoodDeliveryApp());

    expect(find.text('Profile'), findsOneWidget);
    expect(find.text('Vishal Khadok'), findsOneWidget);
    expect(find.text('Personal Info'), findsOneWidget);

    await tester.tap(find.text('Personal Info'));
    await tester.pumpAndSettle();

    expect(find.text('hello@halallab.co'), findsOneWidget);
    expect(find.text('408-841-0926'), findsOneWidget);

    await tester.tap(find.text('EDIT'));
    await tester.pump();

    expect(find.byType(TextField), findsNWidgets(3));
    expect(find.text('DONE'), findsOneWidget);
  });
}
