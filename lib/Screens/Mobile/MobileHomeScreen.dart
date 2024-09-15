import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:voiceassistant/Reusable%20Widgets/text.dart';
import 'package:voiceassistant/Provider%20Classes/responseProviderClass.dart';
import '../../Provider Classes/GeminiResponseProviderClass.dart';
import '../../Provider Classes/OnOffProviderClass.dart';
import '../../SpeechToText/SpeechToText.dart';

class MobileHomeScreen extends StatefulWidget {
  const MobileHomeScreen({super.key});

  @override
  State<MobileHomeScreen> createState() => _MobileHomeScreenState();
}

class _MobileHomeScreenState extends State<MobileHomeScreen> {


  //Creating an instance/object of SpeechToTextClass
  SpeechToTextClass _speechToTextClass = new SpeechToTextClass();

  //Creating an instance/object of FlutterTts(Text to Speech)
  FlutterTts flutterTts = FlutterTts();

  @override
  void initState() {
    super.initState();
    _speechToTextClass.initSpeech();
    _initializeTts();
  }

  @override
  void dispose() {
    _speechToTextClass.stopListening(context); // Stop listening before disposing
    flutterTts.stop(); // Stop speaking before disposing
    super.dispose();
  }


  void _initializeTts() async {
    await flutterTts.setLanguage("en-US");
    await flutterTts.setPitch(1.0);
  }

  //FlutterTts For Speaking.
  Future<void> _speak(String text) async {
    if (text.isNotEmpty) {
      await flutterTts.speak(text);
    }
  }

