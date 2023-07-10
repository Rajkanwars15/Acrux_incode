// ignore: file_names
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'user_profile_page.dart';
import 'user_profile_provider.dart';

class DashboardScreen extends StatefulWidget {
  static const routeName = '/dashboard';

  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  bool readyToWalk = false;
  bool readyToUseTransport = false;
  String destination = '';

  void handleWalkCheckbox(bool? value) {
    setState(() {
      readyToWalk = value ?? false;
    });
  }

  void handleTransportCheckbox(bool? value) {
    setState(() {
      readyToUseTransport = value ?? false;
    });
  }

  void handlePlanTrip() {
    // Implement your logic here for handling the "Plan Trip" button press
    // You can access the values of the checkboxes (readyToWalk and readyToUseTransport) here
    // You can also access the entered destination (destination) here

    // Example logic for route calculation and map integration
    String routeInstructions = '';
    // Perform route calculation using entered destination and selected options
    // ...
    // Display the calculated route on the map
    // ...

    // Display the route instructions
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Route Instructions'),
          content: Text(routeInstructions),
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

  @override
  Widget build(BuildContext context) {
    final firstName = Provider.of<UserProfileProvider>(context).userProfile!.firstName;

    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome $firstName'),
        actions: [
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: () {
              Navigator.pushNamed(context, UserProfilePage.routeName);
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 16.0),
            TextField(
              decoration: const InputDecoration(
                hintText: 'Enter your destination',
                prefixIcon: Icon(Icons.search),
              ),
              onChanged: (value) {
                setState(() {
                  destination = value;
                });
              },
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Current Location: XYZ City',
              style: TextStyle(fontSize: 18),
            ),
            CheckboxListTile(
              title: const Text('I am ready to walk'),
              value: readyToWalk,
              onChanged: handleWalkCheckbox,
            ),
            CheckboxListTile(
              title: const Text('I am ready to use public transport'),
              value: readyToUseTransport,
              onChanged: handleTransportCheckbox,
            ),
            ElevatedButton(
              onPressed: handlePlanTrip,
              child: const Text('Plan Trip'),
            ),
          ],
        ),
      ),
    );
  }
}
