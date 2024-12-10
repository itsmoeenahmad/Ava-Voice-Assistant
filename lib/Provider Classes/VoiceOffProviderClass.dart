

import 'package:flutter/cupertino.dart';

class VoiceOffProviderClass extends ChangeNotifier
{

  bool checkVoice = false;

  void changeVoiceStatus({required bool newbool})
  {
    checkVoice=newbool;
    notifyListeners();
  }

}