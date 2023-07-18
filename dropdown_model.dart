import 'package:flutter/cupertino.dart';

class DropdownTools with ChangeNotifier {
  var items = [
    "Argentina",
    "Brazil",
    "Spain",
    "Switzerland",
  ];

  var dropdownitem ;
  setSelectedValue(value){
    dropdownitem = value;
    notifyListeners();
  }
}
