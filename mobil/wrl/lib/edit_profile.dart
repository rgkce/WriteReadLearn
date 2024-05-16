import 'package:flutter/material.dart';

import 'profile_page.dart';

class EditProfilePage extends StatefulWidget {
  final String initialName;
  final String initialImageUrl;

  const EditProfilePage({
    Key? key,
    required this.initialName,
    required this.initialImageUrl,
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final TextEditingController defaultName = TextEditingController();
  final TextEditingController defaultImage = TextEditingController();
  final TextEditingController defaultPassword = TextEditingController();
  late String _imageUrl;

  @override
  void initState() {
    super.initState();
    _imageUrl = widget.initialImageUrl;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Profile'),
      ),
      body: Column(
        children: [
          // Profile picture
          CircleAvatar(
            radius: 50,
            backgroundImage: NetworkImage(_imageUrl),
          ),
          // Name
          TextField(
            controller: defaultName,
            onChanged: (value) {
              setState(() {});
            },
            decoration: const InputDecoration(
              labelText: 'Name',
            ),
          ),
          TextField(
            controller: defaultPassword,
            onChanged: (value) {
              setState(() {});
            },
            decoration: const InputDecoration(
              labelText: 'Password',
            ),
          ),
          // Image URL
          TextField(
            controller: defaultImage,
            onChanged: (value) {
              setState(() {
                _imageUrl = value;
              });
            },
            decoration: const InputDecoration(
              labelText: 'Image URL',
            ),
          ),
          // Save button
          ElevatedButton(
            onPressed: () {
              // Save changes and navigate back
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ProfilePage(),
                ),
              );
            },
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }
}
