import 'package:flutter/material.dart';
import 'onboarding_page.dart';

class LoadingScreen extends StatelessWidget {
  static const String routeName = '/loading';

  const LoadingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Simulate a delay of 3 seconds
    Future.delayed(const Duration(seconds: 3), () {
      // Navigate to the onboarding page
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => OnboardingPage()),
      );
    });

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/acrux.png',
              width: 150,
              height: 150,
              // You can customize the width and height as per your logo's dimensions
            ),
            const SizedBox(height: 16),
            const Text('Loading...'),
          ],
        ),
      ),
    );
  }
}
