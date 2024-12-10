import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';

import '../../../Reusable Widgets/showMessage.dart';
import '../../../Reusable Widgets/text.dart';

class ResponseScreen extends StatefulWidget {
  String responseIs;
  ResponseScreen({super.key,required this.responseIs});

  @override
  State<ResponseScreen> createState() => _ResponseScreenState();
}

class _ResponseScreenState extends State<ResponseScreen> {
  @override
  Widget build(BuildContext context) {
    print(widget.responseIs);
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color(0xff272727),
      appBar: AppBar(
        scrolledUnderElevation: 0,
        toolbarHeight: height * 0.1,
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
        ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width*0.03),
          child: Column(
            children: [
              //Bot Animation
              Container(
                height: height*0.5,
                width: double.infinity,
                decoration: const BoxDecoration(
                  // color: Colors.red,
                ),
                child:  Lottie.asset('assets/Lottie/getStartedBot.json'),
              ),
              //Response is
              text(data: widget.responseIs, fw: FontWeight.w400, fs: 16, col: const Color(0xffF2E7DC)),
              //Space
              SizedBox(
                height: height*0.0001,
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
                height: height*0.1,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
