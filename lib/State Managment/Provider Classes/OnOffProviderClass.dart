import 'package:flutter/cupertino.dart';

class OnOffProviderClass extends ChangeNotifier
{
  bool OnorOffCheck = false;


  void changeOnorOff([bool? newBool])
  {
    OnorOffCheck=newBool ?? !OnorOffCheck;
    notifyListeners();
  }
}