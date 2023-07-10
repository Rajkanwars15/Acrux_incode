import 'package:flutter/material.dart';
class UserPortalScreen extends StatefulWidget {
  static const routeName = '/loading';

  const UserPortalScreen({super.key});

  @override
  State<UserPortalScreen> createState() => _UserPortalScreenState();
}

class _UserPortalScreenState extends State<UserPortalScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Loading'),
      ),
      body: const Center(
        child: Text('Loading Screen'),
      ),
    );
  }
}