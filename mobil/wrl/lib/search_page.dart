import 'package:flutter/material.dart';

import 'blog_main_page.dart';
import 'profile_page.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('WRL Search Page'),
      ),
      body: _buildBody(),
      bottomNavigationBar: _buildFooter(context),
    );
  }
}

/*Widget _buildHeader() {
  return AppBar(
    title: const Text('WriteReadLearn Search Page'),
  );
}*/

// Body
Widget _buildBody() {
  return ListView.builder(
    itemCount: 10,
    itemBuilder: (context, index) {
      return Card(
        child: ListTile(
          title: Text('Blog Post $index'),
          subtitle: const Text('This is a sample blog post'),
        ),
      );
    },
  );
}

// Footer
Widget _buildFooter(BuildContext context) {
  return BottomAppBar(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        IconButton(
          icon: const Icon(Icons.home),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const BlogMainPage()),
            );
          },
        ),
        IconButton(
          icon: const Icon(Icons.search),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const SearchPage()),
            );
          },
        ),
        IconButton(
          icon: const Icon(Icons.person),
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
