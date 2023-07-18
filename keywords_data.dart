class KeywordsData{

  static textSelect(String str) {
    print("str ${str}");
    if (str.indexOf("O") == 0) {
      str = "";
    }
    if (str.indexOf("U") == 0) {
      str = "";
    }
    if (str.indexOf("Y") == 0) {
      str = "";
    }
    print("str length ${str.length}");

    str = str.replaceAll('A', 'ੳ');
    str = str.replaceAll('B', 'ਬ');
    str = str.replaceAll('C', 'ਚ');
    str = str.replaceAll('D', 'ਦ');
    str = str.replaceAll('E', 'ਣ');
    str = str.replaceAll('F', 'ਡ');
    str = str.replaceAll('G', 'ਗ');
    str = str.replaceAll('H', 'ਹ');
    str = str.replaceAll('I', 'ਿ');
    str = str.replaceAll('J', 'ਜ');
    str = str.replaceAll('K', 'ਕ');
    str = str.replaceAll('L', 'ਲ');
    str = str.replaceAll('M', 'ਮ');
    str = str.replaceAll('N', 'ਨ');
    str = str.replaceAll('O', 'ੇ');
    str = str.replaceAll('P', 'ਪ');
    str = str.replaceAll('Q', 'ਤ');
    str = str.replaceAll('R', 'ਰ');
    str = str.replaceAll('S', 'ਸ');
    str = str.replaceAll('T', 'ਟ');
    str = str.replaceAll('U', 'ੂ');
    str = str.replaceAll('V', 'ਵ');
    str = str.replaceAll('W', 'ਾ');
    str = str.replaceAll('X', 'ਣ');
    str = str.replaceAll('Y', 'ੇ');
    str = str.replaceAll('Z', 'ਜ਼');
    str = str.replaceAll('0', '੦');
    str = str.replaceAll('1', '੧');
    str = str.replaceAll('2', '੨');
    str = str.replaceAll('3', '੩');
    str = str.replaceAll('4', '੪');
    str = str.replaceAll('5', '੫');
    str = str.replaceAll('6', '੬');
    str = str.replaceAll('7', '੭');
    str = str.replaceAll('8', '੮');
    str = str.replaceAll('9', '੯');
    //str = str.replaceAll('_', '');
    return str;
  }
}