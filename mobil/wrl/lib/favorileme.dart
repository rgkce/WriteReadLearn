import 'package:flutter/material.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _FavoritePageState createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  List<String> favoritePosts = [];
  List<String> favoriteAuthors = [];

  void favorite(String postId, bool isPost) {
    if (isPost) {
      if (!favoritePosts.contains(postId)) {
        setState(() {
          favoritePosts.add(postId);
        });
      }
    } else {
      if (!favoriteAuthors.contains(postId)) {
        setState(() {
          favoriteAuthors.add(postId);
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorites'),
      ),
      body: Column(
        children: [
          // Posts
          const Text(
            'Favorite Posts',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: favoritePosts.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(favoritePosts[index]),
                  trailing: IconButton(
                    icon: const Icon(Icons.favorite),
                    onPressed: () {
                      setState(() {
                        favoritePosts.removeAt(index);
                      });
                    },
                  ),
                );
              },
            ),
          ),
          // Authors
          const Text(
            'Favorite Authors',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: favoriteAuthors.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(favoriteAuthors[index]),
                  trailing: IconButton(
                    icon: const Icon(Icons.favorite),
                    onPressed: () {
                      setState(() {
                        favoriteAuthors.removeAt(index);
                      });
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigate to search page
        },
        child: const Icon(Icons.search),
      ),
    );
  }
}
