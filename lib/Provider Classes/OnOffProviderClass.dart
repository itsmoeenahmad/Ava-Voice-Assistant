import 'package:flutter/cupertino.dart';

class OnOffProviderClass extends ChangeNotifier
{
  bool OnorOffCheck = false;


  void changeOnorOff()
  {
    OnorOffCheck=!OnorOffCheck;
    notifyListeners();
  }
}