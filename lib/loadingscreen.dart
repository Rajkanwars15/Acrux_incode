import 'package:flutter/material.dart';
import 'loginscreen.dart';
class LoadingScreen extends StatelessWidget {
  static const String routeName = '/loading';

  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Simulate a delay of 3 seconds
    Future.delayed(const Duration(seconds: 1), () {
      // Navigate to the desired screen after the delay
      Navigator.pushReplacementNamed(context, LoginScreen.routeName);
    });

    return const Scaffold(
      body: Center(
        child: Text('Loading...'),
      ),
    );l
  }
}