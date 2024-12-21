import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';

import '../../Frontend Code/Reusable Widgets/showMessage.dart';
import '../../State Managment/Provider Classes/savedIconStatusProviderClass.dart';

void saveResponse(context, String response){
  final firestoreInstance = FirebaseFirestore.instance.collection('savedResponses');

  //User ID
  String userId = FirebaseAuth.instance.currentUser!.uid;
  print('userId = ${userId}');

  //Dynamic ID
  String id = DateTime.now().millisecondsSinceEpoch.toString();
  print('Dynamic Id is ${id}');


  DateTime currentDateTime = DateTime.now();
  var date = DateTime.parse(currentDateTime.toString());
  var currentDate =
      "${date.day.toString().padLeft(2, '0')}-${date.month.toString().padLeft(2, '0')}-${date.year}";
  print('Current Date = $currentDate');

  firestoreInstance.doc(id).set({
    'userId': userId,
    'response': response,
    'date': currentDate,
  }).then((success){
    //Showing the Saved Message
    showMessage(context, 'Saved');
    //Changing the Icon
    Provider.of<SavedIconStatusProviderClass>(context,listen: false).changeStatus();
  }).onError((error,another){
    showMessage(context, error);
  });
}