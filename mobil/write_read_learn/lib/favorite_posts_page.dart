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
              ),
              items: _favoritePosts.map((post) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      margin: const EdgeInsets.symmetric(horizontal: 5),
                      child: Column(
                        children: [
                          Text(post.title),
                          Text(post.content),
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
