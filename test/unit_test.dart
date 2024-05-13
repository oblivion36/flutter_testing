import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:testing/demo.dart';
import 'package:testing/login.dart'; // Import your login page file

void main() {
  testWidgets('Login page validation test', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: LoginPage()));

    await tester.tap(find.byKey(const Key('login_button')));

    await tester.pump();

    expect(find.text("Please enter a valid email"), findsOneWidget);

    expect(find.text("Please enter your password"), findsOneWidget);

    await tester.enterText(
        find.byKey(const Key('email_field')), 'invalidemail');

    await tester.tap(find.byKey(const Key('login_button')));
    await tester.pump();

    expect(find.text("Please enter a valid email"), findsOneWidget);

    expect(find.text("Please enter your password"), findsOneWidget);

    await tester.enterText(
        find.byKey(const Key('email_field')), 'validemail@example.com');
    await tester.enterText(find.byKey(const Key('password_field')), 'invalid');
    await tester.tap(find.byKey(const Key('login_button')));
    await tester.pump();

    expect(find.text("Please enter a valid email"), findsNothing);

    expect(
        find.text(
            "Password must contain at least 8 characters including uppercase, lowercase, number, and special character"),
        findsOneWidget);

    await tester.enterText(
        find.byKey(const Key('password_field')), 'ValidPassword@123');

    await tester.tap(find.byKey(const Key('login_button')));
    expect(find.text("Please enter a valid email"), findsNothing);

    await tester.pumpAndSettle();

    expect(find.byType(Demo), findsOneWidget);
    expect(find.text('Submit'), findsOneWidget);
  });

  testWidgets('Demo form test', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: Demo()));
    await tester.tap(find.text('Submit'));

    await tester.pump();

    expect(find.text("*required"), findsNWidgets(4));

    final nameField = find.byType(TextFormField).at(0);
    final surnameField = find.byType(TextFormField).at(1);
    final rollNoField = find.byType(TextFormField).at(2);
    final divisionField = find.byType(TextFormField).at(3);
    final standardField = find.byType(TextFormField).at(4);
    final submitButton = find.text('Submit');

    await tester.enterText(nameField, 'saurabh');
    await tester.enterText(surnameField, 'Doe');
    await tester.tap(find.text('Submit'));
    await tester.pump();
    expect(find.text("*required"), findsNWidgets(3));

    await tester.enterText(nameField, 'saurabh');
    await tester.enterText(surnameField, 'Doe');
    await tester.enterText(rollNoField, '12345');
    await tester.enterText(divisionField, 'A');
    await tester.enterText(standardField, '10');

    await tester.tap(submitButton);
    await tester.pumpAndSettle();

    expect(find.text('Form submitted successfully'), findsOneWidget);
  });
}
