

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:Sggs_Online/data/localData/sggs_handler.dart';
import 'package:Sggs_Online/model/sggs_model.dart';
import 'package:Sggs_Online/view_model/page2_view_model.dart';
import 'package:Sggs_Online/view_model/page3_view_model.dart';

import '../view_model/image_model.dart';

class Page2 extends StatelessWidget {
  Page2({super.key});
  String dropdownvalue = 'Item 1';
  var items = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return
      Consumer<MyModel>(
        builder: (context, value, child) {
          return Container(
            decoration: BoxDecoration(

              image: DecorationImage(
                image: AssetImage(value.someValue), fit: BoxFit.cover,
              ),

              border: Border.all(
                color: Color(0xFFFE3E26),
                width: 2.5,
              ),
              color: Colors.white,
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(15.0),bottomLeft: Radius.circular(15.0)
               
                
              ),
            ),
            child: Stack(
              children: [
                Consumer2<Page3ViewProvider, page2viewModel>(
                  builder: (context, value, page2value, child) {
                    return page2value.announcementText.length == 0
                        ? page2value.line_no != 0
                        ? FutureBuilder(
                      future: SggsHandler.specificItem(
                          context, page2value.line_no.toString(),value.banisName),
                      builder: (context, AsyncSnapshot snapshot) {
                        List<AngData>? angData = snapshot.data;
                        if (angData == null) {
                          return Container();
                        }
                        return Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: SingleChildScrollView(
                            child: Container(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment:
                                CrossAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    height: size.width > 1000 ? 20 : 10,
                                  ),
                                  Center(
                                    child: Text(angData[0].name ?? "",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: size.width > 1000
                                              ? page2value.counter : 12.0,
                                          fontWeight: FontWeight.w700,
                                          color: Color(0xFFF225398),
                                        )
                                    ),
                                  ),
                                  SizedBox(
                                    height: size.width > 1000 ? 35 : 20,
                                  ),
                                  if (page2value.isTranslationVisible)
                                    Center(
                                      child: Text(
                                        angData[0].english ?? "",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: size.width > 1000
                                              ? page2value.engcounter
                                              : 10,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                  SizedBox(
                                    height: size.width > 1000 ? 35 : 25,
                                  ),
                                  if (page2value.punjabiVisible)
                                    Center(
                                      child: Text(angData[0].punjabi ?? "",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontSize: size.width > 1000
                                                ? page2value.punjabicounter
                                                : 10.0,
                                            fontWeight: FontWeight.w600,
                                          )),
                                    ),
                                  SizedBox(
                                    height: size.width > 1000 ? 35 : 25,
                                  ),
                                  if (page2value.romanVisible)
                                    Center(
                                      child: Text(
                                        angData[0].roman ?? "",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: size.width > 1000
                                              ? page2value.romancounter
                                              : 10.0,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    )
                        : Container()
                        : Center(
                      child: Text(
                        page2value.announcementText,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFFF225398),
                        ),
                      ),
                    );
                  },
                ),
                Positioned(
                  child:
                  Consumer2<Page3ViewProvider, page2viewModel>(
                      builder: (context, page3value, page2value, child) {
                        return
                          AnimatedContainer(
                            duration: Duration(milliseconds: 00),
                            height: page2value.height,
                            // color:   Color(0xFFF800020),
                            color: Color(0xFFFe0e0e0).withOpacity(0.8),
                            // color: Colors.red,
                            width: 150,
                            child: Column(
                              children: [
                                Container(


                                  decoration:BoxDecoration(
                                    // borderRadius: BorderRadius.circular(
                                    //   5.0,
                                    // ),
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
                                  padding: EdgeInsets.only(left:1.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment
                                        .spaceAround,
                                    children: [

                                      Image.asset("assets/images/Rectangle1.png",scale: 1.90),
                                      GestureDetector(
                                        onTap: () {
                                          if (page2value.toolsExpand == false) {
                                            page2value.setQuickTools(
                                                true, MediaQuery
                                                .of(context)
                                                .size
                                                .height);
                                          } else {
                                            page2value.setQuickTools(
                                                false, 30.0);
                                          }
                                        },
                                        child:  Text(
                                          "Quick tools",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              color: Colors.white
                                          ),
                                        ),
                                      ),
                                      Container(
                                        child: InkWell(
                                          onTap: () {
                                            if (page2value.toolsExpand ==
                                                false) {
                                              page2value.setQuickTools(
                                                  true, MediaQuery
                                                  .of(context)
                                                  .size
                                                  .height);
                                            } else {
                                              page2value.setQuickTools(
                                                  false,25);
                                            }
                                          },
                                          child: page2value.toolsExpand == true
                                              ? Icon(
                                            Icons.keyboard_arrow_down_outlined,
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
                                page2value.toolsExpand == true
                                    ? Expanded(
                                  child: ListView(
                                    children: [
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Container(
                                        width: 50,
                                        child: SizedBox(
                                          // fit: BoxFit.contain,
                                          child: Column(
                                            children: [
                                              Text("Gurbani"),
                                              Row(
                                                mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                                children: [
                                                  IconButton(
                                                      onPressed: () {
                                                        page2value.line_no != 0
                                                            ? page2value
                                                            .gurbanidecrement()
                                                            : null;
                                                      },
                                                      icon: const Icon(
                                                        Icons
                                                            .remove_circle_outline,
                                                        size: 18,
                                                      )),
                                                  IconButton(
                                                      onPressed: () {
                                                        page2value.line_no != 0
                                                            ? page2value
                                                            .gurbanincrement()
                                                            : null;
                                                      },
                                                      icon: const Icon(
                                                        Icons
                                                            .add_circle_outline,
                                                        size: 18,
                                                      ))
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      Container(
                                        width: 50,
                                        child: SizedBox(
                                          child: Column(
                                            children: [
                                              Text("Translations"),
                                              Row(
                                                mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                                children: [
                                                  IconButton(
                                                      onPressed: () {
                                                        page2value.line_no != 0
                                                            ? page2value
                                                            .isTranslationVisible
                                                            ? page2value
                                                            .setTranslationVisible(
                                                            false)
                                                            : page2value
                                                            .setTranslationVisible(
                                                            true)
                                                            : null;
                                                      },
                                                      icon: Icon(
                                                        !page2value
                                                            .isTranslationVisible
                                                            ? Icons
                                                            .visibility_off
                                                            : Icons.visibility,
                                                        size: 18,
                                                      )),
                                                  IconButton(
                                                      onPressed: () {
                                                        print(page2value
                                                            .isTranslationVisible);
                                                        page2value
                                                            .engDecrement();
                                                      },
                                                      icon: const Icon(
                                                        Icons
                                                            .remove_circle_outline,
                                                        size: 18,
                                                      )),
                                                  IconButton(
                                                      onPressed: () {
                                                        page2value
                                                            .isTranslationVisible

                                                            ? page2value
                                                            .engIncrement()
                                                            : null;
                                                        print(
                                                            "print(increment);");
                                                      },
                                                      icon: const Icon(
                                                        Icons
                                                            .add_circle_outline,
                                                        size: 18,
                                                      ))
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      Container(
                                        width: 50,
                                        child: SizedBox(
                                          // fit: BoxFit.contain,
                                          child: Column(
                                            children: [
                                              Text(" Punjabi Translations"),
                                              Row(
                                                mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                                children: [
                                                  IconButton(
                                                      onPressed: () {
                                                        page2value.line_no != 0
                                                            ? page2value
                                                            .punjabiVisible
                                                            ? page2value
                                                            .setpunjabiVisible(
                                                            false)
                                                            : page2value
                                                            .setpunjabiVisible(
                                                            true)
                                                            : null;
                                                      },
                                                      icon: Icon(
                                                        !page2value
                                                            .punjabiVisible
                                                            ? Icons
                                                            .visibility_off
                                                            : Icons.visibility,
                                                        size: 18,
                                                      )),
                                                  IconButton(
                                                      onPressed: () {
                                                        print(page2value
                                                            .punjabiVisible);
                                                        page2value
                                                            .punjDecrement();
                                                      },
                                                      icon: const Icon(
                                                        Icons
                                                            .remove_circle_outline,
                                                        size: 18,
                                                      )),
                                                  IconButton(
                                                      onPressed: () {
                                                        page2value
                                                            .punjabiVisible
                                                            ? page2value
                                                            .punjIncrement()
                                                            : null;
                                                        print(
                                                            "print(increment);");
                                                      },
                                                      icon: const Icon(
                                                        Icons
                                                            .add_circle_outline,
                                                        size: 18,
                                                      ))
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      Container(
                                        width: 50,
                                        child: SizedBox(
                                          // fit: BoxFit.contain,
                                          child: Column(
                                            children: [
                                              Text(" Roman Translations"),
                                              Row(
                                                mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                                children: [
                                                  IconButton(
                                                      onPressed: () {
                                                        page2value.line_no != 0
                                                            ? page2value
                                                            .romanVisible
                                                            ? page2value
                                                            .setromanVisible(
                                                            false)
                                                            : page2value
                                                            .setromanVisible(
                                                            true)
                                                            : null;
                                                      },
                                                      icon: Icon(
                                                        !page2value.romanVisible
                                                            ? Icons
                                                            .visibility_off
                                                            : Icons.visibility,
                                                        size: 18,
                                                      )),
                                                  IconButton(
                                                      onPressed: () {
                                                        print(
                                                            page2value
                                                                .romanVisible);
                                                        page2value
                                                            .romanDecrement();
                                                      },
                                                      icon: const Icon(
                                                        Icons
                                                            .remove_circle_outline,
                                                        size: 18,
                                                      )),
                                                  IconButton(
                                                      onPressed: () {
                                                        page2value.romanVisible
                                                            ? page2value
                                                            .romanIncrement()
                                                            : null;
                                                        print(
                                                            "print(increment);");
                                                      },
                                                      icon: const Icon(
                                                        Icons
                                                            .add_circle_outline,
                                                        size: 18,
                                                      ))
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                                    : SizedBox.shrink(),
                              ],
                            ),
                          );
                      }),
                  // QuickTools()


                ),
              ],
            ),
          );

        }
      );
  }
}
