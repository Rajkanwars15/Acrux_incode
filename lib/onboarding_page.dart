import 'package:flutter/material.dart';
import 'onboarding_screen.dart';
import 'loginscreen.dart';

class OnboardingPage extends StatefulWidget {
  @override
  _OnboardingPageState createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final PageController _pageController = PageController(initialPage: 0);

  List<OnboardingScreen> screens = [
    const OnboardingScreen(
      title: 'Automated Trip Planning',
      description:
      '1. Automated trip planning\nTrip routes are suggested to the user so that they can pick the methods of transportation.',
      imagePath: 'assets/images/onboarding1.png',
    ),
    const OnboardingScreen(
      title: 'Intelligent Suggestions',
      description:
      '2. Intelligent Suggestions\nAutomatically guides you through the methods of transportation so that there is no ambiguity faced from user end.',
      imagePath: 'assets/images/onboarding2.png',
    ),
    const OnboardingScreen(
      title: 'Hassle-Free Integration',
      description:
      '3. Hassle Free Integration\nUsers will be presented with one click solution payment method so that users can pay once and never worry about tickets or passes.',
      imagePath: 'assets/images/onboarding3.png',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        controller: _pageController,
        itemCount: screens.length,
        itemBuilder: (context, index) {
          return Stack(
            children: [
              Image.asset(
                screens[index].imagePath,
                fit: BoxFit.cover,
                height: double.infinity,
                width: double.infinity,
                alignment: Alignment.center,
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      if (index < screens.length - 1)
                        TextButton(
                          onPressed: () {
                            Navigator.pushReplacementNamed(
                              context,
                              LoginScreen.routeName,
                            );
                          },
                          child: Text('Skip'),
                        ),
                      ElevatedButton(
                        onPressed: () {
                          if (index < screens.length - 1) {
                            _pageController.nextPage(
                              duration:
                              const Duration(milliseconds: 300),
                              curve: Curves.ease,
                            );
                          } else {
                            Navigator.pushReplacementNamed(
                              context,
                              LoginScreen.routeName,
                            );
                          }
                        },
                        child:
                        Text(index < screens.length - 1 ? 'Next' : 'Get Started'),
                      ),
                    ],
                  ),
                ),
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