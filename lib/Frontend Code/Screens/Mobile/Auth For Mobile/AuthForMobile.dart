import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../../../../Backend Code/Google Auth/signInWithGoogle.dart';
import '../../../Reusable Widgets/text.dart';

class AuthForMobile extends StatefulWidget {
  const AuthForMobile({super.key});

  @override
  State<AuthForMobile> createState() => AuthForMobileState();
}

class AuthForMobileState extends State<AuthForMobile> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: const Color(0xff272727),
        body: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.03),
            child: Column(
              children: [
                //Space
                SizedBox(
                  height: height * 0.08,
                ),
                //Bot Animation
                Container(
                  height: height * 0.55,
                  width: width * 1,
                  decoration: const BoxDecoration(
                      // color: Colors.red,
                      ),
                  child: Lottie.asset('assets/Lottie/AuthBot.json'),
                ),
                //Space
                SizedBox(
                  height: height * 0.02,
                ),

                //Auth With Google

                //Text
                text(
                    data:
                        'Welcome to Ava! Your AI assistant, powered by Gemini.',
                    fw: FontWeight.bold,
                    fs: 30,
                    col: Colors.white),
                //Space
                SizedBox(
                  height: height * 0.04,
                ),
                //Button For SignIn
                InkWell(
                  onTap: () {
                    //Calling Google Auth SignIn Code
                    signInWithGoogle(context);
                  },
                  child: Container(
                    height: height * 0.06,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.transparent,
                        border: Border.all(
                            color: const Color(0xffF4F4F4), width: 1.5),
                        borderRadius: BorderRadius.circular(30)),
                    child: Center(
                      child: Row(
                        children: [
                          //Space
                          SizedBox(
                            width: width * 0.04,
                          ),
                          //Google Logo
                          SizedBox(
                            height: height * 0.04,
                            width: width * 0.13,
                            // color: Colors.red,
                            child: Image.asset('assets/Logo/googleLogo.png'),
                          ),
                          //Text
                          text(
                              data: '  SignIn With Your Google Account',
                              fw: FontWeight.w800,
                              fs: 15,
                              col: const Color(0xffF4F4F4))
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
