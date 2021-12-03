class PresentationResponse {
  PresentationModel presentation;
  List<PresentationModel> presentations;

  PresentationResponse.fromJson(Map<String, dynamic> json) {
    if (json != null) {
      presentation = new PresentationModel.fromJson(json);
    }
  }
  PresentationResponse.fromJsonList(dynamic json) {
    if (json != null) {
      presentations = [];
      List<dynamic> presentationsList = json;
      presentationsList.forEach((presentation) =>
          {presentations.add(new PresentationModel.fromJson(presentation))});
    }
  }
}

class PresentationModel {
  String titre;
  String texte;
  // String titre_2;
  // String texte_2;
  // List images1;
  // List images2;
  // ignore: non_constant_identifier_names
  // String image_de_couverture;

  PresentationModel({
    this.titre,
    this.texte,
    // this.images1,
    // this.images2,
    // // ignore: non_constant_identifier_names
    // this.image_de_couverture,
  });
  PresentationModel.fromJson(Map<String, dynamic> json) {
    titre = json["titre"] != null ? json["titre"] : "";
    texte = json["texte"] != null ? json["texte"] : "";
    // titre_2 = json["titre_2"] != null ? json["titre_2"] : "";
    // texte_2 = json["texte_2"] != null ? json["texte_2"] : "";
    // images1 = json['images1'] != null ? json["images1"] : [];
    // images2 = json['images2'] != null ? json["images2"] : [];
    // image_de_couverture =
    //     json['image_de_couverture'] != null ? json["image_de_couverture"] : "";
  }
  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = new Map();
    map["titre"] = titre;
    map["texte"] = texte;
    // map["images1"] = images1;
    // map["images2"] = images2;
    // map["image_de_couverture"] = image_de_couverture;
    return map;
  }
}
