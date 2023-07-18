import 'package:flutter/material.dart';
import 'package:Sggs_Online/model/sggs_model.dart';

class Page4ViewProvider with ChangeNotifier {
  List<AngData> historyAngData = [];

  List<AngData> get _historyAngData => historyAngData;

  void setHistoryAng(AngData angData) {
    historyAngData.add(angData);
    notifyListeners();
  }
}
