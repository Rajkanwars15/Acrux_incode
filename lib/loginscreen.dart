// import 'package:flutter/material.dart';
// import 'dashboard.dart';

// class LoginScreen extends StatefulWidget {
//   static const String routeName = '/login';

//   const LoginScreen({super.key});

//   @override
//   // ignore: library_private_types_in_public_api
//   _LoginScreenState createState() => _LoginScreenState();
// }

// class _LoginScreenState extends State<LoginScreen> {
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();
//   String _errorMessage = '';

//   void _login() {
//     // Perform your login logic here
//     String email = _emailController.text;
//     String password = _passwordController.text;

//     if (email.isNotEmpty && password.isNotEmpty) {
//       // Successful login, navigate to the dashboard screen
//       Navigator.pushNamed(context, DashboardScreen.routeName);
//     } else {
//       // Invalid credentials, show error message
//       setState(() {
//         _errorMessage = 'Invalid email or password';
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Login'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             TextField(
//               controller: _emailController,
//               decoration: const InputDecoration(
//                 labelText: 'Email',
//               ),
//             ),
//             const SizedBox(height: 16.0),
//             TextField(
//               controller: _passwordController,
//               obscureText: true,
//               decoration: const InputDecoration(
//                 labelText: 'Password',
//               ),
//             ),
//             const SizedBox(height: 16.0),
//             ElevatedButton(
//               onPressed: _login,
//               child: const Text('Login'),
//             ),
//             const SizedBox(height: 16.0),
//             Text(
//               _errorMessage,
//               style: const TextStyle(color: Colors.red),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'DashboardScreen.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = '/login';

  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String _errorMessage = '';

  void _login() {
    // Perform your login logic here
    String email = _emailController.text;
    String password = _passwordController.text;

    if (email.isNotEmpty && password.isNotEmpty) {
      // Successful login, navigate to the dashboard screen
      Navigator.pushNamed(context, DashboardScreen.routeName);
    } else {
      // Invalid credentials, show error message
      setState(() {
        _errorMessage = 'Invalid email or password';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(
                labelText: 'Email',
              ),
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Password',
              ),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _login,
              child: const Text('Login'),
            ),
            const SizedBox(height: 16.0),
            Text(
              _errorMessage,
              style: const TextStyle(color: Colors.red),
            ),
          ],
        ),
      ),
    );
  }
}
