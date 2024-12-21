import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../Mobile/Splash Screen For Mobile/SplashScreenForMobile.dart';
import '../Website/WebsiteHomeScreen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      desktop: const WebsiteHomeScreen(),
      tablet: const WebsiteHomeScreen(),
      mobile: const SplashScreenForMobile(),
    );
  }

}
