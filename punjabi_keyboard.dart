import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../view_model/colored_border.dart';
import '../view_model/page_view_model.dart';

class PunjabiKeyboard extends StatefulWidget {
  PunjabiKeyboard({Key? key, this.text}) : super(key: key);
  String? text;
  @override
  State<PunjabiKeyboard> createState() => _PunjabiKeyboardState();
}

class _PunjabiKeyboardState extends State<PunjabiKeyboard> {
  List customtext1 = [
    'ੳ',
    'ਅ',
    'ੲ',
    'ਸ',
    'ਹ',
    'ਕ',
    'ਖ',
    'ਗ',
    'ਘ',
    'ਙ',
  ];

  List customtext2 = [
    'ਚ',
    'ਛ',
    'ਜ',
    'ਝ',
    'ਞ',
    'ਟ',
    'ਠ',
    'ਡ',
    'ਢ',
    'ਣ',
  ];

  List customtext3 = [
    'ਤ',
    'ਥ',
    'ਦ',
    'ਧ',
    'ਨ',
    'ਪ',
    'ਫ',
    'ਬ',
    'ਭ',
    'ਮ',
  ];

  List customtext4 = ['ਯ', 'ਰ', 'ਲ', 'ਵ', 'ੜ', 'ਖ਼','-', '←',"", "", "",];

  List customtext5 = ['←'];
  List customtext6 = ['_'];

  List<String> name = ["", "", ""];

  String text = "";

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    print("cdkbjncvbd");
    return Consumer2<Coloredborder, PageViewModel>(
        builder: (context, newvalue, pageviewValue, child) {
      return Container(
        height: size.width < 975 ? 152 : 172,
        child: ListView(
          physics: NeverScrollableScrollPhysics(),
          children: [
            Container(
              color: Color(0xffcfcecc),
              child: FittedBox(
                fit: BoxFit.contain,
                child: Row(
                  children: List.generate(
                      customtext1.length,
                      (index) => Padding(
                            padding: const EdgeInsets.only(
                                top: 5.0, bottom: 5.0, right: 2.0, left: 2),
                            child: InkWell(
                              onTap: () {
                                if (newvalue.selectedItem
                                    .contains(customtext1[index].toString())) {
                                  newvalue.selectedItem
                                      .remove(customtext1[index].toString());
                                } else {
                                  newvalue.selectedItem
                                      .add(customtext1[index].toString());
                                }
                                print("new value${newvalue}");

                                text += customtext1[index];
                                print("text $text");
                                newvalue.setTextController(text);
                                pageviewValue.Search(text);
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  // border: Border.all(
                                  //     color: newvalue.selectedItem.contains(
                                  //             customtext1[index].toString())
                                  //         ? Color(0xffacacad)
                                  //         : Colors.transparent),
                                  borderRadius: BorderRadius.circular(5.0),
                                  color: Color(0xFFFe0e0e0),
                                ),
                                height: 25,
                                // MediaQuery.of(context).size.height * 0.03,
                                width:
                                    MediaQuery.of(context).size.width * 0.035,
                                child: Center(
                                  child: Text("${customtext1[index]}"),
                                ),
                              ),
                            ),
                          )),
                ),
              ),
            ),
            Container(
              color: Colors.white,
              child: FittedBox(
                fit: BoxFit.contain,
                child: Row(
                  children: List.generate(
                      customtext2.length,
                      (index) => Padding(
                            padding: const EdgeInsets.only(
                                top: 5.0, bottom: 5.0, right: 2.0, left: 2),
                            child: GestureDetector(
                              onTap: () {
                                text += customtext2[index];
                                newvalue.setTextController(text);
                                // myController.text = customtext2[index];
                                pageviewValue.Search(text);
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  // border: Border.all(
                                  //     color: name.contains(
                                  //             customtext2[index].toString())
                                  //         ? Color(0xffacacad)
                                  //         : Colors.transparent),
                                  borderRadius: BorderRadius.circular(5.0),
                                  color: Color(0xFFFe0e0e0),
                                ),
                                height: 25,
                                // MediaQuery.of(context).size.height * 0.03,
                                width:
                                    MediaQuery.of(context).size.width * 0.035,
                                child: Center(
                                  child: Text("${customtext2[index]}"),
                                ),
                              ),
                            ),
                          )),
                ),
              ),
            ),
            Container(
              color: Color(0xffcfcecc),
              child: FittedBox(
                fit: BoxFit.contain,
                child: Row(
                  children: List.generate(
                      customtext3.length,
                      (index) => Padding(
                            padding: const EdgeInsets.only(
                                top: 5.0, bottom: 5.0, right: 2.0, left: 2),
                            child: GestureDetector(
                              onTap: () {
                                text += customtext3[index];
                                newvalue.setTextController(text);
                                pageviewValue.Search(text);
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  // border: Border.all(
                                  //     color: name.contains(
                                  //             customtext3[index].toString())
                                  //         ? Color(0xffacacad)
                                  //         : Colors.transparent),
                                  borderRadius: BorderRadius.circular(5.0),
                                  color: Color(0xFFFe0e0e0),
                                ),
                                height: 25,
                                // MediaQuery.of(context).size.height * 0.03,
                                width:
                                    MediaQuery.of(context).size.width * 0.035,
                                child: Center(
                                  child: Text("${customtext3[index]}"),
                                ),
                              ),
                            ),
                          )),
                ),
              ),
            ),
            Container(
              color: Colors.white,
              child: FittedBox(
                fit: BoxFit.contain,
                child: Row(
                  children: [
                    Row(
                      children: List.generate(
                          customtext4.length,
                          (index) => Padding(
                                padding: const EdgeInsets.only(
                                    top: 5.0, bottom: 5.0, right: 2.0, left: 2),
                                child: GestureDetector(
                                  onTap: () {
                                    if (customtext4[index] == "←") {
                                      if (text.isNotEmpty) {
                                        text =
                                            text.substring(0, text.length - 1);
                                        newvalue.setTextController(text);
                                        pageviewValue.Search(text);
                                      }
                                    } else if (customtext4[index] == "") {
                                    }
                                    else if (customtext4[index] == "-") {
                                      text +=" ";
                                      newvalue.setTextController(text);
                                      pageviewValue.Search(text);
                                    }else {
                                      text += customtext4[index];
                                      newvalue.setTextController(text);
                                      pageviewValue.Search(text);
                                    }
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      // border: Border.all(
                                      // color: name.contains(
                                      //         customtext4[index].toString())
                                      //     ? Color(0xffacacad)
                                      //     : Colors.transparent),
                                      borderRadius: BorderRadius.circular(5.0),
                                      color: name.contains(
                                              customtext4[index].toString())
                                          ? Colors.white
                                          : Color(0xFFFe0e0e0),
                                    ),
                                    height: 25,
                                    // MediaQuery.of(context).size.height * 0.03,
                                    width: MediaQuery.of(context).size.width *
                                        0.035,
                                    // height: 30,
                                    // width:55,
                                    child: Center(
                                      child: Text("${customtext4[index]}"),
                                    ),
                                  ),
                                ),
                              )),
                    ),


                  ],
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
