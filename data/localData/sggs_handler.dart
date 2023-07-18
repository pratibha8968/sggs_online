
import 'dart:convert';
import 'package:flutter/cupertino.dart';

import '../../model/sggs_model.dart';

class SggsHandler {
  static getJapjiSaheb(BuildContext context) async {
    // await Future.delayed(Duration(seconds: 3));
    // print("_localSggs");
    var assetBundle = DefaultAssetBundle.of(context);

    var data = await assetBundle.loadString('assets/jsons/japji_sahib.json');
    // print("data2...... $data");
    var _localSggs = LocalSggs.fromJson(jsonDecode(data));
    // print("_localSggs ${_localSggs}");
    List<AngData>? _dataLines = _localSggs.data;
    // List<AngData>? _dataLines1;
    // List<AngData>? _dataLines2;

    return _dataLines;
  }



 static getAllBanis(BuildContext context,String fileName) async {

    // await Future.delayed(Duration(seconds: 3));
    print("getAllBanis");
    var assetBundle = DefaultAssetBundle.of(context);

    var data = await assetBundle.loadString('assets/jsons/banis/$fileName.json');
    // print("data1... $data");
    var _localSggs = LocalSggs.fromJson(jsonDecode(data));
    // print("_localSggs ${_localSggs}");
    List<AngData>? _dataLines = _localSggs.data;
    List<AngData>? _dataLines1;
    List<AngData>? _dataLines2;
    return _dataLines;
  }







  static getanandSaheb(BuildContext context) async {
    // await Future.delayed(Duration(seconds: 3));
    print("_localSggs");
    var assetBundle = DefaultAssetBundle.of(context);

    var data = await assetBundle.loadString('assets/jsons/anandsahib.json');
    print("data1... $data");
    var _localSggs = LocalSggs.fromJson(jsonDecode(data));
    print("_localSggs ${_localSggs}");
    List<AngData>? _dataLines = _localSggs.data;
    List<AngData>? _dataLines1;
    List<AngData>? _dataLines2;
    return _dataLines;
  }
  static getrehrasSaheb(BuildContext context) async {
    // await Future.delayed(Duration(seconds: 3));
    print("_localSggs");
    var assetBundle = DefaultAssetBundle.of(context);

    var data = await assetBundle.loadString('assets/jsons/Rehras_Sahib.json');
    print("data2 $data");
    var _localSggs = LocalSggs.fromJson(jsonDecode(data));
    print("_localSggs ${_localSggs}");
    List<AngData>? _dataLines = _localSggs.data;
    List<AngData>? _dataLines1;
    List<AngData>? _dataLines2;

    return _dataLines;
  }
  static getsohilaSaheb(BuildContext context) async {
    // await Future.delayed(Duration(seconds: 3));
    print("_localSggs");
    var assetBundle = DefaultAssetBundle.of(context);

    var data = await assetBundle.loadString('assets/jsons/sohila_sahib.json');
    print("data3 $data");
    var _localSggs = LocalSggs.fromJson(jsonDecode(data));
    print("_localSggs ${_localSggs}");
    List<AngData>? _dataLines = _localSggs.data;
    List<AngData>? _dataLines1;
    List<AngData>? _dataLines2;

    return _dataLines;
  }
  static getsukhmaniSaheb(BuildContext context) async {
    // await Future.delayed(Duration(seconds: 3));
    print("_localSggs");
    var assetBundle = DefaultAssetBundle.of(context);

    var data = await assetBundle.loadString('assets/jsons/sukhmani_sahib.json');
    print("data4 $data");
    var _localSggs = LocalSggs.fromJson(jsonDecode(data));
    print("_localSggs ${_localSggs}");
    List<AngData>? _dataLines = _localSggs.data;
    List<AngData>? _dataLines1;
    List<AngData>? _dataLines2;

    return _dataLines;
  }

  static getAllShabad(BuildContext context, String ang, String string) async {
    // await Future.delayed(Duration(seconds: 3));
    // print("_localSggs");
    var assetBundle = DefaultAssetBundle.of(context);

    var data = await assetBundle.loadString('assets/jsons/sggs.json');
    // print("data $data");
    var _localSggs = LocalSggs.fromJson(jsonDecode(data));
    // print("_localSggs ${_localSggs}");
    List<AngData>? _dataLines = _localSggs.data;
    List<AngData>? _dataLines1;
    List<AngData>? _dataLines2;

    _dataLines1 =
        _dataLines!.where((element) => element.ang == "$ang").toList();

    return _dataLines1;
  }

  static specificItem(BuildContext context, String line_no, String banisName) async {
    // await Future.delayed(Duration(seconds: 3));
    print("_localSggs  $banisName   $line_no");
    var assetBundle = DefaultAssetBundle.of(context);

    var data = banisName==""? await assetBundle.loadString('assets/jsons/sggs.json'):await assetBundle.loadString('assets/jsons/banis/$banisName.json');
    // print("data $data");
    var _localSggs = LocalSggs.fromJson(jsonDecode(data));
    print("_localSggs ${_localSggs}");
    List<AngData>? dataLines = _localSggs.data;
    List<AngData>? _dataLines1;
    List<AngData>? _dataLines2;
    // List<AngData>? _dataLines2;

    _dataLines1 =
        dataLines!.where((element) => element.id == "$line_no").toList();

    return _dataLines1;
  }

