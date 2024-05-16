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
                viewportFraction: 0.8,
                aspectRatio: 16 / 9,
              ),
              items: _favoriteUsers.map((user) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      margin: const EdgeInsets.symmetric(horizontal: 5),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(height: 16.0),
                          Text(
                            user.name,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8.0),
                          Text(
                            user.email,
                            textAlign: TextAlign.center,
                            style: const TextStyle(fontSize: 18),
                          ),
                          const SizedBox(height: 16.0),
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
