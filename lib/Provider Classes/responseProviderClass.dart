import 'package:flutter/cupertino.dart';

class ResponseProviderClass extends ChangeNotifier
{
  String GeminiResponseIs = "";
  bool GeminiBool = true;




  void UpdateGeminiResponse(String? response, bool newBool)
  {
    GeminiResponseIs = response!;
    GeminiBool=newBool;
    notifyListeners();
  }
}