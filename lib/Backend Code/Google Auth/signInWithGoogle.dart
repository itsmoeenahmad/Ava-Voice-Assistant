import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../Frontend Code/Reusable Widgets/showMessage.dart';
import '../../Frontend Code/Screens/Mobile/Get Started For Mobile/GetStartedForMobile.dart';

Future<void> signInWithGoogle(BuildContext context) async {
  try {
    print('Called');
    // Attempt to sign in the user with Google
    GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // If the user cancels the sign-in, googleUser will be null
    if (googleUser == null) {
      //Showing the message
      showMessage(context, 'Failed! Try Again');
      return;
    }

    // Obtain the authentication details from the Google sign-in
    GoogleSignInAuthentication googleAuth = await googleUser.authentication;

    // Create a new credential
    AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    // Sign in to Firebase with the Google credential
    UserCredential userCredential = await FirebaseAuth.instance.signInWithCredential(credential);

    // Check if the user is successfully signed in
    if (userCredential.user != null) {
      //Showing the message
      showMessage(context, 'Success',);

      // Navigate to the home screen
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const GetStartedScreenForMobile()),
      );
    } else {
      //Showing the message
      showMessage(context, 'Failed! Try Again',);
    }
  } catch (e) {
    print('error in catch: $e');
    //Showing the message
    showMessage(context, 'An error occurred: $e',);
  }
}