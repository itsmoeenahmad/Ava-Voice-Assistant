import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Frontend Code/Reusable Widgets/showMessage.dart';
import '../../State Managment/Provider Classes/savedIconStatusProviderClass.dart';

Future<void> saveResponse(BuildContext context, String response) async {
  final userId = FirebaseAuth.instance.currentUser?.uid;
  if (userId == null) {
    showMessage(context, 'Please Sign In Again');
    return;
  }

  if (response.isEmpty) {
    showMessage(context, 'Nothing To Save');
    return;
  }

  final date = DateTime.now();
  final currentDate =
      "${date.day.toString().padLeft(2, '0')}-${date.month.toString().padLeft(2, '0')}-${date.year}";

  try {
    await FirebaseFirestore.instance.collection('savedResponses').add({
      'userId': userId,
      'response': response,
      'date': currentDate,
      'createdAt': FieldValue.serverTimestamp(),
    });
    if (!context.mounted) return;

    //Showing the Saved Message
    showMessage(context, 'Saved');
    //Changing the Icon
    Provider.of<SavedIconStatusProviderClass>(context, listen: false)
        .changeStatus();
  } catch (error) {
    if (!context.mounted) return;
    showMessage(context, error);
  }
}
