import 'package:flutter/material.dart';

import '../model/sggs_model.dart';

enum keyboardLanguage1 { English, Punjabi }

enum checkBoxFilterData {First, Anywhere, Fullwords }

class ViewModel with ChangeNotifier {
  String searchText = "";
  keyboardLanguage1 language = keyboardLanguage1.Punjabi;
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
  keyboardLanguage1 get _language => language;
  checkBoxFilterData get _checkedData => checkedData;

  void Searchdata(String val) {
    searchText = val;
    notifyListeners();
  }

  void LaguageSelectdata(keyboardLanguage1 value) {
    language = value;
    notifyListeners();
  }

  void CheckBoxSelectdata(bool value, int index) {
    for (var element in checkListItems) {
      element["value"] = false;
    }
    checkListItems[index]["value"] = value;
    selectedCheckBox = checkListItems[index]["id"];
    notifyListeners();
  }

  void engCheckboxSelectdata(bool value, int index) {
    for (var element in enggCheckList) {
      element["value"] = false;
    }
    enggCheckList[index]["value"] = value;
    engselectedCheckBox = enggCheckList[index]["id"];
    notifyListeners();
  }

  void SearchFetchedData1(val) {
    searchData = val;
    notifyListeners();
  }

  void setHistoryAngdata(AngData angData) {
    historyAngData.any((element) => element.id == angData.id) == false
        ? historyAngData.add(angData)
        : null;
    notifyListeners();
  }

  void clearHistorydata() {
    historyAngData.clear();
    notifyListeners();
  }
}
