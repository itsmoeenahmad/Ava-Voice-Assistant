
import 'package:flutter/material.dart';

import '../../../Reusable Widgets/text.dart';

class AboutUsForMobile extends StatelessWidget {
  const AboutUsForMobile({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color(0xff272727),
      appBar: AppBar(
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
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            text(data: 'About Us', fw: FontWeight.bold, fs: 25, col: const Color(0xffF2E7DC)),
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
              //Text
              text(
                  data:
                  "Ava Voice Assistant is more than just an application—it's a journey of innovation and creativity. We are a passionate group of Computer Science students dedicated to leveraging technology to solve real-world problems.",
                  fw: FontWeight.w500,
                  fs: 13,
                  col: const Color(0xffF4F4F4)),
              //Space
              SizedBox(
                height: height * 0.01,
              ),
              //Text
              text(data: 'Ava was initially developed as a semester project for our Software Engineering course. Our vision was to create an AI-powered voice assistant that is simple, efficient, and accessible to users across various platforms. What began as an academic assignment has grown into a practical solution that combines cutting-edge technology with user-centric design.',
                  fw: FontWeight.w500,
                  fs: 13,
                  col: const Color(0xffF4F4F4)),
              //Space
              SizedBox(
                height: height * 0.01,
              ),
              //Text
              text(data: 'We are committed to enhancing Ava further, making it more intelligent and feature-rich while keeping it intuitive and user-friendly. Your feedback is invaluable to us as we continue to improve and innovate.',
                  fw: FontWeight.w500,
                  fs: 13,
                  col: const Color(0xffF4F4F4)),
              //Space
              SizedBox(
                height: height * 0.01,
              ),

              text(data: 'Thank you for being part of Ava’s journey!', fw: FontWeight.bold, fs: 15, col: const Color(0xffF2E7DC)),

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
