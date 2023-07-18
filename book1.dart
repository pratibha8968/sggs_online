import 'dart:ui';

import 'package:flutter/material.dart';

class Book1 extends StatefulWidget {
  const Book1({Key? key}) : super(key: key);

  @override
  State<Book1> createState() => _Book1State();
}

class _Book1State extends State<Book1> {
  List nitnembanistext = [
    'ਜਪੁਜੀ ਸਾਹਿਬ',
    'ਜਾਪ ਸਾਹਿਬ',
    'ਤਵ-ਪ੍ਰਸਾਦਿ ਸਵਾਰੀਐ',
    'ਬੇਨਤੀ ਚੌਪਈ ਸਾਹਿਬ',
    'ਆਨੰਦ ਸਾਹਿਬ',
    'ਰਹਿਰਾਸ ਸਾਹਿਬ',
    'ਸੋਹਿਲਾ ਸਾਹਿਬ',
  ];
  List sundergutka = [
    'ਜਪੁਜੀ ਸਾਹਿਬ',
    'ਜਾਪ ਸਾਹਿਬ',
    'ਤਵ-ਪ੍ਰਸਾਦਿ ਸਵਾਰੀਐ',
    'ਬੇਨਤੀ ਚੌਪਈ ਸਾਹਿਬ',
    'ਆਨੰਦ ਸਾਹਿਬ',
    'ਰਹਿਰਾਸ ਸਾਹਿਬ',
    'ਸੋਹਿਲਾ ਸਾਹਿਬ',
    'ਆਰਤੀ',
    'ਸਲੋਕ ਮਹਲਾ ੯',
    'ਸੁਖਮਨੀ ਸਾਹਿਬ',
    'ਆਸਾ ਦੀ ਵਾਰ',
  ];
  List popularbanis = [
    'ਆਰਤੀ',
    'ਸਲੋਕ ਮਹਲਾ ੯',
    'ਸੁਖਮਨੀ ਸਾਹਿਬ',
    'ਆਸਾ ਦੀ ਵਾਰ',
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: size.width / 4.5,
            height: size.height,
            color: Color(0xFFFe0e0e0),
            child: ListView(
              children: [
                Container(
                  padding: EdgeInsets.all(5.0),
                  height: 30,
                  color: Color(0xFFbfbdbd),
                  child: Text(
                    "Sunder Gutka",
                    textAlign: TextAlign.start,
                  ),
                ),
                ListTile(
                  leading: Text(sundergutka.toString()),
                )
              ],
            ),
          ),
          SizedBox(width: 10),
          Container(
            height: MediaQuery.of(context).size.height,
            width: size.width / 3.5,
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Nitnem Banis",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
                GridView.builder(
                    shrinkWrap: true,
                    itemCount: 7,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 19 / 12,
                      crossAxisCount: 3,
                      crossAxisSpacing: 5,
                      mainAxisSpacing: 5,
                    ),
                    //   childAspectRatio: width / (height / 4)),
                    itemBuilder: (BuildContext context, int index) {
                      return Card(
                        color: Color(0xff224c8f),
                        child: Center(
                            child: Text(
                          nitnembanistext[index],
                          style: TextStyle(color: Colors.white),
                        )),
                      );
                    }),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Popular  Banis",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
                GridView.builder(
                    shrinkWrap: true,
                    itemCount: 4,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 19 / 12,
                      crossAxisCount: 3,
                      crossAxisSpacing: 5,
                      mainAxisSpacing: 5,
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      return Card(
                        color: Color(0xffab5203),
                        child: Center(
                            child: Text(
                          popularbanis[index],
                          style: TextStyle(color: Colors.white),
                        )),
                      );
                    }),
              ],
            ),
          ),
          SizedBox(width: 550),
          IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.cancel_outlined,
                color: Colors.white,
                size: 35,
              ))
        ],
      ),
    );
  }
}
