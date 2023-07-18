import 'dart:ui';
import 'package:Sggs_Online/view_model/page_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:Sggs_Online/view/screen1.dart';
import 'package:Sggs_Online/view/secreen2.dart';
import '../data/localData/all_banis_handler.dart';
import '../data/localData/sggs_handler.dart';
import '../model/all_banis_model.dart';
import '../model/sggs_model.dart';
import '../utilis/commonList.dart';
import '../view_model/books_model.dart';
import '../view_model/books_model2.dart';
import '../view_model/image_model.dart';
import '../view_model/page2_view_model.dart';
import '../view_model/page3_view_model.dart';
import 'settings_layout.dart';

class HomeScreen extends StatefulWidget {
  static int tappedGestureDetector = 1;

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  bool lights = true;

  TabController? _tabController;

  // List nitnembanistext = [
  //   ' ਜਪੁਜੀ ਸਾਹਿਬ',
  //   ' ਜਾਪ ਸਾਹਿਬ',
  //   ' ਤ੍ਵ ਪ੍ਰਸਾਦਿ ਸਵੱਯੇ (ਸ੍ਰਾਵਗ ਸੁੱਧ)',
  //   ' ਬੇਨਤੀ ਚੌਪਈ ਸਾਹਿਬ',
  //   ' ਆਨੰਦ ਸਾਹਿਬ',
  //   ' ਰਹਿਰਾਸ ਸਾਹਿਬ',
  //   ' ਸੋਹਿਲਾ ਸਾਹਿਬ',
  // ];

