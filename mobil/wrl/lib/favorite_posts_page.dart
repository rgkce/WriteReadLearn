import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class FavoritePostsPage extends StatefulWidget {
  const FavoritePostsPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _FavoritePostsPageState createState() => _FavoritePostsPageState();
}

class _FavoritePostsPageState extends State<FavoritePostsPage> {
  List<Post> _favoritePosts = [];

  @override
  void initState() {
    super.initState();
    _loadFavoritePosts();
  }

  Future<void> _loadFavoritePosts() async {
    // Load favorite posts from database or API
    // For example:
    _favoritePosts = [
      Post(title: 'Post 1', content: 'This is a sample post'),
      Post(title: 'Post 2', content: 'This is another sample post'),
      Post(title: 'Post 3', content: 'This is a third sample post'),
    ];
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorite Posts'),
      ),
      body: _favoritePosts.isEmpty
          ? const Center(
              child: Text('No favorite posts'),
            )
          : CarouselSlider(
              options: CarouselOptions(
                height: 400,
                autoPlay: true,
                enlargeCenterPage: true,
                enableInfiniteScroll: false,
                viewportFraction: 0.8,
                aspectRatio: 16 / 9,
              ),
              items: _favoritePosts.map((post) {
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
                        children: [
                          const SizedBox(height: 16.0),
                          Text(
                            post.title,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 16.0),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 16.0),
                            child: Text(
                              post.content,
                              textAlign: TextAlign.center,
                              style: const TextStyle(fontSize: 18),
                            ),
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

class Post {
  final String title;
  final String content;

  Post({required this.title, required this.content});
}
