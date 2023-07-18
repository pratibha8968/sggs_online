class Localsohilasahib {
  List<AngData3>? data;
  Localsohilasahib({this.data});

  Localsohilasahib.fromJson(Map<String, dynamic> json) {
    if (json["data"] != null) {
      data = <AngData3>[];
      json["data"].forEach((v) {
        data!.add(new AngData3.fromJson(v));
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

class AngData3 {
  String? id;
  String? ang;
  String? name;
  String? english;
  String? serchEnglishData;
  String? serchPunjabiData;
  String? pageType;

  AngData3(
      {this.id,
        this.ang,
        this.name,
        this.english,
        this.serchEnglishData,
        this.serchPunjabiData,
        this.pageType});

  AngData3.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    ang = json['ang'];
    name = json['name'];
    english = json['english'];
    pageType = json['pageType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['ang'] = this.ang;
    data['name'] = this.name;
    data['english'] = this.english;
    data['pageType'] = this.pageType;
    return data;
  }
}
