import 'package:flutter/cupertino.dart';

class Coloredborder with ChangeNotifier {
  TextEditingController textController = TextEditingController();
  List<String> selectedItem = [];

  List<String> get _selectedItem => selectedItem;
  TextEditingController get _textController => textController;
  void addItem(String value) {
    selectedItem.add(value);
    notifyListeners();
  }

  void setTextController(String val) {
    textController.text = val;
    notifyListeners();
  }
  // void insertText(String myText) {
  //
  //   textController.addListener(() {
  //       String Texts = textController.text.toLowerCase();
  //       textController.value = textController.value.copyWith(
  //         text: Texts,
  //           selection: new TextSelection.collapsed(
  //               offset:  Texts.length),
  //         //selection: TextSelection(baseOffset: Texts.length, extentOffset: Texts.length),
  //         composing: TextRange.empty,
  //
  //       );
  //
  //
  //     });
  //   //final myTextLength = myText.length;
  //   // textController.text = newText;
  //   // textController.selection = textSelection.copyWith(
  //   //   baseOffset: textSelection.start + myTextLength,
  //   //   extentOffset: textSelection.start + myTextLength,
  //   // );
  // }

  void insertText(String myText) {

    final text = textController.text;
    final textSelection = textController.selection;
    final newText = text.replaceRange(
      textSelection.start,
      textSelection.end,
      myText,
    );
    final myTextLength = myText.length;
    textController.text = newText;
    textController.selection = textSelection.copyWith(
      baseOffset: textSelection.start + myTextLength,
      extentOffset: textSelection.start + myTextLength,
    );
  }
}
