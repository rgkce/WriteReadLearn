import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:wrl/screens/posts.dart';

void main() {
  group('PostsPage', () {
    testWidgets('renders app bar with title', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: PostsPage()));

      expect(find.byType(AppBar), findsOneWidget);
      expect(find.text('Posts'), findsOneWidget);
    });

    testWidgets('renders post title and content', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: PostsPage()));

      final postTitle = find.text('Post 1');
      final postContent = find.text('This is post 1');

      expect(postTitle, findsOneWidget);
      expect(postContent, findsOneWidget);
    });

    testWidgets('navigates to profile page when person icon is pressed',
        (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: PostsPage()));

      final personIcon = find.byIcon(Icons.person);
      await tester.tap(personIcon);
    });

    testWidgets('renders bottom navigation bar', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: PostsPage()));

      expect(find.byType(BottomAppBar), findsOneWidget);
    });
  });
}
