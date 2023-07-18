import 'package:flutter/material.dart';

class page2viewModel extends ChangeNotifier {
  int line_no = 0;
  double? height = 25.0;
  bool toolsExpand = false;

  double counter = 22;
  double bigcounter = 38;
  double engcounter = 17;
  double bigeng = 22;
  double punjabicounter = 15;
  double bigpunj = 27;
  double romancounter = 13;
  double bigroman = 26;

  String announcementText = "";
  bool isTranslationVisible = true;
  bool isVisible = true;
  bool punjabiVisible = true;
  bool englishVisible = true;
  bool romanVisible = true;


  String get _announcementText => announcementText;
  int get _lineNo => line_no;
  double? get _height => height;
  bool get expanded => toolsExpand;
  double get _engcounter => engcounter;
  double get _bigeng => bigcounter;
  double get _bigpunj => bigpunj;
  double get _punjabicounter => punjabicounter;
  double get _romancounter => romancounter;
  double get _counter => counter;
  bool get _isTranslationVisible => isTranslationVisible;
  bool get _isVisible => isVisible;
  bool get _punjabiVisible => punjabiVisible;
  bool get _englishVisible => englishVisible;
  bool get _romanVisible => romanVisible;

  void engIncrement() {
    bigeng++;
    engcounter++;
    notifyListeners();
  }

  void engDecrement() {
    bigeng--;
    engcounter--;
    notifyListeners();
  }

  void gurbanincrement() {
    bigcounter++;
    counter++;
    notifyListeners();
  }

  void gurbanidecrement() {
    bigcounter--;
    counter--;
    notifyListeners();
  }
  void punjIncrement() {
    bigpunj++;
    punjabicounter++;
    notifyListeners();
  }

  void punjDecrement() {
    bigpunj--;
    punjabicounter--;
    notifyListeners();
  }
  void romanIncrement() {
    bigroman++;
    romancounter++;
    notifyListeners();
  }

  void romanDecrement() {
    bigroman--;
    romancounter--;
    notifyListeners();
  }



  void setLineNo(int val) {
    line_no = val;
    notifyListeners();
  }

  void clearLineNo(int lineNo) {
    line_no = lineNo;

    notifyListeners();
  }

  void setQuickTools(bool value, double heightValue) {
    height = heightValue;
    toolsExpand = value;
    notifyListeners();
  }

  void setAnnouncementText(String text) {
    announcementText = text;
    notifyListeners();
  }

  void setTranslationVisible(bool val) {
    isTranslationVisible = val;
    notifyListeners();
  }
  void setpunjabiVisible(bool value) {
    punjabiVisible = value;
    notifyListeners();
  }
  void setenglishVisible(bool val) {
    englishVisible = val;
    notifyListeners();
  }
  void setromanVisible(bool val) {
    romanVisible = val;
    notifyListeners();
  }
}
