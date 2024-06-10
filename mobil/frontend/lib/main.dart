import 'package:flutter/material.dart';

import 'screens/blog_main_page.dart';
import 'screens/profile_page.dart';
import 'screens/search_page.dart';
import 'screens/signin.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Sign In/Sign Up',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => const SignInPage(),
          '/blog': (context) => const BlogMainPage(),
          '/search': (context) => const SearchPage(),
          '/profile': (context) => const ProfilePage(),
        });
  }
}