  // List sundergutka = [
  //   'ਜਪੁਜੀ ਸਾਹਿਬ',
  //   'ਜਾਪ ਸਾਹਿਬ',
  //   'ਤ੍ਵ ਪ੍ਰਸਾਦਿ ਸਵੱਯੇ (ਸ੍ਰਾਵਗ ਸੁੱਧ)',
  //   'ਬੇਨਤੀ ਚੌਪਈ ਸਾਹਿਬ',
  //   'ਆਨੰਦ ਸਾਹਿਬ',
  //   'ਰਹਿਰਾਸ ਸਾਹਿਬ',
  //   'ਸੋਹਿਲਾ ਸਾਹਿਬ',
  //   'ਆਰਤੀ',
  //   'ਸਲੋਕ ਮਹਲਾ ੯',
  //   'ਸੁਖਮਨੀ ਸਾਹਿਬ',
  //   'ਆਸਾ ਦੀ ਵਾਰ',
  // ];
  // List popularbanis = [
  //   ' ਆਰਤੀ',
  //   ' ਸਲੋਕ ਮਹਲਾ ੯',
  //   ' ਸੁਖਮਨੀ ਸਾਹਿਬ',
  //   ' ਆਸਾ ਦੀ ਵਾਰ',
  // ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    print("height ${size.height}");
    return Scaffold(
      body: Stack(fit: StackFit.expand, children: <Widget>[
        Consumer3<NewbooksModel, CustombooksModel, MyModel>(
            builder: (context, newBooks, value, modelvalue, child) {
          return ConstrainedBox(
            constraints: BoxConstraints.expand(),
            child: Container(
              //color: Colors.red,
              color: Colors.white,
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Row(
                children: [
                  newBooks.isSidebarAvailable == true
                      ? Container(
                          width: 100,
                          height: size.height,
                          decoration: BoxDecoration(
                            border: Border(
                              right: BorderSide(
                                color: Color(0xffF83219).withOpacity(0.5),
                                width: 1,
                              ),
                            ),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            // mainAxisSize: MainAxisSize.,
                            children: [
                              Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: CircleAvatar(
                                      radius: 55,
                                      backgroundColor: Color(0xffF83219),
                                      child: CircleAvatar(
                                          radius: 40,
                                          backgroundColor: Colors.white,
                                          child: Image.asset(
                                              "assets/images/sggslogo.png")),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      if (value.sidebarExpand == false) {
                                        newBooks.booksExpand == true
                                            ? newBooks.setbooksExpanded(false)
                                            : value.settingExpand == true
                                                ? value.settingExpanded(false)
                                                : null;
                                        value.setExpanded(true);
                                      } else {
                                        value.setExpanded(false);
                                      }
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Color(0xffF83219),
                                              width: 2),
                                          borderRadius:
                                              BorderRadius.circular(30.0),
                                          color: Colors.white),
                                      width: 75,
                                      height: 100,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Image.asset(
                                            "assets/images/book.png",
                                            scale: 4.0,
                                          ),
                                          Image.asset(
                                              "assets/images/sundrgutka.png"),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 8.0),
                                  GestureDetector(
                                    onTap: () {
                                      if (newBooks.booksExpand == false) {
                                        value.sidebarExpand == true
                                            ? value.setExpanded(false)
                                            : value.settingExpand == true
                                                ? value.settingExpanded(false)
                                                : null;
                                        newBooks.setbooksExpanded(true);
                                      } else {
                                        newBooks.setbooksExpanded(false);
                                      }
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.white,
                                        // borderRadius: BorderRadius.circular(50.0),
                                        image: DecorationImage(
                                            image: AssetImage(
                                                "assets/images/img.png"),
                                            fit: BoxFit.cover),
                                      ),
                                      width: 85,
                                      height: 100,
                                    ),
                                  ),
                                ],
                              ),
                              //SizedBox(height: 5.0),

                              // SizedBox(height: 220,),
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: GestureDetector(
                                  onTap: () {
                                    if (value.settingExpand == false) {
                                      newBooks.booksExpand == true
                                          ? newBooks.setbooksExpanded(false)
                                          : value.sidebarExpand
                                              ? value.setExpanded(false)
                                              : null;
                                      value.settingExpanded(true);
                                    } else {
                                      value.settingExpanded(false);
                                    }
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        shape: BoxShape.circle),
                                    width: 75,
                                    height: 100,
                                    child: Icon(
                                      Icons.settings,
                                      size: 65,
                                      color: Color(0xff82807f),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      : Container(),
                  newBooks.isSidebarAvailable == true &&
                          newBooks.booksExpand != true &&
                          value.sidebarExpand != true &&
                          value.settingExpand != true &&
                          newBooks.tabIndexValue == 0
                      ? SizedBox(width: 10)
                      : Container(),
                  Stack(
                    children: [
                      Container(
                          //color: Color(0XFF212120),
                          height: MediaQuery.of(context).size.height,
                          width: newBooks.isSidebarAvailable == true
                              ? size.width - 120
                              : size.width,
                          child: infoCard(context)),
                      value.sidebarExpand == true
                          ? Positioned(
                              left: 0,
                              child: Container(
                                  height: MediaQuery.of(context).size.height,
                                  width:
                                      MediaQuery.of(context).size.width - 120,
                                  color: Colors.black45.withOpacity(0.7),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Consumer3<
                                                  Page3ViewProvider,
                                                  page2viewModel,
                                                  PageViewModel>(
                                              builder: (context, page3value,
                                                  page2value, pageview, child) {
                                            return Container(
                                              width: size.width / 4.5,
                                              height: size.height,
                                              margin: EdgeInsets.only(
                                                  right: 20.0,
                                                  left: 20,
                                                  top: 20),
                                              color: Colors.white,
                                              child: Column(
                                                children: [
                                                  Container(
                                                    // padding: EdgeInsets.only(right: 10.0, left: 10),
                                                    height: 40,
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
                                                    //color: Color(0xFFFE9F33),
                                                    child: const Center(
                                                      child: Text(
                                                        "Sundar Gutka",
                                                        textAlign:
                                                            TextAlign.start,
                                                        style: TextStyle(
                                                          fontSize: 20,
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Container(
                                                    height: size.height - 60,
                                                    child: ListView(
                                                      // shrinkWrap: false,
                                                      // physics:
                                                      //     NeverScrollableScrollPhysics(),
                                                      children: [
                                                        FutureBuilder(
                                                          future:
                                                              AllBanisHandler
                                                                  .AllBanis(
                                                                      context),
                                                          builder: (context,
                                                              AsyncSnapshot
                                                                  snapshot) {
                                                            List<Allbanis>?
                                                                banisdata;
                                                            banisdata =
                                                                snapshot.data;
                                                            print(
                                                                "allBanis>>>>>>${banisdata?.length}");
                                                            if (!snapshot
                                                                .hasData) {
                                                              return Container();
                                                            }
                                                            return Column(
                                                              //shrinkWrap: false,
                                                              children: [
                                                                ...List
                                                                    .generate(
                                                                  banisdata!
                                                                      .length,
                                                                  (index) =>
                                                                      ListTile(
                                                                    title:
                                                                        GestureDetector(
                                                                      onTap:
                                                                          () async {
                                                                        page3value.setAng(
                                                                            0,
                                                                            1);
                                                                        page2value
                                                                            .setLineNo(1);
                                                                        page3value.setBanisName(banisdata![index].token ??
                                                                            "");
                                                                        print(
                                                                            "page3value-- ${page3value.banisName}");
                                                                        if (value.sidebarExpand ==
                                                                            false) {
                                                                          newBooks.booksExpand == true
                                                                              ? newBooks.setbooksExpanded(false)
                                                                              : null;
                                                                          value.setExpanded(
                                                                              true);
                                                                        } else {
                                                                          value.setExpanded(
                                                                              false);
                                                                        }
                                                                        // if(index == 0){
                                                                        //   List<Allbanis> alllocalBanis = await AllBanisHandler.AllBanis(context);
                                                                        //   print("allocalBanis...${alllocalBanis}");
                                                                        // }
                                                                      },
                                                                      child:
                                                                          Row(
                                                                        children: [
                                                                          if (index ==
                                                                              0)
                                                                            Container(
                                                                              width: 15,
                                                                              height: 15,
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
                                                                            ),
                                                                          SizedBox(
                                                                            width:
                                                                                10,
                                                                          ),
                                                                          Expanded(
                                                                            child:
                                                                                Text(
                                                                              "${index + 1}",
                                                                            ),
                                                                          ),
                                                                          Expanded(
                                                                            child:
                                                                                Text(
                                                                              banisdata![index].nameUni.toString(),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ),
                                                                )
                                                              ],
                                                            );
                                                          },
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            );
                                          }),
                                          Consumer3<
                                                  Page3ViewProvider,
                                                  page2viewModel,
                                                  PageViewModel>(
                                              builder: (context, page3value,
                                                  page2value, pageview, child) {
                                            return FutureBuilder(
                                                future:
                                                    SggsHandler.getJapjiSaheb(
                                                  context,
                                                ),
                                                builder: (context,
                                                    AsyncSnapshot snapshot) {
                                              List<AngData>? angData;
                                              angData = snapshot.data;
                                              //print("angData....${angData}");
                                              return Container(
                                                height: MediaQuery.of(context)
                                                    .size
                                                    .height,
                                                width: size.width < 1000
                                                    ? size.width / 2.5
                                                    : size.width / 3.5,
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    const SizedBox(
                                                      height: 30,
                                                    ),
                                                    const Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: Text(
                                                        "Nitnem Banis",
                                                        style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 18,
                                                        ),
                                                      ),
                                                    ),
                                                    GridView.builder(
                                                        shrinkWrap: true,
                                                        itemCount: CommonList
                                                            .nitnemBanisList
                                                            .length,
                                                        gridDelegate:
                                                            SliverGridDelegateWithFixedCrossAxisCount(
                                                          childAspectRatio:
                                                              (size.width -
                                                                      300) /
                                                                  (size.height -
                                                                      300),
                                                          crossAxisCount: 3,
                                                          crossAxisSpacing: 5,
                                                          mainAxisSpacing: 5,
                                                        ),
                                                        itemBuilder:
                                                            (BuildContext
                                                                    context,
                                                                int index) {
                                                          return GestureDetector(
                                                            onTap: () async {
                                                              page3value.setAng(
                                                                  0, 1);
                                                              page2value
                                                                  .setLineNo(1);
                                                              page3value.setBanisName(
                                                                  CommonList.nitnemBanisList[
                                                                          index]
                                                                      [
                                                                      "token"]);
                                                              print(
                                                                  "page3value-- ${page3value.banisName}");
                                                              if (value
                                                                      .sidebarExpand ==
                                                                  false) {
                                                                newBooks.booksExpand ==
                                                                        true
                                                                    ? newBooks
                                                                        .setbooksExpanded(
                                                                            false)
                                                                    : null;
                                                                value
                                                                    .setExpanded(
                                                                        true);
                                                              } else {
                                                                value
                                                                    .setExpanded(
                                                                        false);
                                                              }
                                                            },
                                                            child: Container(
                                                              decoration:
                                                                  BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
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
                                                              child: Center(
                                                                  child: Text(
                                                                CommonList.nitnemBanisList[
                                                                        index]
                                                                    ["nameUni"],
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .black),
                                                              )),
                                                            ),
                                                          );
                                                        }),
                                                    const Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: Text(
                                                        "Popular  Banis",
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 18),
                                                      ),
                                                    ),
                                                    GridView.builder(
                                                        shrinkWrap: true,
                                                        itemCount: CommonList
                                                            .popularbanisList
                                                            .length,
                                                        gridDelegate:
                                                            SliverGridDelegateWithFixedCrossAxisCount(
                                                          childAspectRatio:
                                                              (size.width -
                                                                      300) /
                                                                  (size.height -
                                                                      300),
                                                          crossAxisCount: 3,
                                                          crossAxisSpacing: 5,
                                                          mainAxisSpacing: 5,
                                                        ),
                                                        //   childAspectRatio: width / (height / 4)),
                                                        itemBuilder:
                                                            (BuildContext
                                                                    context,
                                                                int index) {
                                                          return GestureDetector(
                                                            onTap: () async {
                                                              page3value.setAng(
                                                                  0, 1);
                                                              page2value
                                                                  .setLineNo(1);
                                                              page3value.setBanisName(
                                                                  CommonList.popularbanisList[
                                                                          index]
                                                                      [
                                                                      "token"]);
                                                              print(
                                                                  "page3value-- ${page3value.banisName}");
                                                              if (value
                                                                      .sidebarExpand ==
                                                                  false) {
                                                                newBooks.booksExpand ==
                                                                        true
                                                                    ? newBooks
                                                                        .setbooksExpanded(
                                                                            false)
                                                                    : null;
                                                                value
                                                                    .setExpanded(
                                                                        true);
                                                              } else {
                                                                value
                                                                    .setExpanded(
                                                                        false);
                                                              }
                                                            },
                                                            child: Container(
                                                              decoration: BoxDecoration(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              8.0),
                                                                  color: Color(
                                                                      0xff091063)
                                                                  //  .blueAccent,
                                                                  //color: Color(0xffFFBB00),
                                                                  //  color: Color(0xFFFE9F33),
                                                                  ),
                                                              child: Center(
                                                                  child: Text(
                                                                CommonList.popularbanisList[
                                                                        index]
                                                                    ["nameUni"],
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .white),
                                                              )),
                                                            ),
                                                          );
                                                        }),
                                                  ],
                                                ),
                                              );
                                            });
                                          }),
                                          // SizedBox(width: 400),
                                        ],
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(right: 50),
                                        child: IconButton(
                                            onPressed: () {
                                              if (value.sidebarExpand ==
                                                  false) {
                                                newBooks.booksExpand == true
                                                    ? newBooks
                                                        .setbooksExpanded(false)
                                                    : null;
                                                value.setExpanded(true);
                                              } else {
                                                value.setExpanded(false);
                                              }
                                            },
                                            icon: Icon(
                                              Icons.cancel_outlined,
                                              color: Colors.white,
                                              size: 35,
                                            )),
                                      )
                                    ],
                                  )),
                            )
                          : Container(),
                      newBooks.booksExpand == true
                          ? Positioned(
                              left: 0,
                              child: Container(
                                height: MediaQuery.of(context).size.height,
                                width: MediaQuery.of(context).size.width - 100,
                                color: Colors.black45.withOpacity(0.8),
                                child: Padding(
                                  padding: EdgeInsets.only(left: 20, right: 20),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Padding(
                                            padding: EdgeInsets.only(
                                                top: 10, left: 10, bottom: 10),
                                            child: Text(
                                              "Ceremonies",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 25),
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(right: 50),
                                            child: IconButton(
                                                onPressed: () {
                                                  if (newBooks.booksExpand ==
                                                      false) {
                                                    value.sidebarExpand == true
                                                        ? value
                                                            .setExpanded(false)
                                                        : null;
                                                    newBooks
                                                        .setbooksExpanded(true);
                                                  } else {
                                                    newBooks.setbooksExpanded(
                                                        false);
                                                  }
                                                },
                                                icon: Icon(
                                                  Icons.cancel_outlined,
                                                  color: Colors.white,
                                                  size: 35,
                                                )),
                                          ),
                                        ],
                                      ),
                                      Container(
                                        height: size.height < 900
                                            ? size.height / 4.5
                                            : size.height / 5.5,
                                        width: 500,
                                        color: Color(0xfff5f5f5),
                                        child: Column(
                                          children: [
                                            Container(
                                              height: 30,
                                              width: size.width,
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
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 10.0, top: 5),
                                                child: Text(
                                                  "ਆਨੰਦ ਕਾਰਜ",
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Container(
                                                  height: size.height / 10,
                                                  child: Column(
                                                    children: [
                                                      Text(
                                                          'English Explanations'),
                                                      CupertinoSwitch(
                                                          activeColor:
                                                              Color(0xff051a6e),
                                                          value: lights,
                                                          onChanged:
                                                              (value) {}),
                                                    ],
                                                  ),
                                                ),
                                                Container(
                                                  height: size.height / 7.5,
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      Text(
                                                          "Choose a theme to launch"),
                                                      SizedBox(height: 8.0),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .end,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .end,
                                                        children: [
                                                          GestureDetector(
                                                            onTap: () {
                                                              if (newBooks
                                                                      .booksExpand ==
                                                                  false) {
                                                                value.sidebarExpand ==
                                                                        true
                                                                    ? value
                                                                        .setExpanded(
                                                                            false)
                                                                    : null;
                                                                newBooks
                                                                    .setbooksExpanded(
                                                                        true);
                                                              } else {
                                                                newBooks
                                                                    .setbooksExpanded(
                                                                        false);
                                                              }
                                                              modelvalue
                                                                  .doSomething(
                                                                      "assets/images/white.jpg");
                                                            },
                                                            child: Container(
                                                              height:
                                                                  size.height /
                                                                      12,
                                                              width: 80,
                                                              decoration:
                                                                  BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            5.0),
                                                                color: Colors
                                                                    .white,
                                                              ),
                                                              child: Center(
                                                                  child: Text(
                                                                      "Light")),
                                                            ),
                                                          ),
                                                          SizedBox(width: 10.0),
                                                          GestureDetector(
                                                            onTap: () {
                                                              if (newBooks
                                                                      .booksExpand ==
                                                                  false) {
                                                                value.sidebarExpand ==
                                                                        true
                                                                    ? value
                                                                        .setExpanded(
                                                                            false)
                                                                    : null;
                                                                newBooks
                                                                    .setbooksExpanded(
                                                                        true);
                                                              } else {
                                                                newBooks
                                                                    .setbooksExpanded(
                                                                        false);
                                                              }

                                                              modelvalue
                                                                  .doSomething(
                                                                      "assets/images/istockphoto.jpg");
                                                            },
                                                            child: Container(
                                                              height:
                                                                  size.height /
                                                                      12,
                                                              width: 80,
                                                              decoration:
                                                                  BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            5.0),
                                                                //  color: Color(0xffffaa5cb),
                                                                image: DecorationImage(
                                                                    image: AssetImage(
                                                                        "assets/images/istockphoto.jpg"),
                                                                    fit: BoxFit
                                                                        .cover),
                                                              ),
                                                              //  child: Image.asset("assets/images/pexels2.jpg",fit: BoxFit.cover,),
                                                            ),
                                                          ),
                                                          SizedBox(width: 10.0),
                                                          GestureDetector(
                                                            onTap: () {
                                                              if (newBooks
                                                                      .booksExpand ==
                                                                  false) {
                                                                value.sidebarExpand ==
                                                                        true
                                                                    ? value
                                                                        .setExpanded(
                                                                            false)
                                                                    : null;
                                                                newBooks
                                                                    .setbooksExpanded(
                                                                        true);
                                                              } else {
                                                                newBooks
                                                                    .setbooksExpanded(
                                                                        false);
                                                              }
                                                            },
                                                            child: Container(
                                                              height:
                                                                  size.height /
                                                                      12,
                                                              width: 80,
                                                              decoration:
                                                                  BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            5.0),
                                                                // color: Color(0xfff7c965),
                                                                image:
                                                                    DecorationImage(
                                                                  image: AssetImage(
                                                                      modelvalue
                                                                          .someValue),
                                                                  fit: BoxFit
                                                                      .cover,
                                                                ),
                                                              ),
                                                              child: Center(
                                                                  child: Text(
                                                                      "Current Theme",
                                                                      textAlign:
                                                                          TextAlign
                                                                              .center)),
                                                            ),
                                                          ),
                                                        ],
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 8.0,
                                      ),
                                      Container(
                                        height: size.height < 900
                                            ? size.height / 4.5
                                            : size.height / 5.5,
                                        width: 500,
                                        color: Color(0xfff5f5f5),
                                        child: Column(
                                          children: [
                                            Container(
                                              height: 30,
                                              width: size.width,
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
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 10.0, top: 5),
                                                child: Text(
                                                  "ਅਨੰਦ ਸਾਹਿਬ ਅਤੇ ਸਲੋਕ",
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Container(
                                                  height: size.height / 7.5,
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      Text(
                                                          "Choose a theme to launch"),
                                                      SizedBox(height: 8.0),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .end,
                                                        children: [
                                                          GestureDetector(
                                                            onTap: () {
                                                              if (newBooks
                                                                      .booksExpand ==
                                                                  false) {
                                                                value.sidebarExpand ==
                                                                        true
                                                                    ? value
                                                                        .setExpanded(
                                                                            false)
                                                                    : null;
                                                                newBooks
                                                                    .setbooksExpanded(
                                                                        true);
                                                              } else {
                                                                newBooks
                                                                    .setbooksExpanded(
                                                                        false);
                                                              }
                                                              modelvalue
                                                                  .doSomething(
                                                                      "assets/images/white.jpg");
                                                            },
                                                            child: Container(
                                                              height:
                                                                  size.height /
                                                                      12,
                                                              width: 80,
                                                              decoration:
                                                                  BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            5.0),
                                                                color: Colors
                                                                    .white,
                                                              ),
                                                              child: Center(
                                                                  child: Text(
                                                                      "Light")),
                                                            ),
                                                          ),
                                                          SizedBox(width: 10.0),
                                                          GestureDetector(
                                                            onTap: () {
                                                              if (newBooks
                                                                      .booksExpand ==
                                                                  false) {
                                                                value.sidebarExpand ==
                                                                        true
                                                                    ? value
                                                                        .setExpanded(
                                                                            false)
                                                                    : null;
                                                                newBooks
                                                                    .setbooksExpanded(
                                                                        true);
                                                              } else {
                                                                newBooks
                                                                    .setbooksExpanded(
                                                                        false);
                                                              }
                                                              modelvalue
                                                                  .doSomething(
                                                                      "assets/images/background1.png");
                                                            },
                                                            child: Container(
                                                              height:
                                                                  size.height /
                                                                      12,
                                                              width: 80,
                                                              decoration:
                                                                  BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            5.0),
                                                                image: DecorationImage(
                                                                    image: AssetImage(
                                                                        "assets//images/background1.png"),
                                                                    fit: BoxFit
                                                                        .cover),
                                                              ),
                                                            ),
                                                          ),
                                                          SizedBox(width: 10.0),
                                                          GestureDetector(
                                                            onTap: () {
                                                              if (newBooks
                                                                      .booksExpand ==
                                                                  false) {
                                                                value.sidebarExpand ==
                                                                        true
                                                                    ? value
                                                                        .setExpanded(
                                                                            false)
                                                                    : null;
                                                                newBooks
                                                                    .setbooksExpanded(
                                                                        true);
                                                              } else {
                                                                newBooks
                                                                    .setbooksExpanded(
                                                                        false);
                                                              }
                                                            },
                                                            child: Container(
                                                              height:
                                                                  size.height /
                                                                      12,
                                                              width: 80,
                                                              decoration:
                                                                  BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            5.0),
                                                                //color: Color(0xfff7c965),
                                                                image:
                                                                    DecorationImage(
                                                                  image: AssetImage(
                                                                      modelvalue
                                                                          .someValue),
                                                                  fit: BoxFit
                                                                      .cover,
                                                                ),
                                                              ),
                                                              child: Center(
                                                                  child: Text(
                                                                      "Current Theme",
                                                                      textAlign:
                                                                          TextAlign
                                                                              .center)),
                                                            ),
                                                          ),
                                                        ],
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 8.0,
                                      ),
                                      Container(
                                        height: size.height < 900
                                            ? size.height / 4.5
                                            : size.height / 5.5,
                                        width: 500,
                                        color: Color(0xfff5f5f5),
                                        child: Column(
                                          children: [
                                            Container(
                                              height: 30,
                                              width: size.width,
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
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 10.0, top: 5),
                                                child: Text(
                                                  "ਅਖੰਡ ਪਾਠ ਸਾਹਿਬ ਛੇੜਾ",
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Container(
                                                  height: size.height / 10,
                                                  child: Column(
                                                    children: [
                                                      Text('Raagmala'),
                                                      CupertinoSwitch(
                                                          activeColor:
                                                              Color(0xff051a6e),
                                                          value: lights,
                                                          onChanged:
                                                              (value) {}),
                                                    ],
                                                  ),
                                                ),
                                                Container(
                                                  height: size.height / 7.5,
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      Text(
                                                          "Choose a theme to launch"),
                                                      SizedBox(height: 8.0),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .end,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .end,
                                                        children: [
                                                          GestureDetector(
                                                            onTap: () {
                                                              if (newBooks
                                                                      .booksExpand ==
                                                                  false) {
                                                                value.sidebarExpand ==
                                                                        true
                                                                    ? value
                                                                        .setExpanded(
                                                                            false)
                                                                    : null;
                                                                newBooks
                                                                    .setbooksExpanded(
                                                                        true);
                                                              } else {
                                                                newBooks
                                                                    .setbooksExpanded(
                                                                        false);
                                                              }
                                                              modelvalue
                                                                  .doSomething(
                                                                      "assets/images/white.jpg");
                                                            },
                                                            child: Container(
                                                              height:
                                                                  size.height /
                                                                      12,
                                                              width: 80,
                                                              decoration:
                                                                  BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            5.0),
                                                                color: Colors
                                                                    .white,
                                                              ),
                                                              child: Center(
                                                                  child: Text(
                                                                      "Light")),
                                                            ),
                                                          ),
                                                          SizedBox(width: 10.0),
                                                          GestureDetector(
                                                            onTap: () {
                                                              if (newBooks
                                                                      .booksExpand ==
                                                                  false) {
                                                                value.sidebarExpand ==
                                                                        true
                                                                    ? value
                                                                        .setExpanded(
                                                                            false)
                                                                    : null;
                                                                newBooks
                                                                    .setbooksExpanded(
                                                                        true);
                                                              } else {
                                                                newBooks
                                                                    .setbooksExpanded(
                                                                        false);
                                                              }

                                                              modelvalue
                                                                  .doSomething(
                                                                      "assets/images/background5.png");
                                                            },
                                                            child: Container(
                                                              height:
                                                                  size.height /
                                                                      12,
                                                              width: 80,
                                                              decoration:
                                                                  BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            5.0),
                                                                image: DecorationImage(
                                                                    image: AssetImage(
                                                                        "assets/images/background5.png"),
                                                                    fit: BoxFit
                                                                        .cover),
                                                              ),
                                                            ),
                                                          ),
                                                          SizedBox(width: 10.0),
                                                          GestureDetector(
                                                            onTap: () {
                                                              if (newBooks
                                                                      .booksExpand ==
                                                                  false) {
                                                                value.sidebarExpand ==
                                                                        true
                                                                    ? value
                                                                        .setExpanded(
                                                                            false)
                                                                    : null;
                                                                newBooks
                                                                    .setbooksExpanded(
                                                                        true);
                                                              } else {
                                                                newBooks
                                                                    .setbooksExpanded(
                                                                        false);
                                                              }
                                                            },
                                                            child: Container(
                                                              height:
                                                                  size.height /
                                                                      12,
                                                              width: 80,
                                                              decoration:
                                                                  BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            5.0),
                                                                //color: Color(0xfff7c965),
                                                                image:
                                                                    DecorationImage(
                                                                  image: AssetImage(
                                                                      modelvalue
                                                                          .someValue),
                                                                  fit: BoxFit
                                                                      .cover,
                                                                ),
                                                              ),
                                                              child: Center(
                                                                  child: Text(
                                                                "Current Theme",
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                              )),
                                                            ),
                                                          ),
                                                        ],
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                //   child: sideCard2(context, ""),
                              ),
                            )
                          : Container(),
                      value.settingExpand == true
                          ? Positioned(
                              left: 0,
                              child: settinglayout(context),
                            )
                          : Container()
                    ],
                  ),
                ],
              ),
            ),
          );
        }),
      ]), //Stack
    );
  }

  Widget infoCard(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Consumer<NewbooksModel>(builder: (context, newBooks, child) {
      return SingleChildScrollView(
        child: DefaultTabController(
            length: 2, // length of tabs
            initialIndex: 0,
            child: Column(
                //physics: NeverScrollableScrollPhysics(),
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(0.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        color: Colors.white,
                      ),
                      height: newBooks.isSidebarAvailable == true ? 30 : 00,
                      child: AnimatedContainer(
                        duration: Duration(milliseconds: 00),
                        child: TabBar(
                          controller: _tabController,
                          //isScrollable: true,
                          padding: EdgeInsets.all(2.0),
                          indicator: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                              5.0,
                            ),
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Color(0xffFC8B27),
                                Color(0xffF83219),
                              ],
                            ),
                          ),
                          // indicator: UnderlineTabIndicator(
                          //   borderSide: BorderSide(color: Colors.red, width: 2.0),
                          // ),
                          isScrollable: true,
                          labelColor: Colors.white,
                          unselectedLabelColor: Color(0xFFFE3E26),
                          onTap: (value) {
                            print("tabValueTap---->  ${value}");
                            newBooks.setTabIndexValue(value);
                          },
                          tabs: [
                            Tab(
                              text: 'Presentation',
                            ),
                            Tab(
                              text: 'Single Display',
                            )
                            //
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                      height: newBooks.isSidebarAvailable
                          ? MediaQuery.of(context).size.height * 1 - 50
                          : MediaQuery.of(context).size.height * 1,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          border: Border(
                              top: BorderSide(color: Colors.grey, width: 0.5))),
                      child: AnimatedContainer(
                        duration: Duration(milliseconds: 00),
                        child: TabBarView(
                            controller: _tabController,
                            //physics: CustomTabBarViewScrollPhysics(),

                            children: <Widget>[
                              Screen1(),
                              Screen2()
                              // SecondScreen(),
                            ]),
                      ))
                ])),
      );
    });
  }
}
