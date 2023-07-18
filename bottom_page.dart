import 'package:Sggs_Online/view/page1.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../utilis/keywords_data.dart';
import '../utilis/punjabi_keyboard.dart';
import '../view_model/books_model2.dart';
import '../view_model/colored_border.dart';
import '../view_model/custom_keyboard_model.dart';
import '../view_model/page2_view_model.dart';
import '../view_model/page_view_model.dart';
import '../view_model/single_model.dart';

class BottomPage extends StatefulWidget {
  const BottomPage({Key? key}) : super(key: key);

  @override
  State<BottomPage> createState() => _BottomPageState();
}

class _BottomPageState extends State<BottomPage> {
  final String fristName = "Search";
  final String secondName = "History";
  final String thirdName = "Shabad";
  final String fourthName = "Insert";
  final String lastName = "Others";
  late FocusNode focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Consumer4<ViewSingleModel, PageViewModel, page2viewModel,
              NewbooksModel>(
          builder:
              (context, value, pageVal, pageviewVal, newBooksvalue, child) {
        return Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Color(0xffF83219),
              width: 1,
            ),
            color: Color(0xfff5f5f5),
            // borderRadius: BorderRadius.all(
            //   Radius.circular(8.0),
            // ),
          ),
          child: Stack(
            children: [
              Column(
                children: [
                  Container(
                      decoration: BoxDecoration(
                        // borderRadius: BorderRadius.circular(
                        //   5.0,
                        // ),
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Color(0xffFC8B27),
                            Color(0xffF83219),
                          ],
                        ),
                      ),
                      height: size.height / 20,

                      // color: Color(0xFFFe0e0e0),
                      child: Consumer2<PageViewModel, CustomKeyboardModel>(
                        builder: (context, value, keyboardValue, child) {
                          List data = value.checkListItems.where(
                            (element) {
                              return element["value"] == true;
                            },
                          ).toList();
                          List engData = value.enggCheckList.where(
                            (element) {
                              return element["value"] == true;
                            },
                          ).toList();
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: size.width / 6,
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: FittedBox(
                                    fit: BoxFit.contain,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Transform.scale(
                                          scale: 0.9,
                                          child: Radio<keyboardLanguage>(
                                            value: keyboardLanguage.Punjabi,
                                            groupValue: value.language,
                                            fillColor:
                                                MaterialStateColor.resolveWith(
                                                    (states) => Colors.white
                                                    //Color(0xFFF00b165)
                                                    ),
                                            onChanged: (keyboardLanguage? val) {
                                              value.LaguageSelect(val!);
                                            },
                                          ),
                                        ),
                                        const Text(
                                          "Gurmukhi",
                                          style: TextStyle(
                                              color: Colors.white,
                                              //color: Color(0xFFF424242),
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        Transform.scale(
                                          scale: 0.9,
                                          child: Radio<keyboardLanguage>(
                                            value: keyboardLanguage.English,
                                            groupValue: value.language,
                                            fillColor:
                                                MaterialStateColor.resolveWith(
                                                    (states) => Colors.white),
                                            onChanged: (keyboardLanguage? val) {
                                              print(value.searchText);
                                              if (value.searchText.length ==
                                                  0) {
                                                value.LaguageSelect(val!);
                                                keyboardValue
                                                    .setExpanded(false);
                                              }
                                            },
                                          ),
                                        ),
                                        const Text(
                                          "English",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              value.language == keyboardLanguage.Punjabi
                                  ? size.width > 1200
                                      ? SizedBox(
                                          height: 50,
                                          width: size.width < 1000
                                              ? size.width / 3.75
                                              : size.width / 3.75,
                                          child: FittedBox(
                                            fit: BoxFit.contain,
                                            child: Row(
                                              children: [
                                                ...List.generate(
                                                    3,
                                                    (index) => Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  right: 0.0),
                                                          child: SizedBox(
                                                            height: 50,
                                                            width: size.width <
                                                                    1000
                                                                ? size.width /
                                                                    5.9
                                                                : size.width /
                                                                    7,
                                                            child: Align(
                                                              alignment:
                                                                  Alignment
                                                                      .center,
                                                              child:
                                                                  ListTileTheme(
                                                                horizontalTitleGap:
                                                                    0,
                                                                // contentPadding: EdgeInsets.all(0),
                                                                child:
                                                                    CheckboxListTile(
                                                                  controlAffinity:
                                                                      ListTileControlAffinity
                                                                          .leading,
                                                                  contentPadding:
                                                                      EdgeInsets
                                                                          .zero,
                                                                  // dense: true,
                                                                  side: const BorderSide(
                                                                      color: Colors.white,
                                                                      // color: Color(
                                                                      //     0xff585858),
                                                                      width: 1.5),
                                                                  checkColor:
                                                                      Colors
                                                                          .black,

                                                                  activeColor:
                                                                      Colors
                                                                          .white,

                                                                  title: Text(
                                                                    value.checkListItems[
                                                                            index]
                                                                        [
                                                                        "title"],
                                                                    style: const TextStyle(
                                                                        fontSize:
                                                                            18.0,
                                                                        color: Colors
                                                                            .white
                                                                        // color: Color(
                                                                        //     0xFFF424242),
                                                                        ),
                                                                  ),
                                                                  value: value.checkListItems[
                                                                          index]
                                                                      ["value"],
                                                                  onChanged:
                                                                      (val) {
                                                                    if (value.checkListItems[index]
                                                                            [
                                                                            "value"] ==
                                                                        false) {
                                                                      value.CheckBoxSelect(
                                                                          val!,
                                                                          index);
                                                                    }
                                                                  },
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ))
                                              ],
                                            ),
                                          ),
                                        )
                                      : Container(
                                          width: 150,
                                          height: 30,
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(5.0)),
                                          child: FittedBox(
                                            fit: BoxFit.contain,
                                            child: DropdownButtonHideUnderline(
                                              child: DropdownButton2(
                                                itemPadding: EdgeInsets.all(0),
                                                value: data[0]["title"],
                                                icon: const Icon(
                                                    Icons.arrow_drop_down),
                                                buttonPadding:
                                                    EdgeInsets.all(0),
                                                itemHeight: 20,
                                                buttonHeight: 17,
                                                onChanged: (val) {
                                                  print(val);

                                                  var index = value
                                                      .checkListItems
                                                      .indexWhere((element) =>
                                                          element["title"] ==
                                                          val);
                                                  if (value.checkListItems[
                                                          index]["value"] ==
                                                      false) {
                                                    value.CheckBoxSelect(
                                                        true, index);
                                                  }
                                                },
                                                items: value.checkListItems
                                                    .map((map) {
                                                  return DropdownMenuItem(
                                                    value: map["title"],
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 8.0),
                                                      child: Text(
                                                        map["title"],
                                                        style: TextStyle(
                                                            fontSize: 14),
                                                      ),
                                                    ),
                                                  );
                                                }).toList(),
                                              ),
                                            ),
                                          ),
                                        )
                                  : size.width > 1000
                                      ? SizedBox(
                                          height: 50,
                                          width: size.width < 1200
                                              ? size.width / 5
                                              : size.width / 5,
                                          child: FittedBox(
                                            fit: BoxFit.contain,
                                            child: Row(
                                              children: [
                                                ...List.generate(
                                                    2,
                                                    (index) => Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  right: 0.0),
                                                          child: SizedBox(
                                                            height: 50,
                                                            width: size.width <
                                                                    1000
                                                                ? size.width /
                                                                    5.9
                                                                : size.width /
                                                                    7,
                                                            child: Align(
                                                              alignment:
                                                                  Alignment
                                                                      .center,
                                                              child:
                                                                  ListTileTheme(
                                                                horizontalTitleGap:
                                                                    0,
                                                                // contentPadding: EdgeInsets.all(0),
                                                                child:
                                                                    CheckboxListTile(
                                                                  controlAffinity:
                                                                      ListTileControlAffinity
                                                                          .leading,
                                                                  contentPadding:
                                                                      EdgeInsets
                                                                          .zero,
                                                                  // dense: true,
                                                                  side: const BorderSide(
                                                                      color: Colors.white,
                                                                      // color: Color(
                                                                      //     0xff585858),
                                                                      width: 1.5),
                                                                  checkColor:
                                                                      Colors
                                                                          .black,

                                                                  activeColor:
                                                                      Colors
                                                                          .white,

                                                                  title: Text(
                                                                    value.enggCheckList[
                                                                            index]
                                                                        [
                                                                        "title"],
                                                                    style: const TextStyle(
                                                                        fontSize:
                                                                            18.0,
                                                                        color: Colors
                                                                            .white
                                                                        // color: Color(
                                                                        //     0xFFF424242),
                                                                        ),
                                                                  ),
                                                                  value: value.enggCheckList[
                                                                          index]
                                                                      ["value"],
                                                                  onChanged:
                                                                      (val) {
                                                                    if (value.enggCheckList[index]
                                                                            [
                                                                            "value"] ==
                                                                        false) {
                                                                      value.engCheckboxSelect(
                                                                          val!,
                                                                          index);
                                                                    }
                                                                  },
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        )),
                                                SizedBox(
                                                  width: 50,
                                                )
                                              ],
                                            ),
                                          ),
                                        )
                                      : Container(
                                          color: Colors.white,
                                          width: 150,
                                          height: 30,
                                          child: FittedBox(
                                            fit: BoxFit.contain,
                                            child: DropdownButtonHideUnderline(
                                              child: DropdownButton2(
                                                itemPadding: EdgeInsets.all(0),
                                                value: engData[0]["title"],
                                                icon: const Icon(
                                                    Icons.arrow_drop_down),
                                                buttonPadding:
                                                    EdgeInsets.all(0),
                                                itemHeight: 20,
                                                buttonHeight: 17,
                                                onChanged: (val) {
                                                  print(val);
                                                  // if (value.checkListItems[index]["value"] ==
                                                  //     false) {
                                                  //   value.CheckBoxSelect(val!, index);
                                                  // }
                                                  var index = value
                                                      .enggCheckList
                                                      .indexWhere((element) =>
                                                          element["title"] ==
                                                          val);
                                                  if (value.enggCheckList[index]
                                                          ["value"] ==
                                                      false) {
                                                    value.engCheckboxSelect(
                                                        true, index);
                                                  }
                                                },
                                                items: value.enggCheckList
                                                    .map((map) {
                                                  return DropdownMenuItem(
                                                    value: map["title"],
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 8.0),
                                                      child: Text(
                                                        map["title"],
                                                        style: TextStyle(
                                                            fontSize: 14),
                                                      ),
                                                    ),
                                                  );
                                                }).toList(),
                                              ),
                                            ),
                                          ),
                                        )
                            ],
                          );
                        },
                      )),
                  Divider(
                    height: 1,
                    thickness: 1,
                    color: Color(0xFFFcccccc),
                  ),
                  Consumer3<CustomKeyboardModel, Coloredborder, PageViewModel>(
                      builder: (
                    context,
                    value,
                    newvalue,
                    pageViewValue,
                    child,
                  ) {
                    print("........>>>>");
                    return Column(
                      children: [
                        pageViewValue.language == keyboardLanguage.Punjabi
                            ? Container(
                                color: Color(0xFFF800020),
                                child: SizedBox(
                                  height: 45,
                                  width: MediaQuery.of(context).size.width,
                                  child: TextFormField(
                                    focusNode: focusNode,
                                    autofocus: true,
                                    controller: newvalue.textController,
                                    decoration: InputDecoration(
                                        fillColor: Color(0xFFFe0e0e0),
                                        filled: true,
                                        hintText: "Search here....",
                                        hintStyle: TextStyle(fontSize: 14),
                                        border: InputBorder.none,
                                        suffixIcon: GestureDetector(
                                          onTap: () {
                                            FocusScope.of(context)
                                                .requestFocus(focusNode);
                                            if (value.isExpanded == false) {
                                              value.setExpanded(true);
                                            } else {
                                              value.setExpanded(false);
                                            }
                                          },
                                          child: Container(
                                            width: 40,
                                            // color: Colors.pink,
                                            // // color: Color(0xFFFe0e0e0),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                GestureDetector(
                                                  onTap: () {
                                                    if (value.isExpanded ==
                                                        false) {
                                                      value.setExpanded(true);
                                                    } else {
                                                      value.setExpanded(false);
                                                    }
                                                  },
                                                  child: Container(
                                                      height: 40,
                                                      width: 40,
                                                      color: Color(0xFF4A4949),
                                                      // color: Color(0xFFFe0813b),
                                                      child: Icon(
                                                        Icons
                                                            .keyboard_alt_outlined,
                                                        color: Colors.white,
                                                      )),
                                                ),
                                              ],
                                            ),
                                          ),
                                        )),
                                    onChanged: (value) {
                                      newvalue.textController.text =
                                          KeywordsData.textSelect(newvalue
                                              .textController.text
                                              .toUpperCase());
                                      newvalue.textController.selection =
                                          TextSelection.fromPosition(
                                              TextPosition(
                                                  offset: newvalue
                                                      .textController
                                                      .text
                                                      .length));
                                      pageViewValue.Search(newvalue
                                          .textController.text
                                          .toString());
                                    },
                                  ),
                                  //}),
                                ),
                              )
                            : Container(
                                color: Color(0xFFFe0e0e0),
                                child: SizedBox(
                                  height: 45,
                                  width: MediaQuery.of(context).size.width,
                                  child: TextFormField(
                                      controller: newvalue.textController,
                                      decoration: const InputDecoration(
                                        fillColor: Color(0xFFFe0e0e0),
                                        filled: true,
                                        hintText:
                                            "Enter search term [Translations Only] or ang number",
                                        hintStyle: TextStyle(fontSize: 14),
                                        border: InputBorder.none,
                                      ),
                                      onChanged: (value) {
                                        pageViewValue.Search(value.toString());
                                      }),
                                ),
                              ),
                        Container(
                          //color: Colors.red,
                          height: size.height < 700
                              ? size.height / 3.45
                              : size.height < 900
                                  ? size.height / 3.25
                                  : size.height > 900 && size.height < 975
                                      ? size.height / 3
                                      : size.height / 2.85,
                          child: ListView(
                            shrinkWrap: true,
                            children: [
                              value.isExpanded == true
                                  ? AnimatedContainer(
                                      duration: Duration(milliseconds: 300),
                                      // height: MediaQuery.of(context).size.height / 4,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          color: Colors.white),
                                      width: MediaQuery.of(context).size.width -
                                          100,
                                      child: Column(
                                        children: [
                                          Container(
                                            child: PunjabiKeyboard(),
                                          )
                                        ],
                                      ),
                                    )
                                  : SizedBox(),
                              angDataList(context)
                            ],
                          ),
                        ),
                      ],
                    );
                  }),
                ],
              ),
            ],
          ),
        );
      }),
    );
  }
}
