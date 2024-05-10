import 'package:flutter/material.dart';

import 'posts.dart';

class AddPostsPage extends StatefulWidget {
  const AddPostsPage({super.key});

  @override
  State<AddPostsPage> createState() => _AddPostsPageState();
}

class _AddPostsPageState extends State<AddPostsPage> {
  final _titleController = TextEditingController();
  final _contentController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Post'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextField(
                controller: _titleController,
                decoration: const InputDecoration(
                  labelText: 'Title',
                ),
              ),
              const SizedBox(height: 16.0),
              TextField(
                controller: _contentController,
                decoration: const InputDecoration(
                  labelText: 'Content',
                ),
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const PostsPage()),
                  );
                },
                child: const Text('Add Post'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
