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
      title: 'Welcome to TransitLink',
      description: 'Your ultimate one-tap solution for seamless navigation.',
      imagePath: 'assets/images/onboarding1.png',
    ),
    const OnboardingScreen(
      title: 'Automated Trip Planning',
      description: 'Let TransitLink suggest the best routes for your journey.',
      imagePath: 'assets/images/onboarding2.png',
    ),
    const OnboardingScreen(
      title: 'Hassle-Free Integration',
      description: 'Pay once and never worry about tickets or passes.',
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
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(screens[index].imagePath),
                    fit: BoxFit.cover,
                  ),
                ),
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
                            _pageController.nextPage(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.ease,
                            );
                          },
                          child: Text('Skip'),
                        ),
                      ElevatedButton(
                        onPressed: () {
                          if (index < screens.length - 1) {
                            _pageController.nextPage(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.ease,
                            );
                          } else {
                            Navigator.pushReplacementNamed(
                              context,
                              LoginScreen.routeName,
                            );
                          }
                        },
                        child: Text(index < screens.length - 1 ? 'Next' : 'Get Started'),
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
