import 'package:flutter/material.dart';
import 'package:Sggs_Online/model/sggs_model.dart';

class Page3ViewProvider with ChangeNotifier {
  int ang = 0;
  int lineNo = 0;
  List<AngData> selectedAng = [];
  bool showJapji = false;
  bool showAnandsahib = false;
  bool showRehrasahib = false;
  bool showSohilasahib = false;
  bool showSukhmanisahib = false;
  String banisName="";

  // int scrollIndex = 0;

  int get _ang => ang;
  // int get _scrollIndex => scrollIndex;
  int get _lineNo => lineNo;
  List<AngData> get _selectedAng => selectedAng;
String get _banisName=> banisName;
  void setAng(int Ang, int line_no) {
    lineNo = line_no;
    ang = Ang;
    notifyListeners();
  }

  void setBanisName(String val){
    banisName =val;
    notifyListeners();
  }

  void clearLineNo(int line_no) {
    lineNo = line_no;

    notifyListeners();
  }

  function(AngData angData) async {
    selectedAng.clear();
    selectedAng.add(angData);
  }

  void setSelectedAngData(AngData angData) {
    if (selectedAng.length != 0) {
      selectedAng.any((element) => element.ang == angData.ang)
          ? selectedAng.add(angData)
          : function(angData);
    } else {
      selectedAng.add(angData);
    }

    notifyListeners();
  }

  void setjapji(value) {
    showJapji = value;
    notifyListeners();
  }
  void setAnanadsahib(value) {
    showAnandsahib = value;
    notifyListeners();
  }
  void setRehreassahib(value) {
    showRehrasahib = value;
    notifyListeners();
  }
  void setSohilasahib(value) {
    showSohilasahib = value;
    notifyListeners();
  }
  void setSukhmanisahib(value) {
    showSohilasahib = value;
    notifyListeners();
  }
}