  static getLineNo(BuildContext context, String line_no) async {
    // await Future.delayed(Duration(seconds: 3));
    print("_localSggs");
    var assetBundle = DefaultAssetBundle.of(context);

    var data = await assetBundle.loadString('assets/jsons/sggs.json');
    // print("data $data");
    var _localSggs = LocalSggs.fromJson(jsonDecode(data));
    print("_localSggs ${_localSggs}");
    List<AngData>? _dataLines = _localSggs.data;
    List<AngData>? _dataLines1;
    List<AngData>? _dataLines2;
    // List<AngData>? _dataLines2;

    _dataLines1 =
        _dataLines!.where((element) => element.id == "$line_no").toList();

    _dataLines2 = _dataLines
        .where((element) => element.ang == "${_dataLines1![0].ang}")
        .toList();

    return _dataLines2;
  }

  static getEnglishSearch(
      BuildContext context, String textController, int selectedCheckBox) async {
    // await Future.delayed(Duration(seconds: 3));
    // print("_localSggs");
    var assetBundle = DefaultAssetBundle.of(context);

    var data = await assetBundle.loadString('assets/jsons/sggs.json');
    // print("data $data");
    var _localSggs = LocalSggs.fromJson(jsonDecode(data));
    print("_localSggs ${_localSggs}");
    List<AngData>? _dataLines = _localSggs.data;
    List<AngData>? _dataLines1;
    List<AngData> _dataLines2 = [];
    // List<AngData>? _dataLines2;
    // print("textController $textController");
    _dataLines!.forEach((element) {
      var parts = element.english!.split(" ");
      // var parts = name.split(' ')
      // print("element.english ${element.english}");
      var initials = '';
      for (var i = 0; i < parts.length; i++) {
        if (parts[i].length > 0 && parts[i] != '') {
          initials += parts[i][0];
        }
      }
      _dataLines2.add(AngData(
          ang: element.ang,
          english: element.english,
          name: element.name,
          id: element.id,
          serchEnglishData: initials));
    });
    if (selectedCheckBox == 1) {
      _dataLines1 = _dataLines.where((element) {
        return element.english!
            .toLowerCase()
            .contains(textController.toLowerCase());
      }).toList();
      // _dataLines1 = _dataLines2.where((element) {
      //   return element.serchEnglishData!
      //       .toLowerCase()
      //       .startsWith(textController.toLowerCase());
      // }).toList();
    } else if (selectedCheckBox == 2) {
      print("selectedCheckBox");
      _dataLines1 = _dataLines.where((element) {
        return element.english!
            .toLowerCase()
            .startsWith(textController.toLowerCase());
      }).toList();
    }

    print("dckbhjuvghcv $_dataLines1");
    // print("_dataLines1 $_dataLines1");

    return _dataLines1;
  }

  static getPunjabiSearch(
      BuildContext context, String textController, int selectedCheckBox) async {
    print("textController $textController");
    print("selectedCheckBox $selectedCheckBox");
    // await Future.delayed(Duration(seconds: 3));
    // print("_localSggs");
    var assetBundle = DefaultAssetBundle.of(context);

    var data = await assetBundle.loadString('assets/jsons/sggs.json');
    // print("data $data");
    var _localSggs = LocalSggs.fromJson(jsonDecode(data));
    // print("_localSggs ${_localSggs}");
    List<AngData>? _dataLines = _localSggs.data;
    List<AngData>? _dataLines1;
    List<AngData> _dataLines2 = [];
    // List<AngData>? _dataLines2;
    // print("textController $textController");
    _dataLines!.forEach((element) {
      var parts = element.name!.split(" ");
      // var parts = name.split(' ')
      // print("element.english ${element.english}");
      var initials = '';
      for (var i = 0; i < parts.length; i++) {
        if (parts[i].length > 0 && parts[i] != '') {
          initials += parts[i][0];
        }
      }
      // print("initials $initials");
      _dataLines2.add(
        AngData(
            ang: element.ang,
            english: element.english,
            name: element.name,
            id: element.id,
            serchPunjabiData: initials),
      );
      // print("_dataLines1 ${_dataLines2[0].name}");
    });
    // _dataLines1 = _dataLines2
    //     .where(
    //         (element) => element.serchPunjabiData!.startsWith(textController))
    //     .toList();
    // print("_dataLines1 $_dataLines1");
    if (selectedCheckBox == 1) {
      _dataLines1 = _dataLines2.where((element) {
        return element.serchPunjabiData!
            .toLowerCase()
            .startsWith(textController.toLowerCase());
      }).toList();
      print("_dataLines1 $_dataLines1");
    } else if (selectedCheckBox == 2) {
      print("selectedCheckBox");
      _dataLines1 = _dataLines.where((element) {
        return element.name!
            .toLowerCase()
            .startsWith(textController.toLowerCase());
      }).toList();
    } else if (selectedCheckBox == 3) {
      _dataLines1 = _dataLines.where((element) {
        return element.name!
            .toLowerCase()
            .contains(textController.toLowerCase());
      }).toList();
    }

    return _dataLines1;
  }

  static addMultiviewData(BuildContext context, String id) async {
    // await Future.delayed(Duration(seconds: 3));
    // print("_localSggs");
    print("id $id ");
    var assetBundle = DefaultAssetBundle.of(context);

    var data = await assetBundle.loadString('assets/jsons/sggs.json');
    // print("data $data");
    var _localSggs = LocalSggs.fromJson(jsonDecode(data));
    // print("_localSggs ${_localSggs}");
    List<AngData>? _dataLines = _localSggs.data;
    List<AngData>? _dataLines1;
    List<AngData>? _dataLines2;
    // List<AngData>? _dataLines2;
    // print("textController $textController");
    _dataLines1 =
        _dataLines!.where((element) => element.id == "${id}").toList();
    // print("_dataLines1 $_dataLines1");

    return _dataLines1;
  }
}
