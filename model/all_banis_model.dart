class BanisList {
  List<Allbanis>? allbanis;

  BanisList({this.allbanis});

  BanisList.fromJson(Map<String, dynamic> json) {
    if (json['Allbanis'] != null) {
      allbanis = <Allbanis>[];
      json['Allbanis'].forEach((v) {
        allbanis!.add(new Allbanis.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.allbanis != null) {
      data['Allbanis'] = this.allbanis!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Allbanis {
  int? id;
  String? token;
  String? name;
  String? nameUni;
  String? transliteration;
  Transliterations? transliterations;

  Allbanis(
      {this.id,
        this.token,
        this.name,
        this.nameUni,
        this.transliteration,
        this.transliterations});

  Allbanis.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    token = json['token'];
    name = json['name'];
    nameUni = json['nameUni'];
    transliteration = json['transliteration'];
    transliterations = json['transliterations'] != null
        ? new Transliterations.fromJson(json['transliterations'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['token'] = this.token;
    data['name'] = this.name;
    data['nameUni'] = this.nameUni;
    data['transliteration'] = this.transliteration;
    if (this.transliterations != null) {
      data['transliterations'] = this.transliterations!.toJson();
    }
    return data;
  }
}

class Transliterations {
  String? english;
  String? hindi;
  String? en;
  String? hi;
  String? ipa;
  String? ur;

  Transliterations(
      {this.english, this.hindi, this.en, this.hi, this.ipa, this.ur});

  Transliterations.fromJson(Map<String, dynamic> json) {
    english = json['english'];
    hindi = json['hindi'];
    en = json['en'];
    hi = json['hi'];
    ipa = json['ipa'];
    ur = json['ur'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['english'] = this.english;
    data['hindi'] = this.hindi;
    data['en'] = this.en;
    data['hi'] = this.hi;
    data['ipa'] = this.ipa;
    data['ur'] = this.ur;
    return data;
  }
}
