import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:Sggs_Online/data/localData/sggs_handler.dart';
import 'package:Sggs_Online/model/sggs_model.dart';
import 'package:Sggs_Online/utilis/on_hover.dart';
import 'package:Sggs_Online/view_model/page2_view_model.dart';
import 'package:Sggs_Online/view_model/page3_view_model.dart';

class Page3 extends StatefulWidget {
  Page3({super.key});

  @override
  State<Page3> createState() => _Page3State();
}

class _Page3State extends State<Page3> {
  final ItemScrollController itemScrollController = ItemScrollController();
  final ItemPositionsListener itemPositionsListener =
      ItemPositionsListener.create();
  // AutoScrollController? controller;

  void initState() {
    super.initState();
    print("data");
    // controller = AutoScrollController(
    //     viewportBoundaryGetter: () =>
    //         Rect.fromLTRB(0, 0, 0, MediaQuery.of(context).padding.bottom),
    //     axis: Axis.vertical);
  }

  // _scrollToIndex(int sr_no, String line_no) async {
  //   // await getLineNo(line_no);
  //   await controller!
  //       .scrollToIndex(20, preferPosition: AutoScrollPosition.begin);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // print("bdcvxbd");

    return Container(
      decoration:  BoxDecoration(
        border: Border.all(
          color: Color(0xFFC7C7C7),
          width: 1,
        ),
        color: Color(0xfff5f5f5),
        borderRadius: BorderRadius.only(

            bottomLeft: Radius.circular(15),bottomRight: Radius.circular(15)
        ),
      ),
      child: Stack(
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
                      Color(0xffFC8B27
                      ),
                      Color(0xffF83219),

                    ],
                  ),
                ),


              ),
              Container(
                height: size.height < 700
                    ? size.height / 2.83
                    : size.height < 900
                        ? size.height / 2.71
                        : size.height / 2.53,
                // padding: const EdgeInsets.only(
                //   top: 10,
                //   // left: 10,
                // ),
                child: Consumer2<Page3ViewProvider, page2viewModel>(
                    builder: (context, page3value, page2value, child) {
                  // _scrollToIndex(20);
print("bdchjvdvchjhjdchkbx");
print("page3value.banisName--- ${page3value.banisName}");
                  return page3value.ang != 0
                      ? FutureBuilder(
                          future: SggsHandler.getAllShabad(context, page3value.ang.toString(), page3value.lineNo.toString()),


                          //  page3value.showJapji != true && page3value.showAnandsahib != true && page3value.showRehrasahib != true &&
                          //     page3value.showSohilasahib != true && page3value.showSukhmanisahib != true
                          //     ? SggsHandler.getAllShabad(context,
                          //   page3value.ang.toString(),
                          //         page3value.lineNo.toString(),)
                          //     : page3value.showAnandsahib == true
                          //     ? SggsHandler.getanandSaheb(
                          //   context,
                          // ): page3value.showRehrasahib == true ? SggsHandler.getrehrasSaheb(context) :
                          // page3value.showSohilasahib == true ? SggsHandler.getsohilaSaheb(context) : page3value.showSukhmanisahib == true ?
                          //     SggsHandler.getsukhmaniSaheb(context) :
                          //  SggsHandler.getJapjiSaheb(
                          //         context,
                          //       ),


                          builder: (context, AsyncSnapshot snapshot) {
                            List<AngData>? angData;
                            // angData = null;
                            angData = snapshot.data;
                            print("angData... ${angData?.length}");
                            if (angData == null) {
                              return Container();
                            }


                            if (angData.length != 0) {
                              // print("angDatable ${angData?.length}");
                              // print("xcbvvcdhjv");
                              WidgetsBinding.instance
                                  .addPostFrameCallback((_) async {
                                final item = await angData!.indexWhere((e) =>
                                    e.id.toString() ==
                                    page3value.lineNo.toString());
                                print("item $item");
                                // print("snapshot.data ${snapshot.data}");
                                if (item != -1) {
                                  await itemScrollController.scrollTo(
                                      index: item,
                                      duration: Duration(seconds: 1),
                                      curve: Curves.easeInOutCubic);
                                }

                                // await snapshot.data.clear();
                              });
                            }

                            return ScrollablePositionedList.builder(
                                itemCount: angData!.length,
                                // initialScrollIndex: item!,
                                itemScrollController: itemScrollController,
                                itemPositionsListener: itemPositionsListener,
                                itemBuilder: (context, index) {
                                  // print(index);
                                  return OnHoverEffect(builder: (isHovered) {
                                    return GestureDetector(
                                      onTap: () {
                                        page3value.setAng(
                                            int.parse(
                                                angData![index].ang ?? ""),
                                            int.parse(
                                                angData![index].id ?? ""));
                                        page2value.setAnnouncementText("");
                                        page2value.setLineNo(int.parse(
                                            angData![index].id ?? ""));
                                        page3value
                                            .setSelectedAngData(angData[index]);
                                      },
                                      child: Container(
                                        color: page3value.lineNo.toString() ==
                                                    angData![index]
                                                        .id
                                                        .toString() ||
                                                isHovered
                                            ? Color(0xFFFE3E26)
                                            : null,
                                        child: ListTile(
                                          title: Row(
                                            children: [
                                              page3value.lineNo.toString() ==
                                                          angData?[index]
                                                              .id
                                                              .toString() ||
                                                      page3value.selectedAng
                                                          .any((element) =>
                                                              element.id
                                                                  .toString() ==
                                                              angData?[index]
                                                                  .id
                                                                  .toString())
                                                  ?  Icon(
                                                      Icons.done,
                                                      size: 15,
                                                color: page3value.lineNo.toString() ==
                                                  angData![index]
                                                      .id
                                                      .toString() ||
                                                  isHovered
                                                  ? Colors.white
                                                  : null,
                                                    )
                                                  : Container(),
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              page3value.selectedAng[0].id
                                                              .toString() ==
                                                          angData?[index]
                                                              .id
                                                              .toString() ||
                                                      isHovered
                                                  ?  Icon(
                                                      Icons.home,
                                                      size: 15,color: page3value.lineNo.toString() ==
                                                  angData![index]
                                                      .id
                                                      .toString() ||
                                                  isHovered
                                                  ? Colors.white
                                                  : Colors.black,
                                                    )
                                                  : Container(),
                                              Expanded(
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Row(
                                                    children: [
                                                      Text(
                                                        "${angData[index].id}.",
                                                        style: TextStyle(
                                                          fontSize: 16,
                                                          color: page3value.lineNo.toString() ==
                                                              angData![index]
                                                                  .id
                                                                  .toString() ||
                                                              isHovered
                                                              ? Colors.white
                                                              : null,
                                                        ),
                                                      ),
                                                      SizedBox(width:10.0,),
                                                      Expanded(
                                                        child: Text(
                                                          angData?[index].name ?? "",
                                                          style: TextStyle(
                                                            fontSize: 16,
                                                            color: page3value.lineNo.toString() ==
                                                                angData![index]
                                                                    .id
                                                                    .toString() ||
                                                                isHovered
                                                                ? Colors.white
                                                                : null,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  });
                                });

                          },
                        )
                      :page3value.banisName != ""? FutureBuilder(
                          future: SggsHandler.getAllBanis(context,page3value.banisName),


                          //  page3value.showJapji != true && page3value.showAnandsahib != true && page3value.showRehrasahib != true &&
                          //     page3value.showSohilasahib != true && page3value.showSukhmanisahib != true
                          //     ? SggsHandler.getAllShabad(context,
                          //   page3value.ang.toString(),
                          //         page3value.lineNo.toString(),)
                          //     : page3value.showAnandsahib == true
                          //     ? SggsHandler.getanandSaheb(
                          //   context,
                          // ): page3value.showRehrasahib == true ? SggsHandler.getrehrasSaheb(context) :
                          // page3value.showSohilasahib == true ? SggsHandler.getsohilaSaheb(context) : page3value.showSukhmanisahib == true ?
                          //     SggsHandler.getsukhmaniSaheb(context) :
                          //  SggsHandler.getJapjiSaheb(
                          //         context,
                          //       ),


                          builder: (context, AsyncSnapshot snapshot) {
                            List<AngData>? angData;
                            // angData = null;
                            angData = snapshot.data;
                            print("angData... ${angData?.length}");
                            if (angData == null) {
                              return Container();
                            }


                            if (angData.length != 0) {
                              // print("angDatable ${angData?.length}");
                              // print("xcbvvcdhjv");
                              WidgetsBinding.instance
                                  .addPostFrameCallback((_) async {
                                final item = await angData!.indexWhere((e) =>
                                    e.id.toString() ==
                                    page3value.lineNo.toString());
                                print("item $item");
                                // print("snapshot.data ${snapshot.data}");
                                if (item != -1) {
                                  await itemScrollController.scrollTo(
                                      index: item,
                                      duration: Duration(seconds: 1),
                                      curve: Curves.easeInOutCubic);
                                }

                                // await snapshot.data.clear();
                              });
                            }

                            return ScrollablePositionedList.builder(
                                itemCount: angData!.length,
                                // initialScrollIndex: item!,
                                itemScrollController: itemScrollController,
                                itemPositionsListener: itemPositionsListener,
                                itemBuilder: (context, index) {
                                  // print(index);
                                  return OnHoverEffect(builder: (isHovered) {
                                    return GestureDetector(
                                      onTap: () {
                                        // page3value.setAng(
                                        //     int.parse(
                                        //         angData![index].ang ?? ""),
                                        //     int.parse(
                                        //         angData![index].id ?? ""));
                                        page2value.setAnnouncementText("");
                                        page2value.setLineNo(int.parse(
                                            angData![index].id ?? ""));
                                        page3value
                                            .setSelectedAngData(angData[index]);
                                      },
                                      child: Container(
                                        color: page3value.lineNo.toString() ==
                                                    angData![index]
                                                        .id
                                                        .toString() ||
                                                isHovered
                                            ? Color(0xFFFE3E26)
                                            : null,
                                        child: ListTile(
                                          title: Row(
                                            children: [
                                              page3value.lineNo.toString() ==
                                                          angData?[index]
                                                              .id
                                                              .toString() ||
                                                      page3value.selectedAng
                                                          .any((element) =>
                                                              element.id
                                                                  .toString() ==
                                                              angData?[index]
                                                                  .id
                                                                  .toString())
                                                  ?  Icon(
                                                      Icons.done,
                                                      size: 15,
                                                color: page3value.lineNo.toString() ==
                                                  angData![index]
                                                      .id
                                                      .toString() ||
                                                  isHovered
                                                  ? Colors.white
                                                  : null,
                                                    )
                                                  : Container(),
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              // page3value.selectedAng[0].id
                                              //                 .toString() ==
                                              //             angData?[index]
                                              //                 .id
                                              //                 .toString() ||
                                              //         isHovered
                                              //     ?  Icon(
                                              //         Icons.home,
                                              //         size: 15,color: page3value.lineNo.toString() ==
                                              //     angData![index]
                                              //         .id
                                              //         .toString() ||
                                              //     isHovered
                                              //     ? Colors.white
                                              //     : Colors.black,
                                              //       )
                                              //     : Container(),
                                              Expanded(
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Row(
                                                    children: [
                                                      Text(
                                                         "${angData[index].id}.",
                                                        style: TextStyle(
                                                          fontSize: 16,
                                                          color: page3value.lineNo.toString() ==
                                                              angData![index]
                                                                  .id
                                                                  .toString() ||
                                                              isHovered
                                                              ? Colors.white
                                                              : null,
                                                        ),
                                                      ),
                                                      SizedBox(width:10.0,),
                                                      Expanded(
                                                        child: Text(
                                                          angData?[index].name ?? "",
                                                          style: TextStyle(
                                                            fontSize: 16,
                                                            color: page3value.lineNo.toString() ==
                                                                angData![index]
                                                                    .id
                                                                    .toString() ||
                                                                isHovered
                                                                ? Colors.white
                                                                : null,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  });
                                });

                          },
                        ):Container();
                }),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
