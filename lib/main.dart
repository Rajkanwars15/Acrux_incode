import 'package:flutter/material.dart';
import 'package:tryin/googleMaps.dart';
import 'package:tryin/userportalscreen.dart';
import 'package:provider/provider.dart';

import 'PaymentScreen.dart';
import 'DashboardScreen.dart';
import 'loadingscreen.dart';
import 'loginscreen.dart';
import 'user_profile_page.dart';
import 'user_profile_provider.dart';

void main() => runApp(const TransitlinkApp());

class TransitlinkApp extends StatelessWidget {
  const TransitlinkApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<UserProfileProvider>(
          create: (_) => UserProfileProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'Transitlink',
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        home:const GoogleMapsScreen(),
        routes: {
          '/login': (_) => const LoginScreen(),
          '/loading': (_) => const LoadingScreen(),
          '/payment': (_) => const PaymentScreen(),
          '/userPortal': (_) => const UserPortalScreen(),
          '/dashboard': (_) => const DashboardScreen(),
          '/userProfile': (_) => const UserProfilePage(),
          '/googleMaps': (_) => const GoogleMapsScreen(),
        },
      ),
    );
  }
}
