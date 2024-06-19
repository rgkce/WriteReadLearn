import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:wrl/screens/add_posts.dart';
import 'package:wrl/screens/blog_main_page.dart';
import 'package:wrl/screens/edit_profile.dart';
import 'package:wrl/screens/posts.dart';
import 'package:wrl/screens/profile_page.dart';
import 'package:wrl/screens/search_page.dart';

void main() {
  group('ProfilePage', () {
    testWidgets('renders profile picture', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: ProfilePage()));

      expect(find.byType(CircleAvatar), findsOneWidget);
    });

    testWidgets('renders name', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: ProfilePage()));

      expect(find.text('John Doe'), findsOneWidget);
    });

    testWidgets('renders edit profile button', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: ProfilePage()));

      expect(find.byType(ElevatedButton), findsOneWidget);
      expect(find.text('Edit Profile'), findsOneWidget);
    });

    testWidgets(
        'navigates to edit profile page when edit profile button is pressed',
        (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: ProfilePage()));

      final editProfileButton = find.byType(ElevatedButton);
      await tester.tap(editProfileButton);

      expect(find.byType(EditProfilePage), findsOneWidget);
    });

    testWidgets('renders favorite posts section', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: ProfilePage()));

      expect(find.text('Favorite Posts'), findsOneWidget);
    });

    testWidgets('renders favorite users section', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: ProfilePage()));

      expect(find.text('Favorite Users'), findsOneWidget);
    });

    testWidgets('renders add post button', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: ProfilePage()));

      expect(find.byType(ElevatedButton), findsOneWidget);
      expect(find.text('Add Post'), findsOneWidget);
    });

    testWidgets('navigates to add post page when add post button is pressed',
        (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: ProfilePage()));

      final addPostButton = find.byType(ElevatedButton);
      await tester.tap(addPostButton);

      expect(find.byType(AddPostsPage), findsOneWidget);
    });

    testWidgets('renders posts button', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: ProfilePage()));

      expect(find.byType(ElevatedButton), findsOneWidget);
      expect(find.text('Posts'), findsOneWidget);
    });

    testWidgets('navigates to posts page when posts button is pressed',
        (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: ProfilePage()));

      final postsButton = find.byType(ElevatedButton);
      await tester.tap(postsButton);

      expect(find.byType(PostsPage), findsOneWidget);
    });

    testWidgets('renders bottom navigation bar', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: ProfilePage()));

      expect(find.byType(BottomAppBar), findsOneWidget);
    });

    testWidgets('navigates to blog main page when home icon is pressed',
        (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: ProfilePage()));

      final homeIcon = find.byIcon(Icons.home);
      await tester.tap(homeIcon);

      expect(find.byType(BlogMainPage), findsOneWidget);
    });

    testWidgets('navigates to search page when search icon is pressed',
        (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: ProfilePage()));

      final searchIcon = find.byIcon(Icons.search);
      await tester.tap(searchIcon);

      expect(find.byType(SearchPage), findsOneWidget);
    });

    testWidgets('navigates to profile page when person icon is pressed',
        (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: ProfilePage()));

      final personIcon = find.byIcon(Icons.person);
      await tester.tap(personIcon);

      expect(find.byType(ProfilePage), findsOneWidget);
    });
  });
}
