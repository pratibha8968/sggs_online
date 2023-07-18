import 'package:Sggs_Online/view/dropdown_model.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:provider/provider.dart';

import '../view_model/books_model.dart';
import '../view_model/books_model2.dart';

List<SlideLayouts> layoutText = [
  SlideLayouts(name: "Translation"),
  SlideLayouts(name: "Transliteration"),
  SlideLayouts(name: "Punjabi Teeka"),
];
List<displayLayouts> displayTxt = [
  //displayLayouts(name:"Akhand paath View(Beta)"),
  displayLayouts(
    name: "Next Line",
  ),
  displayLayouts(
    name: "Left Align",
  ),
  // displayLayouts(name: "Laarivar",)  ,
  displayLayouts(
    name: "Show  Vishraams",
  ),
];
List<backgroundImg> backgrounditems = [
  backgroundImg(name: "Khalsa Gold", Img: "assets/images/background5.png"),
  backgroundImg(name: "Baggi Blue", Img: "assets/images/background6.png"),
  backgroundImg(name: "Khalsa Rush", Img: "assets/images/pexels2.jpg"),
  backgroundImg(name: "Moody Blue", Img: "assets/images/background4.png"),
  backgroundImg(name: "A new Day", Img: "assets/images/background2.png"),
  backgroundImg(name: "Blue & Black", Img: "assets/images/background5.png"),
];
List appTxt = ["Quick Tools", "Shortcut Tray", "Live Feed Text Files"];
List otherTxt = [
  "Limit Changelog",
  "Collect Statistics",
];
List valueTxt = [
  //"3",
  "4",
  "9",
  "12",
  //"1",
];
List defaultTxt = [
  //"3",
  "(Default: 5)",
  "(Default: 4)",
  "(Default: 4)",
  //"1",
];

