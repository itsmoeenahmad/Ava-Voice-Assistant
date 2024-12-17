import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:voiceassistant/Screens/Mobile/Auth%20For%20Mobile/AuthForMobile.dart';

import '../../Reusable Widgets/showMessage.dart';

Future<void> signOutWithGoogle(BuildContext context) async {
  try {
    // Sign out from Google
    await GoogleSignIn().signOut();

    // Sign out from Firebase
    await FirebaseAuth.instance.signOut();

    // Show a success message
    showMessage(context, 'Successfully logged out');

    //Resetting the introStatus
    const secureStorage = FlutterSecureStorage();
    secureStorage.write(key: 'introStatus', value: 'false');

    // Navigate to the login screen
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) =>  const AuthForMobile()),
    );
  } catch (e) {
    // Handle errors
    showMessage(context, 'An error occurred: $e');
  }
}