  // Method to stop the speech.
  Future<void> _stop() async {
    await flutterTts.stop();
  }



  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color(0xff272727),
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: Color(0xff272727),
        centerTitle: true,
        title: text(
            data: 'Ava Voice Assistant',
            fw: FontWeight.w700,
            fs: 28,
            col: Colors.white),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: width * 0.04),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Align(
                alignment: Alignment.center,
                child: Container(
                  height: height * 0.25,
                  width: width * 0.7,
                  // color: Colors.red,
                  child: Lottie.asset('assets/Lottie/Bot.json'),
                ),
              ),
              SizedBox(
                height: height * 0.01,
              ),
              Provider.of<OnOffProviderClass>(context, listen: true).OnorOffCheck
                  ?
               Container(
                height: height*0.5,
                width: double.infinity,
                color: Colors.transparent,
                child: Center(
                  child: LoadingAnimationWidget.staggeredDotsWave(
                    color: const Color(0xffF2EF7DC),
                    size: 60,
                  ),
                ),
              )
                  : Provider.of<GeminiResponseProviderClass>(context, listen: true).checkResponse ?
              Column(
                children: [
                  IntrinsicHeight(
                    child: Container(
                      //height: height * 0.14,
                      width: width * 0.85,
                      decoration: BoxDecoration(
                          color: Colors.transparent,
                          border: Border.all(
                              color: const Color(0xffF4F4F4), width: 1.5),
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(2),
                            topRight: Radius.circular(16),
                            bottomLeft: Radius.circular(16),
                            bottomRight: Radius.circular(16),
                          )),
                      child: Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: text(
                            data: 'Hello! How can I assist you today?',
                            fw: FontWeight.bold,
                            fs: 25,
                            col: Color(0xffF2E7DC)),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: height * 0.03,
                  ),
                  Align(
                      alignment: Alignment.center,
                      child: text(
                          data: 'Here are a few features',
                          fw: FontWeight.bold,
                          fs: 25,
                          col: Color(0xffF2EF7DC))),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  Column(
                    children: [
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          //height: height * 0.12,
                          width: width * 0.75,
                          decoration: BoxDecoration(
                              color: Colors.transparent,
                              border: Border.all(
                                  color: const Color(0xffF4F4F4), width: 2.5),
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(12),
                                topRight: Radius.circular(12),
                                bottomLeft: Radius.circular(12),
                                bottomRight: Radius.circular(12),
                              )),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                text(
                                    data: 'Smart Listening:',
                                    fw: FontWeight.w700,
                                    fs: 18,
                                    col: Color(0xffF2EF7DC)),
                                text(
                                    data:
                                    'Ava Voice Assistance listens to your requests with precision and generates the best responses.',
                                    fw: FontWeight.bold,
                                    fs: 14,
                                    col: Colors.white),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: height * 0.02,
                      ),
                      SizedBox(
                        height: height * 0.002,
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          //height: height * 0.138,
                          width: width * 0.75,
                          decoration: BoxDecoration(
                              color: Colors.transparent,
                              border: Border.all(
                                  color: const Color(0xffF4F4F4), width: 2.5),
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(12),
                                topRight: Radius.circular(12),
                                bottomLeft: Radius.circular(12),
                                bottomRight: Radius.circular(12),
                              )),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                text(
                                    data: 'Effortless Experience:',
                                    fw: FontWeight.w700,
                                    fs: 18,
                                    col: Color(0xffF2EF7DC)),
                                text(
                                    data:
                                    'Enjoy a seamless experience with advanced AI that understands and fulfills your needs effortlessly.',
                                    fw: FontWeight.bold,
                                    fs: 14,
                                    col: Colors.white),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: height * 0.02,
                      ),
                      SizedBox(
                        height: height * 0.002,
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          //height: height * 0.145,
                          width: width * 0.75,
                          decoration: BoxDecoration(
                              color: Colors.transparent,
                              border: Border.all(
                                  color: const Color(0xffF4F4F4), width: 2.5),
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(12),
                                topRight: Radius.circular(12),
                                bottomLeft: Radius.circular(12),
                                bottomRight: Radius.circular(12),
                              )),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                text(
                                    data: 'Powered by Gemini',
                                    fw: FontWeight.w700,
                                    fs: 18,
                                    col: Color(0xffF2EF7DC)),
                                text(
                                    data:
                                    'Powered by Gemini technology, Ava Voice Assistant offers smart, personalized assistance tailored just for you.',
                                    fw: FontWeight.bold,
                                    fs: 14,
                                    col: Colors.white),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: height * 0.07,
                      ),
                    ],
                  ),

                ],
              )
                  :
              Provider.of<ResponseProviderClass>(context, listen: true).GeminiBool ?
              Container(
                height: height*0.5,
                width: double.infinity,
                color: Colors.transparent,
                child: Center(
                  child: LoadingAnimationWidget.inkDrop(
                    color: const Color(0xffF2EF7DC),
                    size: 60,
                  ),
                ),
              ) :
              Column(
                children: [
                  IntrinsicHeight(
                    child: Container(
                      width: width * 0.85,
                      decoration: BoxDecoration(
                          color: Colors.transparent,
                          border: Border.all(
                              color: const Color(0xffF4F4F4), width: 1.5),
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(2),
                            topRight: Radius.circular(16),
                            bottomLeft: Radius.circular(16),
                            bottomRight: Radius.circular(16),
                          )),
                      child: Consumer<ResponseProviderClass>(builder: (BuildContext context, ResponseProviderClass responseProviderClass, Widget? child) {

                        String response = '${responseProviderClass.GeminiResponseIs}';
                        _speak(response); // Call the TTS function when the response is updated

                        return Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: text(
                              data: '${responseProviderClass.GeminiResponseIs}',
                              fw: FontWeight.bold,
                              fs: 25,
                              col: Color(0xffF2E7DC)),
                        );
                      },

                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 100,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.white,
          onPressed: () async{

            //Stop a Speech
            _stop();

            Provider.of<OnOffProviderClass>(context, listen: false).changeOnorOff();
            Provider.of<GeminiResponseProviderClass>(context, listen: false).changeResponse(false);
            Provider.of<ResponseProviderClass>(context,listen: false).UpdateGeminiResponse('',true);


            SpeechToTextClass.speechToText.isNotListening
                ? _speechToTextClass.startListening()
                : _speechToTextClass.stopListening(context);

          },
          shape: const CircleBorder(),
          child: Provider.of<OnOffProviderClass>(context, listen: true)
                  .OnorOffCheck
              ? const Icon(
                  Icons.mic,
                  color: Colors.black,
                )
              : const Icon(
                  Icons.mic_off,
                  color: Colors.black,
                )),
    );
  }
}
