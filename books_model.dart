import 'package:flutter/cupertino.dart';

class CustombooksModel with ChangeNotifier {
  bool sidebarExpand = false;
  bool settingExpand = false;
  bool get expanded => sidebarExpand;
  bool get _settingExpand => settingExpand;
  void setExpanded(bool value) {
    sidebarExpand = value;
    notifyListeners();
  }
  void settingExpanded(bool value) {
    settingExpand = value;
    notifyListeners();
  }
}
