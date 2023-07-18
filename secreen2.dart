import 'dart:ui';

import 'package:Sggs_Online/view/page2.dart';
import 'package:Sggs_Online/view/quick_tools.dart';
import 'package:async/async.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:Sggs_Online/view/page1.dart';
import 'package:Sggs_Online/view/page3.dart';
import 'package:Sggs_Online/view_model/books_model2.dart';
import '../data/localData/sggs_handler.dart';
import '../model/sggs_model.dart';
import '../view_model/page2_view_model.dart';
import '../view_model/page3_view_model.dart';
import '../view_model/page_view_model.dart';
import '../view_model/single_model.dart';
import 'bottom_page.dart';

class Screen2 extends StatefulWidget {
  const Screen2({Key? key}) : super(key: key);

  @override
  State<Screen2> createState() => _Screen2State();
}

class _Screen2State extends State<Screen2> {
  final String fristName = "Search";
  final String secondName = "History";
  final String thirdName = "Shabad";
  final String fourthName = "Insert";
  final String lastName = "Others";
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    TextEditingController _announcementController = TextEditingController();
    return Scaffold(
      body: Consumer4<ViewSingleModel, PageViewModel, page2viewModel,
          NewbooksModel>(
        builder: (context, value, pageVal, pageviewVal, newBooksvalue, child) {
          return Stack(fit: StackFit.expand, children: [
            //BottomPage(),
            QuickTools(),
            Positioned(
              bottom: 0,
              right: 0,
              child: Column(
                children: [
                  Container(
                    height: 40,
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
                    width: MediaQuery.of(context).size.width / 2.2,
                    padding: EdgeInsets.all(5.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "${value.selectedText == 1 ? fristName : value.selectedText == 2 ? secondName : value.selectedText == 3 ? thirdName : value.selectedText == 4 ? fourthName : lastName}",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            if (value.displayexpand == false) {
                              value.setDisplay(true, 400);
                              newBooksvalue.setSidebarAvailable(true);
                            } else {
                              value.setDisplay(false, 50.0);
                              newBooksvalue.setSidebarAvailable(false);
                            }
                          },
                          child: value.displayexpand == false
                              ? Icon(
                                  Icons.laptop,
                                  color: Colors.white,
                                )
                              : Icon(
                                  Icons.remove,
                                  color: Colors.white,
                                ),
                        ),
                      ],
                    ),
                  ),
                  value.displayexpand == true
                      ? Column(
                          children: [
                            Container(
                              color: Colors.white,
                              //color: Colors.blue,
                              //color: Color(0xFFFE9F33),
                              height: MediaQuery.of(context).size.height / 2.25,
                              width: MediaQuery.of(context).size.width / 2.2,
                              child: value.selectedText == 1
                                  ? BottomPage()
                                  // Page1()
                                  : value.selectedText == 2
                                      ? Container(
                                          padding: EdgeInsets.only(
                                              left: 8.0, top: 10),
                                          child: ListView.builder(
                                            scrollDirection: Axis.vertical,
                                            shrinkWrap: true,
                                            itemCount:
                                                pageVal.historyAngData.length,
                                            itemBuilder: (context, index) {
                                              return Text(
                                                  "${pageVal.historyAngData[index].name}");
                                            },
                                          ))
                                      : value.selectedText == 3
                                          ? Page3()
                                          : value.selectedText == 4
                                              ? Container(
                                                  child: ListView(
                                                    shrinkWrap: true,
                                                    children: [
                                                      GestureDetector(
                                                        onTap: () {
                                                          pageviewVal
                                                              .clearLineNo(0);
                                                          pageviewVal
                                                              .setAnnouncementText(
                                                                  "");
                                                        },
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  top: 10.0,
                                                                  left: 5),
                                                          child: Row(
                                                            children: const [
                                                              Icon(
                                                                Icons
                                                                    .visibility_off,
                                                                size: 15,
                                                              ),
                                                              Text(
                                                                " Add Empty Slide",
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        12),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                      GestureDetector(
                                                        onTap: () {
                                                          pageviewVal
                                                              .setAnnouncementText(
                                                                  "ਵਾਹਿਗੁਰੂ");
                                                        },
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  top: 10.0,
                                                                  left: 5),
                                                          child: Row(
                                                            children: const [
                                                              Icon(
                                                                Icons
                                                                    .fiber_manual_record,
                                                                size: 15,
                                                              ),
                                                              Text(
                                                                " Add Waheguru Slide",
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        12),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                        height: 20,
                                                      ),
                                                      Column(
                                                        children: [
                                                          SizedBox(
                                                            width: size.width /
                                                                5.5,
                                                            child:
                                                                const Divider(
                                                              height: 1,
                                                              thickness: 1,
                                                              color:
                                                                  Colors.black,
                                                            ),
                                                          ),
                                                          const SizedBox(
                                                            height: 3,
                                                          ),
                                                          SizedBox(
                                                            width: size.width /
                                                                5.5,
                                                            child: FittedBox(
                                                              fit: BoxFit
                                                                  .contain,
                                                              child: Row(
                                                                children: const [
                                                                  Icon(
                                                                    Icons
                                                                        .campaign,
                                                                    size: 18,
                                                                    color: Color(
                                                                        0xFFF9f9f9f),
                                                                  ),
                                                                  SizedBox(
                                                                    width: 5,
                                                                  ),
                                                                  Text(
                                                                    "ADD ANNOUNCEMENT SLIDE",
                                                                    style:
                                                                        TextStyle(
                                                                      color: Color(
                                                                          0xFFF9f9f9f),
                                                                      fontSize:
                                                                          13,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                          const SizedBox(
                                                            height: 5,
                                                          ),
                                                          SizedBox(
                                                            width: size.width /
                                                                5.5,
                                                            child: FittedBox(
                                                              fit: BoxFit
                                                                  .contain,
                                                              child: Row(
                                                                children: [
                                                                  const Text(
                                                                    "Announcement in Gurmukhi",
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .black,
                                                                        fontSize:
                                                                            16,
                                                                        fontWeight:
                                                                            FontWeight.w300),
                                                                  ),
                                                                  CupertinoSwitch(
                                                                      activeColor:
                                                                          Color(
                                                                              0xff051a6e),
                                                                      value: value
                                                                          .light,
                                                                      onChanged:
                                                                          (val) {
                                                                        value.setGurbaniLang(
                                                                            val);
                                                                      }),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            width: size.width /
                                                                4.5,
                                                            child:
                                                                TextFormField(
                                                              textAlignVertical:
                                                                  TextAlignVertical
                                                                      .top,
                                                              decoration:
                                                                  InputDecoration(
                                                                border:
                                                                    OutlineInputBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              10.0),
                                                                ),
                                                                hintText:
                                                                    "Add announcement text here ...",
                                                                hintStyle: const TextStyle(
                                                                    color: Color(
                                                                        0xFFF9f9f9f),
                                                                    fontSize:
                                                                        12),
                                                              ),
                                                              onChanged:
                                                                  (value) {
                                                                _announcementController
                                                                        .text =
                                                                    value;
                                                              },
                                                              maxLines: 4,
                                                              // expands: true,
                                                            ),
                                                          ),
                                                          const SizedBox(
                                                            height: 10,
                                                          ),
                                                          GestureDetector(
                                                            onTap: () {
                                                              pageviewVal
                                                                  .setAnnouncementText(
                                                                      _announcementController
                                                                          .text);
                                                            },
                                                            child: Container(
                                                              height: 40,
                                                              width: 150,
                                                              padding:
                                                                  EdgeInsets
                                                                      .all(2),
                                                              decoration:
                                                                  BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            5.0),
                                                                gradient:
                                                                    LinearGradient(
                                                                  begin: Alignment
                                                                      .topCenter,
                                                                  end: Alignment
                                                                      .bottomCenter,
                                                                  colors: [
                                                                    Color(
                                                                        0xffFC8B27),
                                                                    Color(
                                                                        0xffF83219),
                                                                  ],
                                                                ),
                                                              ),
                                                              child:
                                                                  const Center(
                                                                child: Text(
                                                                  "Add Announcement",
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          12,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w400,
                                                                      color: Colors
                                                                          .white),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                )
                                              : Container(
                                                  child: ListView(
                                                    shrinkWrap: true,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .only(
                                                                top: 10.0,
                                                                left: 5),
                                                        child: Row(
                                                          children: const [
                                                            Icon(
                                                              Icons.sync,
                                                              size: 15,
                                                            ),
                                                            Text(
                                                              " Show Random Shabad",
                                                              style: TextStyle(
                                                                  fontSize: 12),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .only(
                                                                top: 10.0,
                                                                left: 5),
                                                        child: Row(
                                                          children: const [
                                                            Icon(
                                                              Icons.hardware,
                                                              size: 15,
                                                            ),
                                                            Text(
                                                              " Daily Hukamnama",
                                                              style: TextStyle(
                                                                  fontSize: 12),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                            ),
                            Container(
                              height: 40,
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
                              width: MediaQuery.of(context).size.width / 2.2,
                              child: Row(
                                children: [
                                  ...List.generate(5, (index) {
                                    return GestureDetector(
                                      onTap: () {
                                        if (value.singleItemList[index]
                                                ["value"] ==
                                            false) {
                                          value.displayListSelect(true, index);
                                        }
                                      },
                                      child: Container(
                                        width: 30,

                                        // color: Colors.green,
                                        margin: EdgeInsets.all(10.0),
                                        child: Row(
                                          children: [
                                            Icon(
                                              value.singleItemList[index]
                                                  ["icon"],
                                              size: value.singleItemList[index]
                                                          ["value"] ==
                                                      false
                                                  ? 15
                                                  : 25,
                                              color: value.singleItemList[index]
                                                          ["value"] ==
                                                      false
                                                  ? Colors.white
                                                      .withOpacity(0.7)
                                                  //Color(0xFFF9f9f9f)
                                                  : Colors.white,
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  })
                                ],
                              ),
                            )
                          ],
                        )
                      : SizedBox.shrink()
                ],
              ),
            ),
          ]);
        },
      ),
    );
  }
}
