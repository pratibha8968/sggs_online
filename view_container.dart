import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ViewContainerModel with ChangeNotifier {
  double? height = 120;
  bool whenExpanded = true;
  int selectedCheckBox = 1;
  bool light = false;
  List navItemList = [
    {
      "id": 1,
      "value": true,
      "title": "History",
      "icon": Icons.alarm,
    },
    {
      "id": 2,
      "value": false,
      "title": "Insert",
      "icon": Icons.laptop,
    },
    {
      "id": 3,
      "value": false,
      "title": "Others",
      "icon": Icons.more_horiz,
    },
  ];
  double? get _height => height;
  bool get expanded => whenExpanded;
  bool get _light => light;
  List get _navItemList => navItemList;
  int get _selectedCheckBox => selectedCheckBox;
  void setExpanded(bool value, double heightValue) {
    height = heightValue;
    whenExpanded = value;
    notifyListeners();
  }

  void navItemListSelect(bool value, int index) {
    for (var element in navItemList) {
      element["value"] = false;
    }
    navItemList[index]["value"] = value;
    selectedCheckBox = navItemList[index]["id"];
    notifyListeners();
  }

  void setGurbaniLang(bool val) {
    light = val;
    notifyListeners();
  }
}
