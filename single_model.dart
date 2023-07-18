import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ViewSingleModel with ChangeNotifier {
  bool screenExpand = false;
  double? height = 400;
  bool displayexpand = true;
  int selectedText = 1;
  bool light = false;
  List singleItemList = [
    {
      "id": 1,
      "value": true,
      "title": "Search",
      "icon": Icons.search,
    },
    {
      "id": 2,
      "value": false,
      "title": "History",
      "icon": Icons.alarm,
    },
    {
      "id": 3,
      "value": false,
      "title": "History",
      "icon": Icons.radio_button_checked,
    },
    {
      "id": 4,
      "value": false,
      "title": "Insert",
      "icon": Icons.laptop,
    },
    {
      "id": 5,
      "value": false,
      "title": "Others",
      "icon": Icons.more_horiz,
    },
  ];
  bool get expanded => screenExpand;
  bool get _light => light;
  bool get expand => displayexpand;

  void displayListSelect(bool value, int index) {
    for (var element in singleItemList) {
      element["value"] = false;
    }
    singleItemList[index]["value"] = value;
    selectedText = singleItemList[index]["id"];
    notifyListeners();
  }

  void setDisplay(bool value, double heightValue) {
    height = heightValue;
    displayexpand = value;
    notifyListeners();
  }

  void setSelectedText(int val) {
    for (var element in singleItemList) {
      element["value"] = false;
    }
    singleItemList[2]["value"] = true;
    selectedText = val;
    notifyListeners();
  }

  void setGurbaniLang(bool val) {
    light = val;
    notifyListeners();
  }

  void setScreenExpanded(bool value) {
    screenExpand = value;
    notifyListeners();
  }
}
