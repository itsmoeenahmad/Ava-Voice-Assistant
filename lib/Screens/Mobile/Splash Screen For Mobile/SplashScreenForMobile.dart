import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:voiceassistant/Screens/Mobile/Auth%20For%20Mobile/AuthForMobile.dart';
import 'package:voiceassistant/Screens/Mobile/Home%20Screen%20For%20Mobile/MobileHomeScreen.dart';

class SplashScreenForMobile extends StatefulWidget {
  const SplashScreenForMobile({super.key});

  @override
  State<SplashScreenForMobile> createState() => _SplashScreenForMobileState();
}

class _SplashScreenForMobileState extends State<SplashScreenForMobile> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(seconds: 1),(){
      if(FirebaseAuth.instance.currentUser!=null)
        {
          Navigator.push(context, MaterialPageRoute(builder: (context)=> const MobileHomeScreen()));
        }
      else
        {
          Navigator.push(context, MaterialPageRoute(builder: (context)=> const AuthForMobile()));
        }
    });
  }


  @override
  Widget build(BuildContext context) {
    //For Media Query - Responsiveness
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color(0xff272727),
      body: Center(
        child: Padding(
          padding: EdgeInsets.only(top: height*0.15),
          child: SizedBox(
            height: height*0.25,
            width: width*0.8,
           child: LoadingAnimationWidget.fallingDot(color: const Color(0xffF3F3F3), size: 80),
          ),
        ),
      )
    );
  }
}
