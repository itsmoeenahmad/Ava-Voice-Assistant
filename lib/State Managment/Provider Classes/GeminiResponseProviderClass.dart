import 'package:flutter/foundation.dart';

class GeminiResponseProviderClass extends ChangeNotifier
{

  bool checkResponse = true;



  void changeResponse(bool newBool)
  {
    checkResponse=newBool;
    notifyListeners();
  }


}