import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:voiceassistant/Screens/Mobile/Splash%20Screen%20For%20Mobile/SplashScreenForMobile.dart';
import 'package:voiceassistant/Screens/Website/WebsiteHomeScreen.dart';

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
