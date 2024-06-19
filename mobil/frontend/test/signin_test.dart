import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:wrl/screens/signin.dart';

void main() {
  testWidgets('SignInPage renders correctly', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: SignInPage()));

    // Verify that the app bar title is correct
    expect(find.text('Sign In/Sign Up'), findsOneWidget);

    // Verify that the email TextFormField is present
    expect(find.byType(TextFormField), findsOneWidget);
    expect(find.text('Email'), findsOneWidget);
    expect(find.byIcon(Icons.email), findsOneWidget);

    // Verify that the password TextFormField is present
    expect(find.byType(TextFormField), findsNWidgets(2));
    expect(find.text('Password'), findsOneWidget);
    expect(find.byIcon(Icons.lock), findsOneWidget);
    expect(find.byIcon(Icons.visibility), findsOneWidget);

    // Verify that the sign in button is present
    expect(find.byType(ElevatedButton), findsOneWidget);
    expect(find.text('Sign In'), findsOneWidget);

    // Verify that the sign up button is present
    expect(find.byType(TextButton), findsOneWidget);
    expect(find.text('Don\'t have an account? Sign Up'), findsOneWidget);
  });

  testWidgets('SignInPage form validation works correctly',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: SignInPage()));

    // Enter invalid email and password
    await tester.enterText(find.byType(TextFormField).first, 'invalid');
    await tester.enterText(find.byType(TextFormField).last, 'hort');

    // Tap the sign in button
    await tester.tap(find.byType(ElevatedButton));

    // Verify that the form validation errors are displayed
    expect(find.text('Please enter an email'), findsOneWidget);
    expect(find.text('Please enter a password with at least 8 characters'),
        findsOneWidget);

    // Enter valid email and password
    await tester.enterText(
        find.byType(TextFormField).first, 'valid@example.com');
    await tester.enterText(find.byType(TextFormField).last, 'password123');

    // Tap the sign in button
    await tester.tap(find.byType(ElevatedButton));

    // Verify that the form is valid and the sign in button is enabled
    final signInButton = find.byType(ElevatedButton);
    expect(signInButton, findsOneWidget);
    final signInButtonWidget =
        signInButton.evaluate().first.widget as ElevatedButton;
    expect(signInButtonWidget.enabled, true);
  });
}
