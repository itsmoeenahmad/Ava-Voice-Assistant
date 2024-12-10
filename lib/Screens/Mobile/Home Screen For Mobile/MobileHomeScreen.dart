import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';
import 'package:voiceassistant/Provider%20Classes/VoiceOffProviderClass.dart';
import 'package:voiceassistant/Provider%20Classes/savedIconStatusProviderClass.dart';
import 'package:voiceassistant/Reusable%20Widgets/text.dart';
import 'package:voiceassistant/Provider%20Classes/responseProviderClass.dart';
import 'package:voiceassistant/Screens/Mobile/About%20Us%20For%20Mobile/AboutUsForMobile.dart';
import 'package:voiceassistant/Screens/Mobile/Ava%20Versions%20For%20Mobile/AvaVersionsForMobile.dart';
import 'package:voiceassistant/Screens/Mobile/Contact%20Us%20For%20Mobile/ContactUsForMobile.dart';
import 'package:voiceassistant/Screens/Mobile/FAQ%20For%20Mobile/FaqForMobile.dart';
import 'package:voiceassistant/Screens/Mobile/Saved%20Responses%20For%20Mobile/SavedReponsesForMobile.dart';
import 'package:voiceassistant/Screens/Mobile/User%20Guide%20For%20Mobile/UserGuideScreenForMobile.dart';
import '../../../Backend Code/Firestore DataBase/saveResponse.dart';
import '../../../Backend Code/Google Auth/signOutWithGoogle.dart';
import '../../../Provider Classes/GeminiResponseProviderClass.dart';
import '../../../Provider Classes/OnOffProviderClass.dart';
import '../../../Reusable Widgets/showMessage.dart';
import '../../../SpeechToText/SpeechToText.dart';

class MobileHomeScreen extends StatefulWidget {
  const MobileHomeScreen({super.key});

  @override
  State<MobileHomeScreen> createState() => _MobileHomeScreenState();
}

class _MobileHomeScreenState extends State<MobileHomeScreen> with WidgetsBindingObserver {


  //Creating an instance/object of SpeechToTextClass
  SpeechToTextClass _speechToTextClass = new SpeechToTextClass();

