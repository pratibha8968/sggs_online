import 'package:flutter/cupertino.dart';

class NewbooksModel with ChangeNotifier {
  bool isSidebarAvailable = true;
  bool booksExpand = false;
  int tabIndexValue = 0;
  bool get expanded => booksExpand;
  int get _tabIndexValue => tabIndexValue;
  bool get _isSidebarAvailable => isSidebarAvailable;
  void setbooksExpanded(bool value) {
    booksExpand = value;
    notifyListeners();
  }

  void setTabIndexValue(int value) {
    tabIndexValue = value;
    notifyListeners();
  }

  void setSidebarAvailable(bool val) {
    isSidebarAvailable = val;
    notifyListeners();
  }
}
