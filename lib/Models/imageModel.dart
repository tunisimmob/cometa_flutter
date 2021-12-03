class ImageResponse {
  ImageModel image;
  List<ImageModel> images;

  ImageResponse.fromJson(Map<String, dynamic> json) {
    if (json != null) {
      image = new ImageModel.fromJson(json);
    }
  }
  ImageResponse.fromJsonList(dynamic json) {
    if (json != null) {
      images = [];
      List<dynamic> imagesList = json;
      imagesList
          .forEach((image) => {images.add(new ImageModel.fromJson(image))});
    }
  }
}

class ImageModel {
  String titre;
  String image;

  ImageModel({
    this.titre,
    this.image,
  });
  ImageModel.fromJson(Map<String, dynamic> json) {
    titre = json["titre"] != null
        ? json["titre"]
        : "l'titre est inconnue pour le moment";
    image = json["image"] != null ? json["image"] : "";
  }
  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = new Map();
    map["titre"] = titre;
    map["image"] = image;

    return map;
  }
}
