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
    defaultName.text = widget.initialName;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Profile'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Profile picture
            CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(_imageUrl),
            ),
            const SizedBox(height: 16.0),
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
            const SizedBox(height: 16.0),
            // Password
            TextField(
              controller: defaultPassword,
              onChanged: (value) {
                setState(() {});
              },
              decoration: const InputDecoration(
                labelText: 'Password',
              ),
              obscureText: true,
            ),
            const SizedBox(height: 16.0),
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
            const SizedBox(height: 16.0),
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
      ),
    );
  }
}
