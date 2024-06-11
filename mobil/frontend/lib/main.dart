import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:wrl/firebase_options.dart';

import 'screens/blog_main_page.dart';
import 'screens/profile_page.dart';
import 'screens/search_page.dart';
import 'screens/signin.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
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
          '/signup': (context) => const SignInPage(),
          '/blog': (context) => const BlogMainPage(),
          '/search': (context) => const SearchPage(),
          '/profile': (context) => const ProfilePage(),
        });
  }
}
