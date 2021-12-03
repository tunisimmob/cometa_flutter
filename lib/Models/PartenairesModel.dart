class PartenaireResponse {
  PartenaireModel partenaire;
  List<PartenaireModel> partenaires;

  PartenaireResponse.fromJson(Map<String, dynamic> json) {
    if (json != null) {
      partenaire = new PartenaireModel.fromJson(json);
    }
  }
  PartenaireResponse.fromJsonList(dynamic json) {
    if (json != null) {
      partenaires = [];
      List<dynamic> partenairesList = json;
      partenairesList.forEach((partenaire) =>
          {partenaires.add(new PartenaireModel.fromJson(partenaire))});
    }
  }
}

class PartenaireModel {
  String nom;
  // ignore: non_constant_identifier_names
  String partenaire_logo;
  // ignore: non_constant_identifier_names
  String image_de_couverture;

  PartenaireModel({
    this.nom,
    // ignore: non_constant_identifier_names
    this.partenaire_logo,
    // ignore: non_constant_identifier_names
    this.image_de_couverture,
  });
  PartenaireModel.fromJson(Map<String, dynamic> json) {
    nom = json["nom"] != null ? json["nom"] : "";
    partenaire_logo =
        json["partenaire_logo"] != null ? json["partenaire_logo"] : "";

    image_de_couverture =
        json['image_de_couverture'] != null ? json["image_de_couverture"] : "";
  }
  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = new Map();
    map["nom"] = nom;
    map["partenaire_logo"] = partenaire_logo;
    map["image_de_couverture"] = image_de_couverture;
    return map;
  }
}
