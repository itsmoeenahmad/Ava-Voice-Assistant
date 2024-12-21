import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'Frontend Code/Screens/Main Screen/MainScreen.dart';
import 'State Managment/Provider Classes/GeminiResponseProviderClass.dart';
import 'State Managment/Provider Classes/OnOffProviderClass.dart';
import 'State Managment/Provider Classes/VoiceOffProviderClass.dart';
import 'State Managment/Provider Classes/responseProviderClass.dart';
import 'State Managment/Provider Classes/savedIconStatusProviderClass.dart';
import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    name: 'ava-voice-assistant-5e94b',
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
        ChangeNotifierProvider(create: (context) => ResponseProviderClass()),
        ChangeNotifierProvider(create: (context) => SavedIconStatusProviderClass()),
        ChangeNotifierProvider(create: (context) => VoiceOffProviderClass()),
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
