import 'dart:convert';

import 'package:flutter/cupertino.dart';

import '../../model/all_banis_model.dart';

class AllBanisHandler{
  static AllBanis(BuildContext context)  async {
    var assetBanis = DefaultAssetBundle.of(context);
    var alldatas = await assetBanis.loadString('assets/jsons/all_banis.json');
    var _localBanis = BanisList.fromJson(jsonDecode(alldatas));
    print("_localBanis${_localBanis}");
    List<Allbanis>? _banisData = _localBanis.allbanis;
    return _banisData;
  }
}