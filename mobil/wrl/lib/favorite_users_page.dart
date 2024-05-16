import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class FavoriteUsersPage extends StatefulWidget {
  const FavoriteUsersPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _FavoriteUsersPageState createState() => _FavoriteUsersPageState();
}

class _FavoriteUsersPageState extends State<FavoriteUsersPage> {
  List<User> _favoriteUsers = [];

  @override
  void initState() {
    super.initState();
    _loadFavoriteUsers();
  }

  Future<void> _loadFavoriteUsers() async {
    // Load favorite users from database or API
    // For example:
    _favoriteUsers = [
      User(name: 'User 1', email: 'user1@example.com'),
      User(name: 'User 2', email: 'user2@example.com'),
      User(name: 'User 3', email: 'user3@example.com'),
    ];
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorite Users'),
      ),
      body: _favoriteUsers.isEmpty
          ? const Center(
              child: Text('No favorite users'),
            )
          : CarouselSlider(
              options: CarouselOptions(
                height: 200,
                autoPlay: true,
                enlargeCenterPage: true,
                enableInfiniteScroll: false,
              ),
              items: _favoriteUsers.map((user) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      margin: const EdgeInsets.symmetric(horizontal: 5),
                      child: Column(
                        children: [
                          Text(user.name),
                          Text(user.email),
                        ],
                      ),
                    );
                  },
                );
              }).toList(),
            ),
    );
  }
}

class User {
  final String name;
  final String email;

  User({required this.name, required this.email});
}