  //Creating an instance/object of FlutterTts(Text to Speech)
  FlutterTts flutterTts = FlutterTts();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_)  {
     _createTutorial();
    });
    _speechToTextClass.initSpeech();
    _initializeTts();
    WidgetsBinding.instance?.addObserver(this); // Add observer
  }

  @override
  void dispose() {
    _speechToTextClass.stopListening(context); // Stop listening before disposing
    flutterTts.stop(); // Stop speaking before disposing
    WidgetsBinding.instance?.removeObserver(this); // Remove observer
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused || state == AppLifecycleState.detached || state == AppLifecycleState.inactive) {
      flutterTts.stop(); // Stop TTS when the app is paused or detached
    }
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

  //Global keys are for accessing the widget(anyWidget) from the widget tree easily.

  //Creating a GlobalKey for the Scaffold
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  //Secure Storage Instance
  FlutterSecureStorage secureStorage = FlutterSecureStorage();

  //Creating a GlobalKey for the Intro.
  final GlobalKey drawerKey = GlobalKey();
  final GlobalKey floatingButtonKey = GlobalKey();

  //Function For Showing the Intro-Demo
  Future<void> _createTutorial() async {

    //Getting the introStatus
    String? introStatus =  await secureStorage.read(key: 'introStatus');

    if(introStatus!='true')
      {
        print('Show the Intro');

        final targets = [
          TargetFocus(
            identify: 'floatingButton',
            keyTarget: floatingButtonKey,
            alignSkip: Alignment.topCenter,
            contents: [
              TargetContent(
                align: ContentAlign.top,
                builder: (context, controller) => Text(
                    'Click on it & speak about your question/query.',
                    style: GoogleFonts.montserrat(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 20
                    )
                ),
              ),
            ],
          ),
          TargetFocus(
            identify: 'drawerButton',
            keyTarget: drawerKey,
            alignSkip: Alignment.bottomCenter,
            contents: [
              TargetContent(
                align: ContentAlign.bottom,
                builder: (context, controller) => Text(
                    'Click on it & See the menu of Ava-Voice-Assistant',
                    style: GoogleFonts.montserrat(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 20
                    )
                ),
              ),
            ],
          ),
        ];

        // Initializing the TutorialCoachMark with the targets
        final tutorial = TutorialCoachMark(
            targets: targets,
            colorShadow: Colors.black, // optional customization
            textSkip: "Skip",
            paddingFocus: 10,
            textStyleSkip: GoogleFonts.montserrat(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 25
            ),
            onFinish: () async {
              print('finish..............Updating the Status Of Intro');
              await secureStorage.write(key: 'introStatus', value: 'true');
            },
            onSkip: ()  {
              print('Skipped-Done............Updating the Status Of Intro');
              secureStorage.write(key: 'introStatus', value: 'true');
              return true;
            }
        );

        // Show the tutorial after a delay
        Future.delayed(const Duration(milliseconds: 500), () {
          tutorial.show(context: context);
        });
      }
    else
      {
        print('Skip the Intro');
        print(introStatus);
      }

  }


  //Gemini Response
  String? response;



  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: const Color(0xff272727),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        scrolledUnderElevation: 0,
        backgroundColor: Color(0xff272727),
        centerTitle: true,
        title: Row(
          children: [
            InkWell(
                onTap: (){
                  // Open the drawer using the GlobalKey
                  _scaffoldKey.currentState?.openDrawer();
                },
                child: Icon(
                  key: drawerKey,
                  Icons.menu,color: const Color(0xffF2E7DC),size: 30,)),
            SizedBox(
              width: width*0.06,
            ),
            text(
                data: 'Ava Voice Assistant',
                fw: FontWeight.w700,
                fs: 26,
                col: Colors.white),


          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: width * 0.04),
        child: SingleChildScrollView(
          child: Column(
            children: [
              //Ai Bot Animation
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
                  //Loading
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
              //User View
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
                  //Loading
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
                  //Response
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

                        response = '${responseProviderClass.GeminiResponseIs}';
                        _speak(response!); // Call the TTS function when the response is updated

                        return Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: SingleChildScrollView(
                            child: text(
                                data: '${response}',
                                fw: FontWeight.bold,
                                fs: 15,
                                col: const Color(0xffF2E7DC)),
                          ),
                        );
                      },
                      ),
                    ),
                  ),
                  //Space
                  SizedBox(
                    height: height*0.0005,
                  ),
                  //Copy & Save Icon
                  SizedBox(
                    height: height*0.05,
                    width: width * 0.85,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        //Copy Icon
                        InkWell(
                          onTap: () async{
                            await Clipboard.setData(ClipboardData(text: response!));
                            showMessage(context, 'Response Copied');
                          },child: SizedBox(
                            height: height*0.035,
                            width: width*0.08,
                            child: const Image(image: AssetImage('assets/Icons/copyIcon.png')),
                          ),
                        ),
                        //Space
                        SizedBox(
                          width: width*0.02,
                        ),
                        //Saved Icon
                        Consumer<SavedIconStatusProviderClass>(
                          builder: (BuildContext context, ProviderClass, Widget? child) {
                            return InkWell(
                                onTap: (){
                                  //Calling Firestore Code To Store the response.
                                  saveResponse(context,response!);
                                },
                                child: SizedBox(
                                  height: height*0.035,
                                  width: width*0.08,
                                  child: ProviderClass.status ?
                                  const Image(image: AssetImage('assets/Icons/bookmarkAddedIcon.png'))
                                      :
                                  const Image(image: AssetImage('assets/Icons/bookmarkIcon.png'),
                                  ),
                                )
                            );
                          },
                        ),
                        //Space
                        SizedBox(
                          width: width*0.02,
                        ),
                        //Stopping Voice Icon
                        Consumer<VoiceOffProviderClass>(
                          builder: (BuildContext context, VoiceOffProviderClass ProviderClass, Widget? child) {
                            return InkWell(
                              onTap: () async{
                                //Changing the Image
                                ProviderClass.changeVoiceStatus(newbool: true);
                                //Calling to stop the speaking:
                                _stop();
                              },child: SizedBox(
                                height: height*0.035,
                                width: width*0.08,
                                child: ProviderClass.checkVoice ?
                                const Image(image: AssetImage('assets/Icons/VoiceOffIcon.png')) :
                                const Image(image: AssetImage('assets/Icons/VoiceOnIcon.png'))
                            ),
                            );
                          },
                        ),
                        //Space
                        SizedBox(
                          width: width*0.02,
                        ),
                      ],
                    ),
                  ),
                  //Space
                  SizedBox(
                    height: height*0.1,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        key: floatingButtonKey,
          backgroundColor: Colors.white,
          onPressed: () async{

            //Change the VoiceStatus
            Provider.of<VoiceOffProviderClass>(context,listen: false).changeVoiceStatus(newbool: false);

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
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                color: Color(0xff272727),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  //User Image
                  Container(
                    height: height*0.11,
                    width: width*0.23,
                    decoration: BoxDecoration(
                      color: Colors.white12,
                      shape: BoxShape.circle,
                      image: DecorationImage(image: NetworkImage(FirebaseAuth.instance.currentUser!.photoURL.toString())
                    ),
                    ),),
                  //Space
                  SizedBox(
                    width: width*0.01,
                  ),
                  //User Name & Email
                  SizedBox(
                    height: height*0.12,
                    width: width*0.4,
                    // color: Colors.white12,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        text(data: FirebaseAuth.instance.currentUser!.displayName.toString(), fw: FontWeight.w800, fs: 18, col: const Color(0xffF2E7DC)),
                        SizedBox(
                          height: height*0.001,
                        ),
                        text(data: FirebaseAuth.instance.currentUser!.email.toString(), fw: FontWeight.w800, fs: 8.5, col: const Color(0xffF2E7DC)),
                       ],
                    ),
                  ),
                ],
              ),
            ),
            //Saved Responses
            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> const SavedReponsesForMobile()));
              },
              child: ListTile(
                leading: const Icon(
                  Icons.bookmark_added_sharp,
                ),
                title: text(data: 'Saved Responses', fw: FontWeight.bold, fs: 20, col: const Color(0xff272727))
              ),
            ),
            //User Guide
            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> const UserGuideScreenForMobile()));
              },
              child: ListTile(
                  leading: const Icon(
                    Icons.sticky_note_2_rounded,
                  ),
                  title: text(data: 'User Guide', fw: FontWeight.bold, fs: 20, col: const Color(0xff272727))
              ),
            ),
            //FAQ
            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> const FaqForMobile()));
              },
              child: ListTile(
                  leading: const Icon(
                    Icons.contact_support_outlined,
                  ),
                  title: text(data: 'FAQ', fw: FontWeight.bold, fs: 20, col: const Color(0xff272727))
              ),
            ),
            //Ava Versions
            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> const AvaVersionsForMobile()));
              },
              child: ListTile(
                  leading: const Icon(
                    Icons.system_security_update_good,
                  ),
                  title: text(data: 'Ava Versions', fw: FontWeight.bold, fs: 20, col: const Color(0xff272727))
              ),
            ),
            //About Us
            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> const AboutUsForMobile()));
              },
              child: ListTile(
                  leading: const Icon(
                    Icons.group,
                  ),
                  title: text(data: 'About Us', fw: FontWeight.bold, fs: 20, col: const Color(0xff272727))
              ),
            ),
            //Contact Us
            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> const ContactUsForMobile()));
              },
              child: ListTile(
                  leading: const Icon(
                    Icons.mail,
                  ),
                  title: text(data: 'Contact Us', fw: FontWeight.bold, fs: 20, col: const Color(0xff272727))
              ),
            ),
            //Logout
            InkWell(
              onTap: (){
                signOutWithGoogle(context);
              },
              child: ListTile(
                  leading: const Icon(
                    Icons.logout,
                  ),
                  title: text(data: 'LogOut', fw: FontWeight.bold, fs: 20, col: const Color(0xff272727))
              ),
            ),
          ],
        ),
      ),
    );
  }
}
