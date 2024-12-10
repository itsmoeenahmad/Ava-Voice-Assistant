import 'package:flutter/material.dart';
import 'package:voiceassistant/Reusable%20Widgets/text.dart';

class UserGuideScreenForMobile extends StatelessWidget {
  const UserGuideScreenForMobile({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color(0xff272727),
      appBar: AppBar(
        scrolledUnderElevation: 0,
        elevation: 0,
        toolbarHeight: height * 0.08,
        backgroundColor: const Color(0xff272727),
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back_ios,
            size: 25,
            color: Color(0xffF2E7DC),
          ),
        ),
        centerTitle: true,
        title: Row(
          children: [
            text(data: 'Ava User Guide', fw: FontWeight.bold, fs: 25, col: const Color(0xffF2E7DC)),
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: width * 0.03),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //Space
              SizedBox(
                height: height * 0.01,
              ),
              text(
                  data: 'Welcome to the Ava Voice Assistant User Guide!',
                  fw: FontWeight.w700,
                  fs: 15,
                  col: const Color(0xffF4F4F4)),
              //Space
              SizedBox(
                height: height * 0.01,
              ),
              //Long Text
              text(
                  data:
                      "This guide will help you navigate the features of Ava and make the most out of your voice-controlled AI experience. Whether you're new to the app or just need a refresher, you'll find all the essential information here.",
                  fw: FontWeight.w500,
                  fs: 13,
                  col: const Color(0xffF4F4F4)),
              //Space
              SizedBox(
                height: height * 0.01,
              ),
              //Getting Started - Text
              text(
                  data: 'Getting Started',
                  fw: FontWeight.bold,
                  fs: 20,
                  col: const Color(0xffF2E7DC)),
              text(
                  data:
                      "To get started, open the app and click on the 'Login' button. Sign in using your Google account to access personalized features. Once logged in, you will see the 'Get Started' screen, which provides a brief introduction to Ava's capabilities. Click 'Continue' to proceed to the main screen.",
                  fw: FontWeight.w500,
                  fs: 13,
                  col: const Color(0xffF4F4F4)),
              //Space
              SizedBox(
                height: height * 0.01,
              ),
              //Intro - Text
              text(
                  data: 'Intro',
                  fw: FontWeight.bold,
                  fs: 20,
                  col: const Color(0xffF2E7DC)),
              text(
                  data:
                  "When user log in for the first time, he/she will be greeted with an introductory walkthrough of Ava Voice Assistant. This intro will guide them through the app's core features, showing you how to use voice commands, save responses, access your profile, and more. It’s designed to help you quickly get familiar with Ava and make the most of its capabilities.",
                  fw: FontWeight.w500,
                  fs: 13,
                  col: const Color(0xffF4F4F4)),
              //Space
              SizedBox(
                height: height * 0.01,
              ),
              //Using Voice Commands - Text
              text(
                  data: 'Using Voice Commands',
                  fw: FontWeight.bold,
                  fs: 20,
                  col: const Color(0xffF2E7DC)),
              text(
                  data:
                      "On the main screen, you will find a floating microphone icon that allows you to utilize the voice command feature. Click on the icon to start speaking your question and press it again to stop recording. Ava will process your voice input using Gemini AI and generate a response. The response will be displayed as text on the screen, and you can listen to it by clicking the play button next to the text.",
                  fw: FontWeight.w500,
                  fs: 13,
                  col: const Color(0xffF4F4F4)),
              //Space
              SizedBox(
                height: height * 0.01,
              ),
              //Save & Copy Response - Text
              text(
                  data: 'Saving And Copying Responses',
                  fw: FontWeight.bold,
                  fs: 20,
                  col: const Color(0xffF2E7DC)),
              text(
                  data:
                      "If you wish to keep a response, simply click the 'Save' icon to store it in Ava database, or click the 'Copy' icon to copy the text for use elsewhere.",
                  fw: FontWeight.w500,
                  fs: 13,
                  col: const Color(0xffF4F4F4)),
              //Space
              SizedBox(
                height: height * 0.01,
              ),
              //Profile - Text
              text(
                  data: 'Accessing Your Profile',
                  fw: FontWeight.bold,
                  fs: 20,
                  col: const Color(0xffF2E7DC)),
              text(
                  data:
                      "In the top corner of the main screen, you will find your name and email, which are fetched from your Google account",
                  fw: FontWeight.w500,
                  fs: 13,
                  col: const Color(0xffF4F4F4)),
              //Space
              SizedBox(
                height: height * 0.01,
              ),
              //Profile - Text
              text(
                  data: 'Navigation Drawer',
                  fw: FontWeight.bold,
                  fs: 20,
                  col: const Color(0xffF2E7DC)),
              text(
                  data:
                      "You can access the navigation drawer by clicking the hamburger menu (three horizontal lines). From there, you can select 'Saved Responses' to view all the responses you have saved and access this user guide for any help.",
                  fw: FontWeight.w500,
                  fs: 13,
                  col: const Color(0xffF4F4F4)),
              //Space
              SizedBox(
                height: height * 0.01,
              ),
              //User Guide - Text
              text(
                  data: 'User Guide Section',
                  fw: FontWeight.bold,
                  fs: 20,
                  col: const Color(0xffF2E7DC)),
              text(
                  data:
                      "The app also includes a user guide section, which explains the various functionalities and provides tips on how to effectively use Ava Voice Assistant.",
                  fw: FontWeight.w500,
                  fs: 13,
                  col: const Color(0xffF4F4F4)),
              //Space
              SizedBox(
                height: height * 0.01,
              ),
              //Logout - Text
              text(
                  data: 'Logging Out',
                  fw: FontWeight.bold,
                  fs: 20,
                  col: const Color(0xffF2E7DC)),
              text(
                  data:
                  "When you’re finished using the app, you can log out by navigating to your profile icon in the top corner and selecting the 'Logout' option. This will secure your account and ensure that your information remains private.",
                  fw: FontWeight.w500,
                  fs: 13,
                  col: const Color(0xffF4F4F4)),

              //Space
              SizedBox(
                height: height * 0.03,
              ),

              //Thanks Message
              text(
                  data: 'Thank you for using Ava Voice Assistant! We hope this guide enhances your experience. If you have any feedback, please let us know!',
                  fw: FontWeight.bold,
                  fs: 13,
                  col: const Color(0xffF2E7DC)),

              //Space
              SizedBox(
                height: height * 0.01,
              ),

              //Horizontal Line
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width*0.05),
                child: const Divider(
                  color: Color(0xffF2E7DC),
                  thickness: 1.2,
                ),
              ),

              //Space
              SizedBox(
                height: height * 0.03,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
