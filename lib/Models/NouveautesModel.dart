class NouveauteResponse {
  NouveauteModel nouveaute;
  List<NouveauteModel> nouveautes;

  NouveauteResponse.fromJson(Map<String, dynamic> json) {
    if (json != null) {
      nouveaute = new NouveauteModel.fromJson(json);
    }
  }
  NouveauteResponse.fromJsonList(dynamic json) {
    if (json != null) {
      nouveautes = [];
      List<dynamic> nouveautesList = json;
      nouveautesList.forEach((nouveaute) =>
          {nouveautes.add(new NouveauteModel.fromJson(nouveaute))});
    }
  }
}

class NouveauteModel {
  String titre;
  String texte;
  String image;
  String creeLe;

  NouveauteModel({this.titre, this.texte, this.image, this.creeLe});
  NouveauteModel.fromJson(Map<String, dynamic> json) {
    titre = json["titre"] != null
        ? json["titre"]
        : "l'titre est inconnue pour le moment";
    texte = json["texte"] != null
        ? json["texte"]
        : "le text 1 n'est pas disponible pour le moment";
    image = json['image'] != null ? json["image"] : "";
    creeLe = json['crée_le'] != null ? json["crée_le"] : "";
  }
  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = new Map();
    map["titre"] = titre;
    map["texte"] = texte;
    map["image"] = image;
    map["crée_le"] = creeLe;
    return map;
  }
}
