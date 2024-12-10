import 'package:flutter/material.dart';

import '../../../Reusable Widgets/text.dart';

class FaqForMobile extends StatelessWidget {
  const FaqForMobile({super.key});

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
            text(data: 'FAQ', fw: FontWeight.bold, fs: 25, col: const Color(0xffF2E7DC)),
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
                  data: 'Frequently Asked Questions (FAQ)',
                  fw: FontWeight.bold,
                  fs: 17,
                  col: const Color(0xffF2E7DC)),
              //Space
              SizedBox(
                height: height * 0.01,
              ),
              text(
                  data: 'Here are some sample FAQ questions related to Ava Voice Assistant:',
                  fw: FontWeight.bold,
                  fs: 13,
                  col: const Color(0xffF2E7DC)),
              //Space
              SizedBox(
                height: height * 0.01,
              ),

              ExpansionTile(
                backgroundColor: Colors.transparent,
                iconColor: const Color(0xffF4F4F4),
                collapsedIconColor: const Color(0xffF4F4F4),
                title: Align(
                  alignment: Alignment.centerLeft,
                  child: text(
                    data: 'What is Ava Voice Assistant?',
                    fs: 15,
                    col: const Color(0xffF2E7DC),
                    fw: FontWeight.w700,
                  ),
                ),
                collapsedBackgroundColor: Colors.transparent,
                collapsedShape: const RoundedRectangleBorder(
                  side: BorderSide(color: Colors.transparent),
                ),
                shape: const RoundedRectangleBorder(
                  side: BorderSide(color: Colors.transparent),
                ),
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: text(
                        data: "Ava is an AI-powered voice assistant that allows you to perform tasks using voice commands. It processes your input and provides accurate and helpful responses.",
                        fs: 14,
                        col: Colors.white,
                        fw: FontWeight.w400,
                      ),
                    ),
                  ),
                ],
              ),
              ExpansionTile(
                backgroundColor: Colors.transparent,
                iconColor: const Color(0xffF4F4F4),
                collapsedIconColor: const Color(0xffF4F4F4),
                title: Align(
                  alignment: Alignment.centerLeft,
                  child: text(
                    data: 'What features does Ava offer?',
                    fs: 15,
                    col: const Color(0xffF2E7DC),
                    fw: FontWeight.w700,
                  ),
                ),
                collapsedBackgroundColor: Colors.transparent,
                collapsedShape: const RoundedRectangleBorder(
                  side: BorderSide(color: Colors.transparent),
                ),
                shape: const RoundedRectangleBorder(
                  side: BorderSide(color: Colors.transparent),
                ),
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: text(
                        data: "Ava offers various features, including: Generating responses to voice commands, Saving and copying responses, Accessing saved responses offline and online, Stopping voice playback, A navigation drawer for easy access to features.",
                        fs: 14,
                        col: Colors.white,
                        fw: FontWeight.w400,
                      ),
                    ),
                  ),
                ],
              ),
              ExpansionTile(
                backgroundColor: Colors.transparent,
                iconColor: const Color(0xffF4F4F4),
                collapsedIconColor: const Color(0xffF4F4F4),
                title: Align(
                  alignment: Alignment.centerLeft,
                  child: text(
                    data: 'How is Ava 2.0 different from Ava 1.0?',
                    fs: 15,
                    col: const Color(0xffF2E7DC),
                    fw: FontWeight.w700,
                  ),
                ),
                collapsedBackgroundColor: Colors.transparent,
                collapsedShape: const RoundedRectangleBorder(
                  side: BorderSide(color: Colors.transparent),
                ),
                shape: const RoundedRectangleBorder(
                  side: BorderSide(color: Colors.transparent),
                ),
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: text(
                        data: "Ava 1.0 allows basic response generation from voice commands, while Ava 2.0 includes advanced features like saving, copying, accessing saved responses, and using offline functionalities.",
                        fs: 14,
                        col: Colors.white,
                        fw: FontWeight.w400,
                      ),
                    ),
                  ),
                ],
              ),
              ExpansionTile(
                backgroundColor: Colors.transparent,
                iconColor: const Color(0xffF4F4F4),
                collapsedIconColor: const Color(0xffF4F4F4),
                title: Align(
                  alignment: Alignment.centerLeft,
                  child: text(
                    data: 'Can I use Ava offline?',
                    fs: 15,
                    col: const Color(0xffF2E7DC),
                    fw: FontWeight.w700,
                  ),
                ),
                collapsedBackgroundColor: Colors.transparent,
                collapsedShape: const RoundedRectangleBorder(
                  side: BorderSide(color: Colors.transparent),
                ),
                shape: const RoundedRectangleBorder(
                  side: BorderSide(color: Colors.transparent),
                ),
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: text(
                        data: "Yes, Ava 2.0 includes offline features that allow you to access previously saved responses without an internet connection.",
                        fs: 14,
                        col: Colors.white,
                        fw: FontWeight.w400,
                      ),
                    ),
                  ),
                ],
              ),
              ExpansionTile(
                backgroundColor: Colors.transparent,
                iconColor: const Color(0xffF4F4F4),
                collapsedIconColor: const Color(0xffF4F4F4),
                title: Align(
                  alignment: Alignment.centerLeft,
                  child: text(
                    data: 'How do I save a response?',
                    fs: 15,
                    col: const Color(0xffF2E7DC),
                    fw: FontWeight.w700,
                  ),
                ),
                collapsedBackgroundColor: Colors.transparent,
                collapsedShape: const RoundedRectangleBorder(
                  side: BorderSide(color: Colors.transparent),
                ),
                shape: const RoundedRectangleBorder(
                  side: BorderSide(color: Colors.transparent),
                ),
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: text(
                        data: "Simply click the Save icon next to the response. The saved response will be stored in Ava’s database and can be accessed later.",
                        fs: 14,
                        col: Colors.white,
                        fw: FontWeight.w400,
                      ),
                    ),
                  ),
                ],
              ),
              ExpansionTile(
                backgroundColor: Colors.transparent,
                iconColor: const Color(0xffF4F4F4),
                collapsedIconColor: const Color(0xffF4F4F4),
                title: Align(
                  alignment: Alignment.centerLeft,
                  child: text(
                    data: 'What happens to my data if I log out?',
                    fs: 15,
                    col: const Color(0xffF2E7DC),
                    fw: FontWeight.w700,
                  ),
                ),
                collapsedBackgroundColor: Colors.transparent,
                collapsedShape: const RoundedRectangleBorder(
                  side: BorderSide(color: Colors.transparent),
                ),
                shape: const RoundedRectangleBorder(
                  side: BorderSide(color: Colors.transparent),
                ),
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: text(
                        data: "Your data, including saved responses, remains secure and accessible whenever you log back in.",
                        fs: 14,
                        col: Colors.white,
                        fw: FontWeight.w400,
                      ),
                    ),
                  ),
                ],
              ),
              ExpansionTile(
                backgroundColor: Colors.transparent,
                iconColor: const Color(0xffF4F4F4),
                collapsedIconColor: const Color(0xffF4F4F4),
                title: Align(
                  alignment: Alignment.centerLeft,
                  child: text(
                    data: 'How do I access saved responses?',
                    fs: 15,
                    col: const Color(0xffF2E7DC),
                    fw: FontWeight.w700,
                  ),
                ),
                collapsedBackgroundColor: Colors.transparent,
                collapsedShape: const RoundedRectangleBorder(
                  side: BorderSide(color: Colors.transparent),
                ),
                shape: const RoundedRectangleBorder(
                  side: BorderSide(color: Colors.transparent),
                ),
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: text(
                        data: "You can access your saved responses via the Saved Responses option in the navigation drawer.",
                        fs: 14,
                        col: Colors.white,
                        fw: FontWeight.w400,
                      ),
                    ),
                  ),
                ],
              ),
              ExpansionTile(
                backgroundColor: Colors.transparent,
                iconColor: const Color(0xffF4F4F4),
                collapsedIconColor: const Color(0xffF4F4F4),
                title: Align(
                  alignment: Alignment.centerLeft,
                  child: text(
                    data: 'Who developed Ava?',
                    fs: 15,
                    col: const Color(0xffF2E7DC),
                    fw: FontWeight.w700,
                  ),
                ),
                collapsedBackgroundColor: Colors.transparent,
                collapsedShape: const RoundedRectangleBorder(
                  side: BorderSide(color: Colors.transparent),
                ),
                shape: const RoundedRectangleBorder(
                  side: BorderSide(color: Colors.transparent),
                ),
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: text(
                        data: "Ava was developed by a team of Computer Science students from UET Peshawar as part of a semester project for their Software Engineering Subject.",
                        fs: 14,
                        col: Colors.white,
                        fw: FontWeight.w400,
                      ),
                    ),
                  ),
                ],
              ),
              ExpansionTile(
                backgroundColor: Colors.transparent,
                iconColor: const Color(0xffF4F4F4),
                collapsedIconColor: const Color(0xffF4F4F4),
                title: Align(
                  alignment: Alignment.centerLeft,
                  child: text(
                    data: 'Is Ava available on multiple platforms?',
                    fs: 15,
                    col: const Color(0xffF2E7DC),
                    fw: FontWeight.w700,
                  ),
                ),
                collapsedBackgroundColor: Colors.transparent,
                collapsedShape: const RoundedRectangleBorder(
                  side: BorderSide(color: Colors.transparent),
                ),
                shape: const RoundedRectangleBorder(
                  side: BorderSide(color: Colors.transparent),
                ),
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: text(
                        data: "Yes, Ava is available on mobile platform (Android & IOS)",
                        fs: 14,
                        col: Colors.white,
                        fw: FontWeight.w400,
                      ),
                    ),
                  ),
                ],
              ),
              ExpansionTile(
                backgroundColor: Colors.transparent,
                iconColor: const Color(0xffF4F4F4),
                collapsedIconColor: const Color(0xffF4F4F4),
                title: Align(
                  alignment: Alignment.centerLeft,
                  child: text(
                    data: 'How can I provide feedback about Ava?',
                    fs: 15,
                    col: const Color(0xffF2E7DC),
                    fw: FontWeight.w700,
                  ),
                ),
                collapsedBackgroundColor: Colors.transparent,
                collapsedShape: const RoundedRectangleBorder(
                  side: BorderSide(color: Colors.transparent),
                ),
                shape: const RoundedRectangleBorder(
                  side: BorderSide(color: Colors.transparent),
                ),
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: text(
                        data: "You can send us your feedback through the Contact Us section in the app or email us directly. We appreciate your suggestions to help us improve Ava!",
                        fs: 14,
                        col: Colors.white,
                        fw: FontWeight.w400,
                      ),
                    ),
                  ),
                ],
              ),

              //Space
              SizedBox(
                height: height * 0.01,
              ),

              //Horizontal Line
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width*0.03),
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
