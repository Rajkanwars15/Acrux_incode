// import 'package:flutter/material.dart';
// class DashboardScreen extends StatefulWidget {
//   static const routeName = '/loading';

//   const DashboardScreen({super.key});

//   @override
//   State<DashboardScreen> createState() => _DashboardScreenState();
// }

// class _DashboardScreenState extends State<DashboardScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Loading'),
//       ),
//       body: const Center(
//         child: Text('Loading Screen'),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';

class DashboardScreen extends StatefulWidget {
  static const routeName = '/dashboard';

  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  String username = 'John Doe';
  String password = '********';
  String cityName = 'New York';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const SizedBox(height: 16.0),
              Text(
                'Username: $username',
                style: const TextStyle(fontSize: 18.0),
              ),
              const SizedBox(height: 8.0),
              Text(
                'Password: $password',
                style: const TextStyle(fontSize: 18.0),
              ),
              const SizedBox(height: 8.0),
              Text(
                'City: $cityName',
                style: const TextStyle(fontSize: 18.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
