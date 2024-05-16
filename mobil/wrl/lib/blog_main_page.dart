import 'package:flutter/material.dart';

import 'profile_page.dart';
import 'search_page.dart';

class BlogMainPage extends StatelessWidget {
  const BlogMainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('WRL Main Page'),
      ),
      body: _buildBody(),
      bottomNavigationBar: _buildFooter(context),
    );
  }

  // Body
  Widget _buildBody() {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        return Card(
          margin: const EdgeInsets.all(16.0),
          child: ListTile(
            title: Text('Blog Post $index'),
            subtitle: const Text('This is a sample blog post'),
            trailing: IconButton(
              icon: const Icon(Icons.favorite_border),
              onPressed: () {
                // Handle favorite action
              },
            ),
          ),
        );
      },
    );
  }

  // Footer
  Widget _buildFooter(BuildContext context) {
    return BottomAppBar(
      color: Colors.white,
      elevation: 8,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
            icon: const Icon(Icons.home, color: Colors.blue),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const BlogMainPage()),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.search, color: Colors.grey),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SearchPage()),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.person, color: Colors.blue),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ProfilePage()),
              );
            },
          ),
        ],
      ),
    );
  }
}
