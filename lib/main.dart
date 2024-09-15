import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:voiceassistant/Screens/Main%20Screen/MainScreen.dart';
import 'Provider Classes/responseProviderClass.dart';
import 'Provider Classes/GeminiResponseProviderClass.dart';
import 'Provider Classes/OnOffProviderClass.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => OnOffProviderClass()),
        ChangeNotifierProvider(create: (context) => GeminiResponseProviderClass()),
        ChangeNotifierProvider(create: (context) => ResponseProviderClass())
      ],
      child:  ResponsiveApp(
        builder: (context){
          return const MaterialApp(
            debugShowCheckedModeBanner: false,
            home: MainScreen(),
          );
        },
      ),
    );
  }
}
