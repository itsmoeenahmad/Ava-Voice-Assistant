import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:voiceassistant/Screens/Website/WebsiteHomeScreen.dart';
import '../Mobile/MobileHomeScreen.dart';

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
      mobile: const MobileHomeScreen(),
    );
  }

}
