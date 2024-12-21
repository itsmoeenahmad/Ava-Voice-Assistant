import 'package:flutter/material.dart';

import '../../../Reusable Widgets/text.dart';

class ContactUsForMobile extends StatelessWidget {
  const ContactUsForMobile({super.key});

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
            text(data: 'Contact Us', fw: FontWeight.bold, fs: 25, col: const Color(0xffF2E7DC)),
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
                  data: 'We value your feedback, questions, and suggestions! If you have any inquiries about Ava Voice Assistant or would like to share your thoughts on how we can improve, feel free to reach out to us.',
                  fw: FontWeight.w500,
                  fs: 13,
                  col: Colors.white),
              //Space
              SizedBox(
                height: height * 0.01,
              ),
              text(
                  data: 'You can contact us through',
                  fw: FontWeight.w500,
                  fs: 12,
                  col: Colors.white),
              text(
                  data: 'support@ava.com',
                  fw: FontWeight.w800,
                  fs: 15,
                  col: const Color(0xffF2E7DC)),
              text(
                  data: 'via Email',
                  fw: FontWeight.w500,
                  fs: 12,
                  col: Colors.white),
              //Space
              SizedBox(
                height: height * 0.01,
              ),

              text(
                  data: 'Our team is committed to providing you with the best experience and will respond to your messages as soon as possible. Let’s work together to make Ava even better for everyone!',
                  fw: FontWeight.w500,
                  fs: 14,
                  col: Colors.white),




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
