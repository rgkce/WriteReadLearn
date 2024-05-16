import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class PostsPage extends StatefulWidget {
  const PostsPage({super.key});

  @override
  State<PostsPage> createState() => _PostsPageState();
}

class _PostsPageState extends State<PostsPage> {
  final List<Post> _posts = [
    Post(title: 'Post 1', content: 'This is post 1'),
    Post(title: 'Post 2', content: 'This is post 2'),
    Post(title: 'Post 3', content: 'This is post 3'),
    Post(title: 'Post 4', content: 'This is post 4'),
    Post(title: 'Post 5', content: 'This is post 5'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Posts'),
      ),
      body: CarouselSlider(
        options: CarouselOptions(
          height: 200,
          autoPlay: true,
          enlargeCenterPage: true,
          enableInfiniteScroll: false,
        ),
        items: _posts.map((post) {
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
