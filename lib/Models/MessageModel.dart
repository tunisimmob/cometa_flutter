class MessageResponse {
  MessageModel contact;

  MessageResponse.fromJson(Map<String, dynamic> json) {
    if (json != null) {
      contact = new MessageModel.fromJson(json);
    }
  }
}

class MessageModel {
  String nom;
  String prenom;
  int tel;
  String email;
  String sujet;
  String message;
  MessageModel({
    this.nom,
    this.prenom,
    this.tel,
    this.email,
    this.sujet,
    this.message,
  });
  MessageModel.fromJson(Map<String, dynamic> json) {
    nom = json["nom"] != null ? json["nom"] : "";
    prenom = json['prenom'] != null ? json["prenom"] : "";
    tel = json['tel'] != null ? json["tel"] : 0;
    email = json['email'] != null ? json["email"] : "";
    sujet = json['sujet'] != null ? json["sujet"] : "";
    message = json['message'] != null ? json["message"] : "";
  }
  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = new Map();
    map["nom"] = nom;
    map["prenom"] = prenom;
    map["tel"] = tel;
    map["email"] = email;
    map["sujet"] = sujet;
    map["message"] = message;

    return map;
  }
}
