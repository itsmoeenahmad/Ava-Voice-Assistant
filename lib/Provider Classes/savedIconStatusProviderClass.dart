import 'package:flutter/cupertino.dart';

class SavedIconStatusProviderClass extends ChangeNotifier {
  bool status = false;

  void changeStatus() {
    print('Before: Status is ${status}');
    status = true;
    print('After: Status is ${status}');
    notifyListeners();
  }
}
