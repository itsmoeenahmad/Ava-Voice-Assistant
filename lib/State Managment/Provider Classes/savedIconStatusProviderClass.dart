import 'package:flutter/cupertino.dart';

class SavedIconStatusProviderClass extends ChangeNotifier {
  bool status = false;

  void changeStatus([bool newStatus = true]) {
    status = newStatus;
    notifyListeners();
  }
}
