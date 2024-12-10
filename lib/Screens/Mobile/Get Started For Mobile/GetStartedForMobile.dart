import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:voiceassistant/Screens/Mobile/Home%20Screen%20For%20Mobile/MobileHomeScreen.dart';

import '../../../Reusable Widgets/text.dart';

class GetStartedScreenForMobile extends StatefulWidget {
  const GetStartedScreenForMobile({super.key});

  @override
  State<GetStartedScreenForMobile> createState() => GetStartedScreenForMobileState();
}

class GetStartedScreenForMobileState extends State<GetStartedScreenForMobile> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color(0xff272727),
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width*0.03),
          child: Column(
            children: [
              //Space
              SizedBox(
                height: height*0.13,
              ),
              //Bot Animation
              Container(
                height: height*0.5,
                width: double.infinity,
                decoration: const BoxDecoration(
                  // color: Colors.red,
                ),
                child:  Lottie.asset('assets/Lottie/getStartedBot.json'),
              ),
              //Space
              SizedBox(
                height: height*0.007,
              ),
              //Text
              text(data: 'Lets Get Started With Ava!',
                  fw: FontWeight.bold,
                  fs: 35,
                  col: Colors.white),
              //Text
              text(data: 'Speak your mind and let your AI companion assist you effortlessly!',
                  fw: FontWeight.bold,
                  fs: 18,
                  col: const Color(0xffF4F4F4)),
              //Space
              SizedBox(
                height: height*0.051,
              ),
              //Button For Navigating Towards Home Screen
              InkWell(
                onTap: (){
                  //Google Auth Code....
                  //Navigating....
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> const MobileHomeScreen()));
                },
                child: Container(
                  height: height*0.06,
                  width: width*0.92,
                  decoration: BoxDecoration(
                      color: Colors.transparent,
                      border: Border.all(
                          color: const Color(0xffF4F4F4), width: 1.5),
                      borderRadius: BorderRadius.circular(
                          30
                      )),
                  child: Center(
                    child: //Text
                    text(data: 'Get Started', fw: FontWeight.w800, fs: 30, col: const Color(0xffF4F4F4))
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
