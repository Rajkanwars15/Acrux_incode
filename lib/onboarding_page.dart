import 'package:flutter/material.dart';
import 'onboarding_screen.dart';
import 'loginscreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnboardingPage extends StatefulWidget {
  @override
  _OnboardingPageState createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final PageController _pageController = PageController(initialPage: 0);

  List<OnboardingScreen> screens = [
    const OnboardingScreen(
      title: 'Automated Trip Planning',
      description: '\n We suggest trip routes to you so that you can pick your choice of methods of transportation.',
      imagePath: 'assets/images/onboarding1.png',
    ),
    const OnboardingScreen(
      title: 'Intelligent Suggestions',
      description: '\nWe automatically guide you through the methods of transportation so that you do not face ambiguity.',
      imagePath: 'assets/images/onboarding2.png',
    ),
    const OnboardingScreen(
      title: 'Hassle-Free Integration',
      description: 'One click solution payment method so that you can pay once and never worry about tickets or passes.',
      imagePath: 'assets/images/onboarding3.png',
    ),
  ];

  bool _isFirstTime = true;

  @override
  void initState() {
    super.initState();
    _checkFirstTime();
  }

  void _checkFirstTime() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isFirstTime = prefs.getBool('first_time') ?? true;
    setState(() {
      _isFirstTime = isFirstTime;
    });
    if (!isFirstTime) {
      _navigateToLoginScreen();
    }
  }

  void _navigateToLoginScreen() {
    Navigator.pushReplacementNamed(context, LoginScreen.routeName);
  }

  void _completeOnboarding() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('first_time', false);
    _navigateToLoginScreen();
  }

  @override
  Widget build(BuildContext context) {
    if (!_isFirstTime) {
      return Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    return Scaffold(
      body: PageView.builder(
        controller: _pageController,
        itemCount: screens.length,
        itemBuilder: (context, index) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                screens[index].imagePath,
                width: 200,
                height: 200,
                // Adjust the width and height as per your image dimensions
              ),
              const SizedBox(height: 40),
              Text(
                screens[index].title,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Text(
                  screens[index].description,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
              const SizedBox(height: 40),
              if (index < screens.length - 1)
                TextButton(
                  onPressed: () {
                    _pageController.nextPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.ease,
                    );
                  },
                  child: const Text('Next'),
                ),
              if (index == screens.length - 1)
                ElevatedButton(
                  onPressed: _completeOnboarding,
                  child: const Text('Get Started'),
                ),
            ],
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
