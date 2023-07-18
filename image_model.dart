import 'package:flutter/cupertino.dart';



class MyModel extends ChangeNotifier {
  String someValue = "assets/images/white.jpg";
  String get _someValue => someValue;
  void doSomething(val) {
    someValue =val;
    notifyListeners();

  }
}



