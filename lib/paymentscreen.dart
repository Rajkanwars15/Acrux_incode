import 'package:flutter/material.dart';
import 'userportalscreen.dart';
class PaymentScreen extends StatelessWidget {
  static const String routeName = '/login';

  const PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text('Go to Payment Screen'),
          onPressed: () {
            Navigator.pushNamed(context, UserPortalScreen.routeName);
          },
        ),
      ),
    );
  }
}