settinglayout(BuildContext context) {
  var size = MediaQuery.of(context).size;
  TextEditingController _switchController = TextEditingController();
  TextEditingController _limitController = TextEditingController();
  return Consumer3<DropdownModel, CustombooksModel, NewbooksModel>(
      builder: (BuildContext context, value, setvalue, booksModel, child) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width - 100,
      color: Colors.black45.withOpacity(0.8),
      child: Row(
        //mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: Row(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width - 900,
                  child: ListView(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Container(
                          width: MediaQuery.of(context).size.width - 900,
                          color: Colors.white,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                padding: EdgeInsets.all(10.0),
                                height: 40,
                                color: Color(0xffcfd1d4),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Slide Layout"),
                                    Text("Bani & Languages"),
                                    Text("App Settings"),
                                  ],
                                ),
                              ),
                              ListTile(
                                title: RichText(
                                  text: TextSpan(
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 13,
                                        fontWeight: FontWeight.w400),
                                    children: <TextSpan>[
                                      TextSpan(
                                          text: "Bani",
                                          style:
                                              TextStyle(color: Colors.black)),
                                      TextSpan(
                                          text: "(Default: 9)",
                                          style: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 11)),
                                    ],
                                  ),
                                ),
                                trailing: Container(
                                  height: 20,
                                  width: 150,
                                  //color: Colors.pink,
                                  child: Slider(
                                    label: "",
                                    value: 20,
                                    onChanged: (value) {
                                      // setState(() {
                                      //   age = value.toInt();
                                      // });
                                    },
                                    min: 5,
                                    max: 50,
                                  ),
                                ),
                              ),
                              ...List.generate(
                                  layoutText.length,
                                  (index) => ListTile(
                                      leading: Icon(
                                        Icons.remove_red_eye,
                                        color: Colors.black,
                                        size: 18,
                                      ),
                                      title: RichText(
                                        text: TextSpan(
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 13,
                                              fontWeight: FontWeight.w400),
                                          children: <TextSpan>[
                                            TextSpan(
                                                text: layoutText[index]
                                                    .name
                                                    .toString(),
                                                style: TextStyle(
                                                    color: Colors.black)),
                                            TextSpan(
                                                text: defaultTxt[index]
                                                    .toString(),
                                                style: TextStyle(
                                                    color: Colors.grey,
                                                    fontSize: 11)),
                                          ],
                                        ),
                                      ),
                                      minLeadingWidth: 0.0,
                                      trailing: Container(
                                        width: 150,
                                        //color: Colors.pink,
                                        child: LinearPercentIndicator(
                                          backgroundColor: Colors.grey,
                                          progressColor: Colors.blue,
                                          percent: 0.5,
                                          animation: true,
                                          animationDuration: 1000,
                                          leading:
                                              Text(valueTxt[index].toString()),
                                        ),
                                      ))),
                              ListTile(
                                title: RichText(
                                  text: TextSpan(
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 13,
                                        fontWeight: FontWeight.w400),
                                    children: <TextSpan>[
                                      TextSpan(
                                          text: "Announcements",
                                          style:
                                              TextStyle(color: Colors.black)),
                                      TextSpan(
                                          text: "(Default: 7)",
                                          style: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 11)),
                                    ],
                                  ),
                                ),
                                trailing: Container(
                                  width: 150,
                                  child: LinearPercentIndicator(
                                    backgroundColor: Colors.grey,
                                    progressColor: Colors.blue,
                                    percent: 0.5,
                                    animation: true,
                                    animationDuration: 1000,
                                    leading: Text("3"),
                                  ),
                                ),
                              ),
                              ListTile(
                                title: Text(
                                  "DISPLAY OPTIONS",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black38),
                                ),
                              ),
                              ...List.generate(
                                displayTxt.length,
                                (index) => ListTile(
                                  title: Text(
                                    displayTxt[index].name.toString(),
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 13,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  trailing: CupertinoSwitch(
                                      activeColor: Color(0xff051a6e),
                                      value: value.isNotifiable,
                                      onChanged: (val) {
                                        _switchController.text.isEmpty
                                            ? value.doselectswitch(val)
                                            : null;
                                      }),
                                ),
                              ),
                              ListTile(
                                title: Text(
                                  "AUTOPLAY OPTIONS",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black38),
                                ),
                              ),
                              ListTile(
                                title: Text(
                                  "Auto Play",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 13,
                                      fontWeight: FontWeight.w400),
                                ),
                                trailing: CupertinoSwitch(
                                    activeColor: Color(0xff051a6e),
                                    value: value.isautoswitch,
                                    onChanged: (val) {
                                      _switchController.text.isEmpty
                                          ? value.doautoswitch(val)
                                          : null;
                                    }),
                              )
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Container(
                          // height: MediaQuery.of(context).size.height / 3,
                          width: MediaQuery.of(context).size.width - 900,
                          color: Colors.white,
                          child: Column(
                            children: [
                              ListTile(
                                title: Text(
                                  "BANI SETTINGS",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black38),
                                ),
                              ),
                              ListTile(
                                title: Text(
                                  "Bani Length",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 13,
                                      fontWeight: FontWeight.w400),
                                ),
                                trailing: DropdownButtonHideUnderline(
                                  child: Container(
                                    width: 100,
                                    height: 20,
                                    decoration: BoxDecoration(
                                      color: Color(0xffcfcbca),
                                      border:
                                          Border.all(color: Color(0xffb0b3b8)),
                                    ),
                                    child: DropdownButton2(
                                      itemPadding: EdgeInsets.all(0),
                                      value: value.selectedItem,
                                      icon: Icon(Icons.keyboard_arrow_down,
                                          size: 15),
                                      buttonPadding: EdgeInsets.all(0),
                                      itemHeight: 20,
                                      buttonHeight: 17,
                                      onChanged: (val) {
                                        print(val);
                                        value.doselectedItem(val);
                                      },
                                      items: value.items.map((map) {
                                        return DropdownMenuItem(
                                          value: map,
                                          child: Padding(
                                            padding: EdgeInsets.only(left: 8.0),
                                            child: Text(
                                              map,
                                              style: TextStyle(fontSize: 11),
                                            ),
                                          ),
                                        );
                                      }).toList(),
                                    ),
                                  ),
                                ),
                              ),
                              ListTile(
                                title: Text(
                                  "LANGUAGE SETTINGS",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black38),
                                ),
                              ),
                              ListTile(
                                title: Text(
                                  "Translation Language",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 13,
                                      fontWeight: FontWeight.w400),
                                ),
                                trailing: DropdownButtonHideUnderline(
                                  child: Container(
                                    //width: 80,
                                    height: 20,
                                    decoration: BoxDecoration(
                                      color: Color(0xffcfcbca),
                                      border:
                                          Border.all(color: Color(0xffb0b3b8)),
                                    ),
                                    child: DropdownButton2(
                                      itemPadding: EdgeInsets.all(0),
                                      value: value.selectedlang,
                                      icon: Icon(Icons.keyboard_arrow_down,
                                          size: 15),
                                      buttonPadding: EdgeInsets.all(0),
                                      itemHeight: 20,
                                      buttonHeight: 17,
                                      onChanged: (val) {
                                        print(val);
                                        value.doselectedlang(val);
                                      },
                                      items: value.translation.map((maps) {
                                        return DropdownMenuItem(
                                          value: maps,
                                          child: Padding(
                                            padding: EdgeInsets.only(left: 8.0),
                                            child: Text(
                                              maps,
                                              style: TextStyle(fontSize: 11),
                                            ),
                                          ),
                                        );
                                      }).toList(),
                                    ),
                                  ),
                                ),
                              ),
                              ListTile(
                                title: Text(
                                  "Transliteraion Language",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 13,
                                      fontWeight: FontWeight.w400),
                                ),
                                trailing: DropdownButtonHideUnderline(
                                  child: Container(
                                    width: 100,
                                    height: 20,
                                    decoration: BoxDecoration(
                                      color: Color(0xffcfcbca),
                                      border:
                                          Border.all(color: Color(0xffb0b3b8)),
                                    ),
                                    child: DropdownButton2(
                                      itemPadding: EdgeInsets.all(0),
                                      value: value.selectliteration,
                                      icon: Icon(Icons.keyboard_arrow_down,
                                          size: 15),
                                      buttonPadding: EdgeInsets.all(0),
                                      itemHeight: 20,
                                      buttonHeight: 17,
                                      onChanged: (val) {
                                        print(val);
                                        value.doselectliteration(val);
                                      },
                                      items: value.transliteration.map((maps1) {
                                        return DropdownMenuItem(
                                          value: maps1,
                                          child: Padding(
                                            padding: EdgeInsets.only(left: 8.0),
                                            child: Text(
                                              maps1,
                                              style: TextStyle(fontSize: 11),
                                            ),
                                          ),
                                        );
                                      }).toList(),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          //  height: MediaQuery.of(context).size.height/3,
                          width: MediaQuery.of(context).size.width - 900,
                          color: Colors.white,
                          child: Column(
                            children: [
                              ListTile(
                                title: Text(
                                  "APP SETTINGS",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black38),
                                ),
                              ),
                              ...List.generate(
                                appTxt.length,
                                (index) => ListTile(
                                  title: Text(
                                    appTxt[index].toString(),
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 13,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  trailing: CupertinoSwitch(
                                      activeColor: Color(0xff051a6e),
                                      value: value.isappswitch,
                                      onChanged: (val) {
                                        _switchController.text.isEmpty
                                            ? value.doappswitch(val)
                                            : null;
                                      }),
                                ),
                              ),
                              ListTile(
                                title: Text(
                                  "OTHER OPTIONS",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black38),
                                ),
                              ),
                              ...List.generate(
                                  otherTxt.length,
                                  (index) => ListTile(
                                        title: Text(
                                          otherTxt[index].toString(),
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 13,
                                              fontWeight: FontWeight.w400),
                                        ),
                                        trailing: CupertinoSwitch(
                                            activeColor: Color(0xff051a6e),
                                            value: value.limitswitch,
                                            onChanged: (val) {
                                              _limitController.text.isEmpty
                                                  ? value.dolimitswitch(val)
                                                  : null;
                                            }),
                                      )),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width - 900,
                  //color: Colors.white,
                  child: ListView(
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height / 3,
                        width: MediaQuery.of(context).size.width - 900,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(
                                    "assets/images/background1.png"))),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width - 900,
                              height: 20,
                              color: Color(0xffd2d2d4),
                              child: Text(
                                "Preview",
                                style: TextStyle(
                                    fontSize: 15, color: Color(0xff606263)),
                              ),
                            ),
                            SizedBox(height: 25),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "ਕਹੈ ਨਾਨਕੁ ਅਨੰਦੁ ਹੋਆ ਸਤਿਗੁਰੂ ਮੈ ਪਾਇਆ ॥੧॥",
                                style: TextStyle(
                                    fontSize: 35,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xff414345)),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "Nanak says, I am in bliss, because I have met the True Guru. ||1||",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xff606263)),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                        //   color: Colors.pink,
                      ),
                      SizedBox(height: 10.0),
                      Container(
                        height: MediaQuery.of(context).size.height / 2.5,
                        width: MediaQuery.of(context).size.width - 900,
                        color: Colors.white,
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: ListView(
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width - 900,
                                height: 20,
                                color: Colors.white,
                                child: Text(
                                  "Colors",
                                  style: TextStyle(
                                      fontSize: 15, color: Color(0xff606263)),
                                ),
                              ),
                              Row(
                                children: [
                                  Container(
                                    height: 70,
                                    width: 100,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8.0),
                                      color: Colors.white,
                                    ),
                                    child: Center(child: Text("Light")),
                                  ),
                                  Container(
                                    height: 60,
                                    width: 100,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8.0),
                                      color: Colors.black,
                                    ),
                                    child: Center(
                                        child: Text(
                                      "Dark",
                                      style: TextStyle(color: Colors.white),
                                    )),
                                  )
                                ],
                              ),
                              Text("Backgrounds"),
                              SizedBox(height: 10),
                              GridView.builder(
                                  shrinkWrap: true,
                                  itemCount: 6,
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                    childAspectRatio: (size.width - 200) /
                                        (size.height - 100),
                                    crossAxisCount: 3,
                                    crossAxisSpacing: 15,
                                    mainAxisSpacing: 15,
                                  ),
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return Container(
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image: AssetImage(
                                                backgrounditems[index]
                                                    .Img
                                                    .toString(),
                                              ),
                                              fit: BoxFit.cover),
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                        ),
                                        child: Center(
                                            child: Text(
                                          backgrounditems[index]
                                              .name
                                              .toString(),
                                          style: TextStyle(color: Colors.black),
                                        )));
                                  }),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 50),
            child: IconButton(
                onPressed: () {
                  if (setvalue.settingExpand == false) {
                    booksModel.booksExpand == true
                        ? booksModel.setbooksExpanded(false)
                        : null;
                    setvalue.settingExpanded(true);
                  } else {
                    setvalue.settingExpanded(false);
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
    );
  });
}

class SlideLayouts {
  String? name;

  SlideLayouts({this.name});
}

class displayLayouts {
  String? name;

  displayLayouts({this.name});
}

class backgroundImg {
  String? name;
  String? Img;
  backgroundImg({this.name, this.Img});
}
