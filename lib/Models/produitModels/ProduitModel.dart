class ProduitResponse {
  ProduitModel produit;
  List<ProduitModel> produits;

  ProduitResponse.fromJson(Map<String, dynamic> json) {
    if (json != null) {
      produit = new ProduitModel.fromJson(json);
    }
  }

  ProduitResponse.fromJsonList(dynamic json) {
    if (json != null) {
      produits = [];
      List<dynamic> produitsList = json;
      produitsList
          .forEach((image) => {produits.add(new ProduitModel.fromJson(image))});
    }
  }
}

class ProduitModel {
  int id;
  String titre;
  String description;
  String categorie;
  List images;

  ProduitModel({
    this.id,
    this.titre,
    this.description,
    this.categorie,
    this.images,
  });
  ProduitModel.fromJson(Map<String, dynamic> json) {
    id = json["id"] != null ? json["id"] : 0;
    titre = json["titre"] != null ? json["titre"] : "";
    description = json["description"] != null ? json["description"] : "";
    categorie = json["categorie"] != null ? json["categorie"] : "";
    images = json['images'] != null ? json["images"] : [];
  }
  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = new Map();
    map["id"] = id;
    map["titre"] = titre;
    map["description"] = description;
    map["categorie"] = categorie;
    map["images"] = images;
    return map;
  }
}
