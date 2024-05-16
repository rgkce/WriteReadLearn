import 'package:flutter/material.dart';
import 'package:wrl/posts.dart';

import 'add_posts.dart';
import 'blog_main_page.dart';
import 'edit_profile.dart';
import 'favorite_posts_page.dart';
import 'favorite_users_page.dart';
import 'search_page.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('WRL Profile Page'),
      ),
      body: _buildBody(context),
      bottomNavigationBar: _buildFooter(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Profile picture
          const CircleAvatar(
            radius: 50,
            backgroundImage: NetworkImage(
              'https://example.com/profile_picture.jpg',
            ),
          ),
          const SizedBox(height: 20),
          // Name
          IconButton(onPressed: () {}, icon: const Icon(Icons.favorite_border)),
          const Text(
            'John Doe',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          // Edit profile button
          ElevatedButton(
            onPressed: () {
              // Navigate to edit profile page
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const EditProfilePage(
                    initialName: 'John Doe',
                    initialImageUrl: 'https://example.com/profile_picture.jpg',
                  ),
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            ),
            child: const Text('Edit Profile'),
          ),
          const SizedBox(height: 20),
          // Favorite posts
          const Text(
            'Favorite Posts',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              // Navigate to favorite posts page
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const FavoritePostsPage()),
              );
            },
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            ),
            child: const Text('View Favorites'),
          ),
          const SizedBox(height: 20),
          // Favorite users
          const Text(
            'Favorite Users',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              // Navigate to favorite users page
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const FavoriteUsersPage()),
              );
            },
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            ),
            child: const Text('View Favorites'),
          ),
          const SizedBox(height: 20),
          //Add post button
          ElevatedButton(
            onPressed: () {
              // Navigate to create blog post page
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AddPostsPage()),
              );
            },
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            ),
            child: const Text('Add Post'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const PostsPage()),
              );
            },
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            ),
            child: const Text('Posts'),
          ),
        ],
      ),
    );
  }

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
}
