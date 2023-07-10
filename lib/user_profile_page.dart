import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:tryin/user_profile_provider.dart';

class UserProfilePage extends StatefulWidget {
  static const routeName = '/user_profile';

  const UserProfilePage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _UserProfilePageState createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage> {
  TextEditingController _firstNameController = TextEditingController();
  TextEditingController _lastNameController = TextEditingController();
  TextEditingController _phoneNumberController = TextEditingController();
  TextEditingController _emailController = TextEditingController();

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _phoneNumberController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  void _saveUserProfile(BuildContext context) {
    final firstName = _firstNameController.text.trim();
    final lastName = _lastNameController.text.trim();
    final phoneNumber = _phoneNumberController.text.trim();
    final email = _emailController.text.trim();

    if (firstName.isNotEmpty && lastName.isNotEmpty && phoneNumber.isNotEmpty && email.isNotEmpty) {
      // Set the user's profile using the provider
      final userProfileProvider = Provider.of<UserProfileProvider>(context, listen: false);
      userProfileProvider.setFirstName(firstName);
      userProfileProvider.setLastName(lastName);
      userProfileProvider.setPhoneNumber(phoneNumber);
      userProfileProvider.setEmail(email);

      Navigator.pop(context); // Go back to the previous screen
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Error'),
            content: const Text('Please fill in all the fields.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final userProfileProvider = Provider.of<UserProfileProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('User Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _firstNameController,
              decoration: const InputDecoration(
                labelText: 'First Name',
              ),
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: _lastNameController,
              decoration: const InputDecoration(
                labelText: 'Last Name',
              ),
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: _phoneNumberController,
              decoration: const InputDecoration(
                labelText: 'Phone Number',
              ),
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(
                labelText: 'Email',
              ),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () => _saveUserProfile(context),
              child: const Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}
