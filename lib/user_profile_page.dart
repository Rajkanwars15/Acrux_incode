import 'package:flutter/material.dart';

class UserProfilePage extends StatefulWidget {
  static const routeName = '/userProfile';

  const UserProfilePage({Key? key}) : super(key: key);

  @override
  _UserProfilePageState createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage> {
  String? firstName;
  String? lastName;
  String? phoneNumber;
  String? email;
  String? profilePictureUrl; // You can store the URL or file path of the profile picture here

  void saveProfile() {
    // Implement your logic here for saving the user profile
    // You can access the entered values (firstName, lastName, phoneNumber, email) and the profile picture (profilePictureUrl) here
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Profile'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: GestureDetector(
                onTap: () {
                  // TODO: Implement profile picture selection functionality
                },
                child: CircleAvatar(
                  radius: 64,
                  backgroundImage: profilePictureUrl != null
                      ? NetworkImage(profilePictureUrl!) // Display the profile picture if available
                      : null,
                  child: profilePictureUrl == null
                      ? const Icon(Icons.person, size: 64) // Display a placeholder icon if no profile picture is available
                      : null,
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'First Name',
              ),
              onChanged: (value) {
                setState(() {
                  firstName = value;
                });
              },
            ),
            const SizedBox(height: 8.0),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Last Name',
              ),
              onChanged: (value) {
                setState(() {
                  lastName = value;
                });
              },
            ),
            const SizedBox(height: 8.0),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Phone Number',
              ),
              onChanged: (value) {
                setState(() {
                  phoneNumber = value;
                });
              },
            ),
            const SizedBox(height: 8.0),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Email',
              ),
              onChanged: (value) {
                setState(() {
                  email = value;
                });
              },
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: saveProfile,
              child: const Text('Save Profile'),
            ),
          ],
        ),
      ),
    );
  }
}
