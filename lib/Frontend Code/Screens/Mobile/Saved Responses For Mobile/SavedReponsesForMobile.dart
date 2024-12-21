import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../../Reusable Widgets/text.dart';
import 'ResponseScreen.dart';

class SavedReponsesForMobile extends StatefulWidget {
  const SavedReponsesForMobile({super.key});

  @override
  State<SavedReponsesForMobile> createState() => _SavedReponsesForMobileState();
}

class _SavedReponsesForMobileState extends State<SavedReponsesForMobile> {
  
  
  
  //Firestore Instance
  final firestoreInstance = FirebaseFirestore.instance.collection('savedResponses');
  
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
        title: text(data: 'Saved Responses', fw: FontWeight.bold, fs: 25, col: const Color(0xffF2E7DC)),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width*0.03),
          child: Column(
            children: [
              SizedBox(
                height: height*0.04,
              ),
              StreamBuilder(
                  stream: firestoreInstance
                      .where('userId', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
                      .snapshots(),
                  builder: (context, snapshot)
                  {
                    final savedResponses = snapshot.data?.docs;
                    print(savedResponses.toString());
                    if(snapshot.hasError)
                      {
                        return Padding(
                          padding: EdgeInsets.only(top: height*0.4),
                          child: Center(child: text(data: 'Error Occurred, Try Again', fw: FontWeight.bold, fs: 25, col: Colors.white)),
                        );
                      }
                    else if(snapshot.connectionState == ConnectionState.waiting)
                      {
                        return Padding(
                          padding: EdgeInsets.only(top: height*0.4),
                          child: Center(child: LoadingAnimationWidget.fourRotatingDots(color: const Color(0xffF3F3F3), size: 40)),
                        );
                      }
                    else if(savedResponses!.isNotEmpty)
                      {
                        return ListView.builder(
                          itemCount: savedResponses.length,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (content,index){
                              dynamic data = savedResponses[index];
                              dynamic date = data['date'];
                              dynamic response = data['response'];
                          return Column(
                            children: [
                              Row(
                                children: [
                                  //Calendar Icon
                                  const Icon(Icons.calendar_month,color: Color(0xffF2E7DC),size: 20,),
                                  //Space
                                  SizedBox(
                                    width: width*0.04,
                                  ),
                                  //Date
                                  text(data: date, fw: FontWeight.w600, fs: 16.5, col: const Color(0xffF2E7DC)),
                                  //Space
                                  SizedBox(
                                    width: width*0.04,
                                  ),
                                  //Response
                                  Expanded(
                                    child: InkWell(
                                      onTap: (){
                                        Navigator.push(context, MaterialPageRoute(builder: (content)=> ResponseScreen(responseIs: response.toString(),)));
                                      },
                                      child: Container(
                                        height: height*0.035,
                                        width: width*0.5,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: const Color(0xffF2E7DC),
                                            width: 0.2
                                          ),
                                         boxShadow: [
                                           BoxShadow(
                                            color: const Color(0xffF2E7DC).withOpacity(0.1),
                                            spreadRadius: -10,
                                            blurRadius: 30,
                                            offset: const Offset(0, 3), // changes position of shadow
                                          ),
                                          ],
                                          borderRadius: BorderRadius.circular(3.5)
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(4.0), // Adds padding inside the container
                                          child: Text(
                                            '${response.toString().substring(0, 38)}...', // Truncate and add dots
                                            overflow: TextOverflow.ellipsis, // Handles overflow gracefully
                                            maxLines: 1, // Ensures it stays in one line
                                            style: GoogleFonts.bricolageGrotesque(
                                              color: const Color(0xffF3F3F3), // Customize text color
                                              fontSize: 12, // Customize font size
                                              fontWeight: FontWeight.w800, // Customize font weight
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: height*0.03,
                              ),
                            ],
                          );
                        });
                      }
                    else if(savedResponses.isEmpty)
                      {
                        return Padding(
                          padding: EdgeInsets.only(top: height*0.35),
                          child: Center(
                            child: text(data: 'No Response Saved', fw: FontWeight.w700, fs: 17, col: Colors.white),
                          ),
                        );
                      }
                    else
                      {
                        return const Text('');
                      }
                  }
              ),

            ],
          ),
        ),
      ),
    );
  }
}
