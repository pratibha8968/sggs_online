import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:Sggs_Online/view_model/page2_view_model.dart';
import 'package:Sggs_Online/view_model/page_view_model.dart';

import '../utilis/keywords_data.dart';
import '../utilis/on_hover.dart';
import '../view_model/page3_view_model.dart';
import '../view_model/view_container.dart';

List viewText = [
  'Mool Mantra',
  'ਵਾਹਿਗੁਰੂ',
  'Blank',
];

class Page4 extends StatelessWidget {
  const Page4({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    TextEditingController _announcementController = TextEditingController();
    return AspectRatio(
      aspectRatio: (MediaQuery.of(context).size.width - (85)) /
          (MediaQuery.of(context).size.height - 50),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: Color(0xFFC7C7C7),
            width: 1,
          ),
          color: Color(0xfff5f5f5),
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(15),
              bottomRight: Radius.circular(15)),
        ),
        child: Consumer4<ViewContainerModel, PageViewModel, page2viewModel,
                Page3ViewProvider>(
            builder:
                (context, value, pageViewValue, page2value, page3value, child) {
          return Stack(
            children: [
              ListView(
                children: [
                  Container(
                    height: 40,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color(0xffFC8B27),
                          Color(0xffF83219),
                        ],
                      ),
                    ),

                    child: Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ...List.generate(3, (index) {
                          return GestureDetector(
                            onTap: () {
                              if (value.navItemList[index]["value"] == false) {
                                value.navItemListSelect(true, index);
                              }
                            },
                            child: Container(
                              margin: EdgeInsets.all(10),
                              child: Row(
                                children: [
                                  Icon(
                                    value.navItemList[index]["icon"],
                                    size: value.navItemList[index]["value"] ==
                                            false
                                        ? 12
                                        : 16,
                                    color: value.navItemList[index]["value"] ==
                                            false
                                        ? Colors.white.withOpacity(0.8)
                                        //Color(0xFFF9f9f9f)
                                        : Colors.white,
                                  ),
                                  Text(
                                    "${value.navItemList[index]["title"]}",
                                    style: TextStyle(
                                        color: value.navItemList[index]
                                                    ["value"] ==
                                                false
                                            ? Colors.white.withOpacity(0.8)
                                            : Colors.white,
                                        fontSize: value.navItemList[index]
                                                    ["value"] ==
                                                false
                                            ? 12
                                            : 16),
                                  ),
                                ],
                              ),
                            ),
                          );
                        })
                      ],
                    ),
                  ),
                  value.selectedCheckBox == 1
                      ? Container(
                          padding: const EdgeInsets.only(left: 8.0, top: 10),
                          height: value.whenExpanded == true
                              ? size.height / 2.6 - 120
                              : size.height / 2.6 - 50,
                          child: ListView.builder(
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            itemCount: pageViewValue.historyAngData.length,
                            itemBuilder: (context, index) {
                              return OnHoverEffect(builder: (isHovered) {
                                  return InkWell(
                                    onTap: () {
                                      // page3value.setAng(
                                      //     int.parse(pageViewValue
                                      //         .historyAngData[index].ang!),
                                      //     int.parse(pageViewValue
                                      //         .historyAngData[index].id!));
                                      // page2value.setLineNo(int.parse(
                                      //     pageViewValue.historyAngData[index].id!));
                                      // page3value.setSelectedAngData(
                                      //     pageViewValue.historyAngData![index]);
                                      // page3value.setjapji(false);
                                    },
                                    child: Container(
                                      color: isHovered? Color(0xFFFE3E26):null,
                                      child: ListTile(
                                        // hoverColor: Colors.red,
                                        leading:  Text(
                                            "${pageViewValue.historyAngData[index].id}. ",
                                            style: TextStyle(
                                              fontSize: 16,
                                              color: isHovered?Colors.white:Colors.black
                                            ),
                                            
                                          ),title: Text(
                                            "${pageViewValue.historyAngData[index].name}",
                                            style: TextStyle(
                                              fontSize: 16,
                                              color: isHovered?Colors.white:Colors.black
                                            ),
                                          ),),
                                    )
                                   
                                  );
                                }
                              );
                            },
                          ))
                      : value.selectedCheckBox == 2
                          ? Container(
                              height: value.whenExpanded == true
                                  ? size.height / 2.6 - 90
                                  : size.height / 2.6 - 50,
                              child: ListView(
                                shrinkWrap: true,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      page2value.clearLineNo(0);
                                      page2value.setAnnouncementText("");
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          top: 10.0, left: 5),
                                      child: Row(
                                        children: const [
                                          Icon(
                                            Icons.visibility_off,
                                            size: 15,
                                          ),
                                          Text(
                                            " Add Empty Slide",
                                            style: TextStyle(fontSize: 12),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      page2value
                                          .setAnnouncementText("ਵਾਹਿਗੁਰੂ");
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          top: 10.0, left: 5),
                                      child: Row(
                                        children: const [
                                          Icon(
                                            Icons.fiber_manual_record,
                                            size: 15,
                                          ),
                                          Text(
                                            " Add Waheguru Slide",
                                            style: TextStyle(fontSize: 12),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  // Row(
                                  //   children: [
                                  //     Icon(
                                  //       Icons.panorama_fish_eye,
                                  //       size: 12,
                                  //     ),
                                  //     Text(
                                  //       "Add Empty Slide",
                                  //     ),
                                  //   ],
                                  // ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Column(
                                    children: [
                                      SizedBox(
                                        width: size.width / 5.5,
                                        child: const Divider(
                                          height: 1,
                                          thickness: 1,
                                          color: Colors.black,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 3,
                                      ),
                                      SizedBox(
                                        width: size.width / 5.5,
                                        child: FittedBox(
                                          fit: BoxFit.contain,
                                          child: Row(
                                            children: const [
                                              Icon(
                                                Icons.campaign,
                                                size: 18,
                                                color: Color(0xFFF9f9f9f),
                                              ),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              Text(
                                                "ADD ANNOUNCEMENT SLIDE",
                                                style: TextStyle(
                                                  color: Color(0xFFF9f9f9f),
                                                  fontSize: 13,
                                                  fontWeight: FontWeight.bold,
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
                                        width: size.width / 5.5,
                                        child: FittedBox(
                                          fit: BoxFit.contain,
                                          child: Row(
                                            children: [
                                              const Text(
                                                "Announcement in Gurmukhi",
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.w300),
                                              ),
                                              CupertinoSwitch(
                                                  activeColor:
                                                      Color(0xff051a6e),
                                                  value: value.light,
                                                  onChanged: (val) {
                                                    _announcementController
                                                            .text.isEmpty
                                                        ? value
                                                            .setGurbaniLang(val)
                                                        : null;
                                                  }),
                                            ],
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: size.width / 4.5,
                                        child: TextFormField(
                                          controller: _announcementController,
                                          textAlignVertical:
                                              TextAlignVertical.top,
                                          decoration: InputDecoration(
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                            ),
                                            hintText:
                                                "Add announcement text here ...",
                                            hintStyle: const TextStyle(
                                                color: Color(0xFFF9f9f9f),
                                                fontSize: 12),
                                          ),
                                          onChanged: (val) {
                                            value.light == false
                                                ? _announcementController.text =
                                                    val
                                                : _announcementController.text =
                                                    KeywordsData.textSelect(
                                                        _announcementController
                                                            .text
                                                            .toUpperCase());
                                            _announcementController.selection =
                                                TextSelection.fromPosition(
                                                    TextPosition(
                                                        offset:
                                                            _announcementController
                                                                .text.length));
                                            ;
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
                                          page2value.setAnnouncementText(
                                              _announcementController.text);
                                        },
                                        child: Container(
                                          height: 40,
                                          width: 150,
                                          padding: EdgeInsets.all(2),
                                          decoration: BoxDecoration(
                                               borderRadius:
                                                BorderRadius.circular(5.0),
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xffFC8B27
                      ),
                      Color(0xffF83219),

                    ],
                  ),
                ),
                                          // decoration: BoxDecoration(
                                          //   color: Color(0xFFF225398),
                                          //   borderRadius:
                                          //       BorderRadius.circular(5.0),
                                          // ),
                                          child: const Center(
                                            child: Text(
                                              "Add Announcement",
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w400,
                                                  color: Colors.white),
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 40,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            )
                          : Container(
                              height: value.whenExpanded == true
                                  ? size.height / 2.6 - 120
                                  : size.height / 2.6 - 50,
                              child: ListView(
                                shrinkWrap: true,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 10.0, left: 5),
                                    child: Row(
                                      children: const [
                                        Icon(
                                          Icons.sync,
                                          size: 15,
                                        ),
                                        Text(
                                          " Show Random Shabad",
                                          style: TextStyle(fontSize: 12),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 10.0, left: 5),
                                    child: Row(
                                      children: const [
                                        Icon(
                                          Icons.hardware,
                                          size: 15,
                                        ),
                                        Text(
                                          " Daily Hukamnama",
                                          style: TextStyle(fontSize: 12),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                ],
              ),
              Positioned(
                  bottom: 0,
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 300),
                    height: value.height,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.white),
                    width: MediaQuery.of(context).size.width / 2.25,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () {
                            pageViewValue.clearHistory();
                          },
                          child: Container(
                              width: 155,
                              color: Color(0xFF494d4a),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.history,
                                    color: Colors.white,
                                  ),
                                  Text(
                                    " Clear History",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  SizedBox(
                                    width: 40,
                                  )
                                ],
                              )),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            border: Border(
                                top: BorderSide(
                                    width: 1, color: Colors.black38)),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                color: Color(0xFF494d4a),
                                child: InkWell(
                                  onTap: () {
                                    if (value.whenExpanded == false) {
                                      value.setExpanded(true, 120);
                                    } else {
                                      value.setExpanded(false, 50.0);
                                    }
                                  },
                                  child: value.whenExpanded == true
                                      ? Icon(
                                          Icons.keyboard_arrow_down_rounded,
                                          color: Colors.white,
                                        )
                                      : Icon(
                                          Icons.keyboard_arrow_up,
                                          color: Colors.white,
                                        ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        value.whenExpanded == true
                            ? Expanded(
                                child: Container(
                                  margin: const EdgeInsets.only(
                                      left: 30, right: 30, top: 20),
                                  child: ListView(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          for (var i in viewText)
                                            GestureDetector(
                                              onTap: () {
                                                page2value
                                                    .setAnnouncementText("");
                                                i.toString() == "Blank"
                                                    ? page2value.clearLineNo(0)
                                                    : page2value.setAnnouncementText(i
                                                                .toString() ==
                                                            "Mool Mantra"
                                                        ? "ੴ ਸਤਿ ਨਾਮੁ ਕਰਤਾ ਪੁਰਖੁ ਨਿਰਭਉ ਨਿਰਵੈਰੁ ਅਕਾਲ ਮੂਰਤਿ ਅਜੂਨੀ ਸੈਭੰ ਗੁਰ ਪ੍ਰਸਾਦਿ ॥"
                                                        : i.toString());
                                              },
                                              child: Container(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 10, right: 10),
                                                  // margin: EdgeInsets.only(r10),
                                                  height: 50,
                                                  decoration: BoxDecoration(
                                                    gradient: LinearGradient(
                                                      begin:
                                                          Alignment.topCenter,
                                                      end: Alignment
                                                          .bottomCenter,
                                                      colors: [
                                                        Color(0xffFC8B27),
                                                        Color(0xffF83219),
                                                      ],
                                                    ),
                                                  ),
                                                  child: Center(
                                                      child: Text(
                                                    i.toString(),
                                                    style: TextStyle(
                                                        color: Colors.white),
                                                  ))),
                                            )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              )
                            : SizedBox.shrink(),
                      ],
                    ),
                  ))
            ],
          );
        }),
      ),
    );
  }
}
