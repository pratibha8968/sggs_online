import 'package:Sggs_Online/view_model/image_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../data/localData/sggs_handler.dart';
import '../model/sggs_model.dart';
import '../view_model/page2_view_model.dart';
import '../view_model/page3_view_model.dart';

class QuickTools extends StatefulWidget {
  const QuickTools({Key? key}) : super(key: key);

  @override
  State<QuickTools> createState() => _QuickToolsState();
}

class _QuickToolsState extends State<QuickTools> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Consumer3<Page3ViewProvider, page2viewModel, MyModel>(
          builder: (context, value, page2value, modelvalue, child) {
        return Container(
          height: size.height,
          decoration: BoxDecoration(
              image: DecorationImage(
            image: AssetImage(modelvalue.someValue),
            fit: BoxFit.cover,
          )),
          child: Stack(
            children: [
              page2value.announcementText.length == 0
                  ? page2value.line_no != 0
                      ? FutureBuilder(
                          future: SggsHandler.specificItem(context,
                              page2value.line_no.toString(), value.banisName),
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
                                        height: size.width > 1000 ? 80 : 50,
                                      ),
                                      Center(
                                        child: Text(angData[0].name ?? "",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontSize: size.width > 1000
                                                  ? page2value.bigcounter
                                                  : 12.0,
                                              fontWeight: FontWeight.w700,
                                              color: Color(0xFFF225398),
                                            )),
                                      ),
                                      SizedBox(
                                        height: size.width > 1000 ? 60 : 30,
                                      ),
                                      if (page2value.isTranslationVisible)
                                        Center(
                                          child: Text(
                                            angData[0].english ?? "",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontSize: size.width > 1000
                                                  ? page2value.bigeng
                                                  : 15,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ),
                                      SizedBox(
                                        height: size.width > 1000 ? 60 : 30,
                                      ),
                                      if (page2value.punjabiVisible)
                                        Center(
                                          child: Text(angData[0].punjabi ?? "",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                fontSize: size.width > 1000
                                                    ? page2value.bigpunj
                                                    : 15.0,
                                                fontWeight: FontWeight.w600,
                                              )),
                                        ),
                                      SizedBox(
                                        height: size.width > 1000 ? 60 : 30,
                                      ),
                                      if (page2value.romanVisible)
                                        Center(
                                          child: Text(
                                            angData[0].roman ?? "",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontSize: size.width > 1000
                                                  ? page2value.bigroman
                                                  : 15.0,
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
                    ),
              Positioned(
                child: Consumer2<Page3ViewProvider, page2viewModel>(
                    builder: (context, page3value, page2value, child) {
                  return AnimatedContainer(
                    duration: Duration(milliseconds: 00),
                    height: page2value.height,
                    //color:   Color(0xFFF800020),
                    color: Color(0xFFFe0e0e0).withOpacity(0.8),
                    //color: Colors.yellow,
                    width: 150,
                    child: Column(
                      children: [
                        Container(
                          // color:Colors.pink,
                          // color: Color(0xFFFE9F33),
                          // padding: EdgeInsets.all(1.0),
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
                          padding: EdgeInsets.only(left: 5.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Image.asset("assets/images/Rectangle1.png",
                                  scale: 1.90),
                              GestureDetector(
                                onTap: () {
                                  if (page2value.toolsExpand == false) {
                                    page2value.setQuickTools(true,
                                        MediaQuery.of(context).size.height);
                                  } else {
                                    page2value.setQuickTools(false, 30.0);
                                  }
                                },
                                child: const Padding(
                                  padding: const EdgeInsets.only(left: 10.0),
                                  child: Text(
                                    "Quick tools",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white),
                                  ),
                                ),
                              ),
                              Container(
                                child: InkWell(
                                  onTap: () {
                                    if (page2value.toolsExpand == false) {
                                      page2value.setQuickTools(true,
                                          MediaQuery.of(context).size.height);
                                    } else {
                                      page2value.setQuickTools(false, 30.0);
                                    }
                                  },
                                  child: page2value.toolsExpand == true
                                      ? Icon(
                                          Icons.arrow_drop_down,
                                          color: Colors.white,
                                        )
                                      : Icon(
                                          Icons.arrow_drop_up,
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
                                                      Icons.add_circle_outline,
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
                                                          ? Icons.visibility_off
                                                          : Icons.visibility,
                                                      size: 18,
                                                    )),
                                                IconButton(
                                                    onPressed: () {
                                                      print(page2value
                                                          .isTranslationVisible);
                                                      page2value.engDecrement();
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
                                                      Icons.add_circle_outline,
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
                                                      !page2value.punjabiVisible
                                                          ? Icons.visibility_off
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
                                                      page2value.punjabiVisible
                                                          ? page2value
                                                              .punjIncrement()
                                                          : null;
                                                      print(
                                                          "print(increment);");
                                                    },
                                                    icon: const Icon(
                                                      Icons.add_circle_outline,
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
                                                          ? Icons.visibility_off
                                                          : Icons.visibility,
                                                      size: 18,
                                                    )),
                                                IconButton(
                                                    onPressed: () {
                                                      print(page2value
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
                                                      Icons.add_circle_outline,
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
      }),
      // Consumer2<Page3ViewProvider, page2viewModel>(
      //     builder: (context, page3value, page2value, child) {
      //       return
      //         AnimatedContainer(
      //
      //           duration: Duration(milliseconds: 200),
      //           height: page2value.height,
      //           // color:   Color(0xFFF800020),
      //           color: Color(0xFFFe0e0e0).withOpacity(0.8),
      //           // color: Colors.red,
      //           width: 150,
      //           child: Column(
      //             children: [
      //               Container(
      //                 //color:Colors.pink,
      //                 color: Color(0xFFFE9F33),
      //                 padding: EdgeInsets.all(1.0),
      //                 child: Row(
      //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //                   children: [
      //                     GestureDetector(
      //                       onTap: () {
      //                         if (page2value.toolsExpand == false) {
      //                           page2value.setQuickTools(
      //                               true, MediaQuery.of(context).size.height);
      //                         } else {
      //                           page2value.setQuickTools(false, 30.0);
      //                         }
      //                       },
      //                       child: const Padding(
      //                         padding: const EdgeInsets.only(left: 30.0),
      //                         child: Text(
      //                           "Quick tools",
      //                           style: TextStyle(
      //                               fontWeight: FontWeight.w500,
      //                               color: Colors.white),
      //                         ),
      //                       ),
      //                     ),
      //                     Container(
      //                       child: InkWell(
      //                         onTap: () {
      //                           if (page2value.toolsExpand == false) {
      //                             page2value.setQuickTools(
      //                                 true, MediaQuery.of(context).size.height);
      //                           } else {
      //                             page2value.setQuickTools(false, 30.0);
      //                           }
      //                         },
      //                         child: page2value.toolsExpand == true
      //                             ? Icon(
      //                           Icons.arrow_drop_down,
      //                           color: Colors.white,
      //                         )
      //                             : Icon(
      //                           Icons.arrow_drop_up,
      //                           color: Colors.white,
      //                         ),
      //                       ),
      //                     ),
      //                   ],
      //                 ),
      //               ),
      //               page2value.toolsExpand == true
      //                   ? Expanded(
      //                 child: ListView(
      //                   children: [
      //                     SizedBox(
      //                       height: 5,
      //                     ),
      //                     Container(
      //                       width: 50,
      //                       child: SizedBox(
      //                         // fit: BoxFit.contain,
      //                         child: Column(
      //                           children: [
      //                             Text("Gurbani"),
      //                             Row(
      //                               mainAxisAlignment:
      //                               MainAxisAlignment.spaceAround,
      //                               children: [
      //                                 IconButton(
      //                                     onPressed: () {
      //                                       page2value.line_no != 0
      //                                           ? page2value.gurbanidecrement()
      //                                           : null;
      //                                     },
      //                                     icon: const Icon(
      //                                       Icons.remove_circle_outline,
      //                                       size: 18,
      //                                     )),
      //                                 IconButton(
      //                                     onPressed: () {
      //                                       page2value.line_no != 0
      //                                           ? page2value
      //                                           .gurbanincrement()
      //                                           : null;
      //                                     },
      //                                     icon: const Icon(
      //                                       Icons.add_circle_outline,
      //                                       size: 18,
      //                                     ))
      //                               ],
      //                             ),
      //                           ],
      //                         ),
      //                       ),
      //                     ),
      //                     SizedBox(
      //                       height: 15,
      //                     ),
      //                     Container(
      //                       width: 50,
      //                       child: SizedBox(
      //                         child: Column(
      //                           children: [
      //                             Text("Translations"),
      //                             Row(
      //                               mainAxisAlignment:
      //                               MainAxisAlignment.spaceAround,
      //                               children: [
      //                                 IconButton(
      //                                     onPressed: () {
      //                                       page2value.line_no != 0
      //                                           ? page2value
      //                                           .isTranslationVisible
      //                                           ? page2value
      //                                           .setTranslationVisible(
      //                                           false)
      //                                           : page2value
      //                                           .setTranslationVisible(
      //                                           true)
      //                                           : null;
      //                                     },
      //                                     icon: Icon(
      //                                       !page2value
      //                                           .isTranslationVisible
      //                                           ? Icons.visibility_off
      //                                           : Icons.visibility,
      //                                       size: 18,
      //                                     )),
      //                                 IconButton(
      //                                     onPressed: () {
      //                                       print(page2value
      //                                           .isTranslationVisible);
      //                                       page2value.engDecrement();
      //                                     },
      //                                     icon: const Icon(
      //                                       Icons.remove_circle_outline,
      //                                       size: 18,
      //                                     )),
      //                                 IconButton(
      //                                     onPressed: () {
      //                                       page2value.isTranslationVisible
      //
      //                                           ? page2value
      //                                           .engIncrement()
      //                                           : null;
      //                                       print("print(increment);");
      //                                     },
      //                                     icon: const Icon(
      //                                       Icons.add_circle_outline,
      //                                       size: 18,
      //                                     ))
      //                               ],
      //                             ),
      //                           ],
      //                         ),
      //                       ),
      //                     ),
      //                     SizedBox(
      //                       height: 15,
      //                     ),
      //                     Container(
      //                       width: 50,
      //                       child: SizedBox(
      //                         // fit: BoxFit.contain,
      //                         child: Column(
      //                           children: [
      //                             Text(" Punjabi Translations"),
      //                             Row(
      //                               mainAxisAlignment:
      //                               MainAxisAlignment.spaceAround,
      //                               children: [
      //                                 IconButton(
      //                                     onPressed: () {
      //                                       page2value.line_no != 0
      //                                           ? page2value
      //                                           .punjabiVisible
      //                                           ? page2value
      //                                           .setpunjabiVisible(
      //                                           false)
      //                                           : page2value
      //                                           .setpunjabiVisible(
      //                                           true)
      //                                           : null;
      //                                     },
      //                                     icon: Icon(
      //                                       !page2value.punjabiVisible
      //                                           ? Icons.visibility_off
      //                                           : Icons.visibility,
      //                                       size: 18,
      //                                     )),
      //                                 IconButton(
      //                                     onPressed: () {
      //                                       print(page2value
      //                                           .punjabiVisible);
      //                                       page2value.punjDecrement();
      //                                     },
      //                                     icon: const Icon(
      //                                       Icons.remove_circle_outline,
      //                                       size: 18,
      //                                     )),
      //                                 IconButton(
      //                                     onPressed: () {
      //                                       page2value.punjabiVisible
      //                                           ? page2value
      //                                           .punjIncrement()
      //                                           : null;
      //                                       print("print(increment);");
      //                                     },
      //                                     icon: const Icon(
      //                                       Icons.add_circle_outline,
      //                                       size: 18,
      //                                     ))
      //                               ],
      //                             ),
      //                           ],
      //                         ),
      //                       ),
      //                     ),
      //                     SizedBox(
      //                       height: 15,
      //                     ),
      //                     Container(
      //                       width: 50,
      //                       child: SizedBox(
      //                         // fit: BoxFit.contain,
      //                         child: Column(
      //                           children: [
      //                             Text(" Roman Translations"),
      //                             Row(
      //                               mainAxisAlignment:
      //                               MainAxisAlignment.spaceAround,
      //                               children: [
      //                                 IconButton(
      //                                     onPressed: () {
      //                                       page2value.line_no != 0
      //                                           ? page2value.romanVisible
      //                                           ? page2value
      //                                           .setromanVisible(
      //                                           false)
      //                                           : page2value
      //                                           .setromanVisible(
      //                                           true)
      //                                           : null;
      //                                     },
      //                                     icon: Icon(
      //                                       !page2value.romanVisible
      //                                           ? Icons.visibility_off
      //                                           : Icons.visibility,
      //                                       size: 18,
      //                                     )),
      //                                 IconButton(
      //                                     onPressed: () {
      //                                       print(
      //                                           page2value.romanVisible);
      //                                       page2value.romanDecrement();
      //                                     },
      //                                     icon: const Icon(
      //                                       Icons.remove_circle_outline,
      //                                       size: 18,
      //                                     )),
      //                                 IconButton(
      //                                     onPressed: () {
      //                                       page2value.romanVisible
      //                                           ? page2value
      //                                           .romanIncrement()
      //                                           : null;
      //                                       print("print(increment);");
      //                                     },
      //                                     icon: const Icon(
      //                                       Icons.add_circle_outline,
      //                                       size: 18,
      //                                     ))],
      //                             ),
      //                           ],
      //                         ),
      //                       ),
      //                     ),
      //                   ],
      //                 ),
      //               )
      //                   : SizedBox.shrink(),
      //             ],
      //           ),
      //         );
      //     }),
    );
  }
}
