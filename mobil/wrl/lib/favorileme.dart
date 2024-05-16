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
      body: DefaultTextStyle(
        style: const TextStyle(fontSize: 18),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Posts
              const Text(
                'Favorite Posts',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16.0),
              if (favoritePosts.isNotEmpty)
                ListView.builder(
                  itemCount: favoritePosts.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
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
              if (favoritePosts.isEmpty)
                const Center(
                  child: Text('No favorite posts yet.'),
                ),
              const SizedBox(height: 32.0),
              // Authors
              const Text(
                'Favorite Authors',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16.0),
              if (favoriteAuthors.isNotEmpty)
                ListView.builder(
                  itemCount: favoriteAuthors.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
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
              if (favoriteAuthors.isEmpty)
                const Center(
                  child: Text('No favorite authors yet.'),
                ),
            ],
          ),
        ),
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
