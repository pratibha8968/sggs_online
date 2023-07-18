import 'package:flutter/material.dart';
import 'package:Sggs_Online/view/page1.dart';
import 'package:Sggs_Online/view/page2.dart';
import 'package:Sggs_Online/view/page3.dart';
import 'package:Sggs_Online/view/page4.dart';
import 'package:provider/provider.dart';

import '../view_model/image_model.dart';

class Screen1 extends StatefulWidget {
  const Screen1({Key? key}) : super(key: key);

  @override
  State<Screen1> createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    List pages = [Page1(), Page2(), Page3(), Page4()];
    return Scaffold(
      body: Consumer<MyModel>(
        builder: (BuildContext context, value,  child) {
        return Container(
          padding: EdgeInsets.only(top: 25),
          height: MediaQuery.of(context).size.height - 50,
          width: MediaQuery.of(context).size.width - 110,
         decoration: BoxDecoration(


           image: DecorationImage(
             image: AssetImage(value.someValue),fit: BoxFit.cover,
           )
         ),
         // child:value.someValue!=""? Image.asset(value.someValue,fit: BoxFit.cover,):null,
          //padding : const EdgeInsets.only(top: 15, left:15, bottom: 20,right: 15),
             child: GridView.builder(
               physics: ClampingScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 15,
              mainAxisSpacing: 15,
              childAspectRatio: (MediaQuery.of(context).size.width - (100)) /
                  (MediaQuery.of(context).size.height - 80),
            ),
            itemCount: pages.length,
            itemBuilder: (context, index)
          {
            return pages[index];
            },
          ),
        );
    }
      ),
    );
  }
}
