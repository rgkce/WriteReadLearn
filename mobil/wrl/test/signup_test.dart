import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:wrl/screens/signup.dart';

void main() {
  testWidgets('SignUpPage renders correctly', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: SignUpPage()));
    expect(find.text('Username'), findsOneWidget);
    expect(find.byIcon(Icons.person), findsOneWidget);

    expect(find.text('Email'), findsOneWidget);
    expect(find.byIcon(Icons.email), findsOneWidget);

    // Verify that the password TextFormField is present
    expect(find.byType(TextFormField), findsNWidgets(3));
    expect(find.text('Password'), findsOneWidget);
    expect(find.byIcon(Icons.lock), findsOneWidget);
    expect(find.byIcon(Icons.visibility), findsOneWidget);

    // Verify that the sign up button is present
    expect(find.byType(ElevatedButton), findsOneWidget);
    // Verify that the sign in button is present
    expect(find.byType(TextButton), findsOneWidget);
    expect(find.text('Already have an account? Sign In'), findsOneWidget);
  });
}
