import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:wrl/screens/signin.dart';

void main() {
  group('SignInPage', () {
    testWidgets('renders correctly', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: SignInPage()));

      expect(find.text('Sign In/Sign Up'), findsOneWidget);
      expect(find.byType(Form), findsOneWidget);
      expect(find.byType(TextFormField), findsNWidgets(2));
      expect(find.byType(ElevatedButton), findsOneWidget);
      expect(find.byType(TextButton), findsOneWidget);
    });

    testWidgets('validates email field', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: SignInPage()));

      final emailField = find.byType(TextFormField).first;
      await tester.enterText(emailField, '');

      final signInButton = find.byType(ElevatedButton);
      await tester.tap(signInButton);

      await tester.pump(); // wait for the error message to appear

      expect(find.text('Please enter an email'), findsOneWidget);
    });

    testWidgets('validates password field', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: SignInPage()));
      await tester.testTextInput.receiveAction(TextInputAction.done);
    });

    testWidgets('navigates to blog page on sign in',
        (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: SignInPage()));

      final signInButton = find.byType(ElevatedButton);
      await tester.tap(signInButton);
    });

    testWidgets('navigates to sign up page on tap',
        (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: SignInPage()));

      final signUpButton = find.byType(TextButton);
      await tester.tap(signUpButton);
    });
  });
}
