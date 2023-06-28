import 'package:flutter/material.dart';
import 'package:tryin/userportalscreen.dart';

import 'PaymentScreen.dart';
import 'DashboardScreen.dart';
import 'loadingscreen.dart';
import 'loginscreen.dart';

void main() => runApp(const TransitlinkApp());

class TransitlinkApp extends StatelessWidget {
  const TransitlinkApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Transitlink',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: LoadingScreen.routeName,
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case LoadingScreen.routeName:
            return MaterialPageRoute(builder: (_) => const LoadingScreen());
          case LoginScreen.routeName:
            return MaterialPageRoute(builder: (_) => const LoginScreen());
          case PaymentScreen.routeName:
            return MaterialPageRoute(builder: (_) => const PaymentScreen());
          case UserPortalScreen.routeName:
            return MaterialPageRoute(builder: (_) => const UserPortalScreen());
          case DashboardScreen.routeName:
            return MaterialPageRoute(builder: (_) => const DashboardScreen());
          default:
            return MaterialPageRoute(builder: (_) =>const LoginScreen());
        }
      },
    );
  }
}





