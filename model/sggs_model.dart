

class LocalSggs {
  List<AngData>? data;

  LocalSggs({this.data});

  LocalSggs.fromJson(Map<String, dynamic> json) {
    if (json["data"] != null) {
      data = <AngData>[];
      json["data"].forEach((v) {
        data!.add(new AngData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data["data"] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class AngData {
  String? id;
  String? ang;
  String? name;
  String? line;
  String? english;
  String? serchEnglishData;
  String? serchPunjabiData;
  String? pageType;
  String? roman;
  String? punjabi;

  AngData(
      {this.id,
        this.ang,
        this.name,
        this.line,
        this.english,
        this.serchEnglishData,
        this.serchPunjabiData,
        this.pageType,
        this.roman,this.punjabi});

  AngData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    ang = json['ang'];
    name = json['name'];
    line = json['line'];
    english = json['english'];
    pageType = json['pageType'];
    roman = json['roman'];
    punjabi = json['punjabi'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['ang'] = this.ang;
    data['name'] = this.name;
    data['line'] = this.line;
    data['english'] = this.english;
    data['pageType'] = this.pageType;
      data['roman'] = this.roman;
        data['punjabi'] = this.punjabi;
    return data;
  }
}
