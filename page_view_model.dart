import 'package:flutter/material.dart';

import '../model/sggs_model.dart';

enum keyboardLanguage { English, Punjabi }

enum checkBoxFilterData { First, Anywhere, Fullwords }

class PageViewModel with ChangeNotifier {
  String searchText = "";
  keyboardLanguage language = keyboardLanguage.Punjabi;
  checkBoxFilterData checkedData = checkBoxFilterData.First;
  int selectedCheckBox = 1;
  int engselectedCheckBox = 1;
  List<AngData>? searchData;
  List<AngData> historyAngData = [];
  List<AngData> get _historyAngData => historyAngData;
  List enggCheckList = [
    {
      "id": 1,
      "value": true,
      "title": "Full Word(s)",
    },
    {
      "id": 2,
      "value": false,
      "title": "First Letter (Anywhere)",
    },
  ];

  List checkListItems = [
    {
      "id": 1,
      "value": true,
      "title": "First Letter (Start)",
    },
    {
      "id": 2,
      "value": false,
      "title": "First Letter (Anywhere)",
    },
    {
      "id": 3,
      "value": false,
      "title": "Full Word(s)",
    },
  ];
  List get _searchData => searchData!;
  List get _checkListItems => checkListItems;
  List get _enggCheckList => enggCheckList;
  String get _searchText => searchText;
  keyboardLanguage get _language => language;
  checkBoxFilterData get _checkedData => checkedData;

  void Search(String val) {
    searchText = val;
    notifyListeners();
  }

  void LaguageSelect(keyboardLanguage value) {
    language = value;
    notifyListeners();
  }

  void CheckBoxSelect(bool value, int index) {
    for (var element in checkListItems) {
      element["value"] = false;
    }
    checkListItems[index]["value"] = value;
    selectedCheckBox = checkListItems[index]["id"];
    notifyListeners();
  }

  void engCheckboxSelect(bool value, int index) {
    for (var element in enggCheckList) {
      element["value"] = false;
    }
    enggCheckList[index]["value"] = value;
    engselectedCheckBox = enggCheckList[index]["id"];
    notifyListeners();
  }

  void SearchFetchedData(val) {
    searchData = val;
    notifyListeners();
  }

  void setHistoryAng(AngData angData) {
    historyAngData.any((element) => element.id == angData.id) == false
        ? historyAngData.add(angData)
        : null;
    notifyListeners();
  }

  void clearHistory() {
    historyAngData.clear();
    notifyListeners();
  }
}
