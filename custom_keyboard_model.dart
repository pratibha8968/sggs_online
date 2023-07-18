import 'package:flutter/cupertino.dart';

class CustomKeyboardModel with ChangeNotifier {
  double? height = 45.0;
  bool isExpanded = false;
  double? get _height => height;
  bool get expanded => isExpanded;
  void setExpanded(bool value) {
    isExpanded = value;
    notifyListeners();
  }
}
