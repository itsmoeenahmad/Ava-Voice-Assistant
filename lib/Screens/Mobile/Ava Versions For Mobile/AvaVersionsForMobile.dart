
import 'package:flutter/material.dart';

import '../../../Reusable Widgets/text.dart';

class AvaVersionsForMobile extends StatelessWidget {
  const AvaVersionsForMobile({super.key});

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
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            text(data: 'Ava Versions', fw: FontWeight.bold, fs: 25, col: const Color(0xffF2E7DC)),
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
              //Heading Text
              text(
                  data: 'Ava has evolved to provide a better and more feature-rich user experience with its two distinct versions:',
                  fw: FontWeight.bold,
                  fs: 15,
                  col: const Color(0xffF2E7DC)),
              //Space
              SizedBox(
                height: height * 0.01,
              ),
              //Ava 1.0  - Text
              text(
                  data: 'Ava 1.0',
                  fw: FontWeight.bold,
                  fs: 20,
                  col: const Color(0xffF2E7DC)),
              text(
                  data:
                  "The first version of Ava focused on simplicity and functionality. It allowed users to generate responses by providing voice commands. This version was the foundation of Ava's voice assistant capabilities, making it easy to interact with AI through voice input.",
                  fw: FontWeight.w500,
                  fs: 13,
                  col: const Color(0xffF4F4F4)),
              //Space
              SizedBox(
                height: height * 0.01,
              ),
              //Ava 2.0 - Text
              text(
                  data: 'Ava 2.0',
                  fw: FontWeight.bold,
                  fs: 20,
                  col: const Color(0xffF2E7DC)),
              text(
                  data:
                  "Building on the success of Ava 1.0, this version introduced enhanced features for improved usability and precision:",
                  fw: FontWeight.w500,
                  fs: 13,
                  col: const Color(0xffF4F4F4)),
              //Space
              SizedBox(
                height: height * 0.01,
              ),
              Row(
                children: [
                  const Icon(Icons.circle,size: 7,color: Color(0xffF2E7DC),),
                  text(
                      data: ' Accurate Responses',
                      fw: FontWeight.bold,
                      fs: 15,
                      col: const Color(0xffF2E7DC)),
                ],
              ),
              text(
                  data:
                  "Ava now delivers more precise and context-aware answers.",
                  fw: FontWeight.w500,
                  fs: 13,
                  col: const Color(0xffF4F4F4)),
              Row(
                children: [
                  const Icon(Icons.circle,size: 7,color: Color(0xffF2E7DC),),
                  text(
                      data: ' Save Responses',
                      fw: FontWeight.bold,
                      fs: 15,
                      col: const Color(0xffF2E7DC)),
                ],
              ),
              text(
                  data:
                  "Users can save responses for future reference.",
                  fw: FontWeight.w500,
                  fs: 13,
                  col: const Color(0xffF4F4F4)),
              Row(
                children: [
                  const Icon(Icons.circle,size: 7,color: Color(0xffF2E7DC),),
                  text(
                      data: ' Copy Responses',
                      fw: FontWeight.bold,
                      fs: 15,
                      col: const Color(0xffF2E7DC)),
                ],
              ),
              text(
                  data:
                  "Easily copy any response to use it elsewhere.",
                  fw: FontWeight.w500,
                  fs: 13,
                  col: const Color(0xffF4F4F4)),
              Row(
                children: [
                  const Icon(Icons.circle,size: 7,color: Color(0xffF2E7DC),),
                  text(
                      data: ' Stop Ava Speaking',
                      fw: FontWeight.bold,
                      fs: 15,
                      col: const Color(0xffF2E7DC)),
                ],
              ),
              text(
                  data:
                  "Control Ava by stopping speech playback whenever needed.",
                  fw: FontWeight.w500,
                  fs: 13,
                  col: const Color(0xffF4F4F4)),
              Row(
                children: [
                  const Icon(Icons.circle,size: 7,color: Color(0xffF2E7DC),),
                  text(
                      data: ' Offline Features',
                      fw: FontWeight.bold,
                      fs: 15,
                      col: const Color(0xffF2E7DC)),
                ],
              ),
              text(
                  data:
                  "Access certain functionalities offline for uninterrupted usage.",
                  fw: FontWeight.w500,
                  fs: 13,
                  col: const Color(0xffF4F4F4)),





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
