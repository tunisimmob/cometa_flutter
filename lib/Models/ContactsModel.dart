class ContactResponse {
  ContactModel contact;
  // List<Contact> contacts;

  ContactResponse.fromJson(Map<String, dynamic> json) {
    if (json != null) {
      contact = new ContactModel.fromJson(json);
    }
  }
  // ContactResponse.fromJsonList(dynamic json) {
  //   if (json != null) {
  //     contacts = List();
  //     List<dynamic> contactsList = json;
  //     contactsList
  //         .forEach((contact) => {contacts.add(new Contact.fromJson(contact))});
  //   }
  // }
}

class ContactModel {
  String adresse;
  String email;
  int numero1;
  int numero2;
  int numero3;
  String logo;

  ContactModel({
    this.adresse,
    this.email,
    this.numero1,
    this.numero2,
    this.numero3,
    this.logo,
  });
  ContactModel.fromJson(Map<String, dynamic> json) {
    adresse = json["adresse"] != null
        ? json["adresse"]
        : "l'adresse est inconnue pour le moment";
    email = json["email"] != null ? json["email"] : "";
    numero1 = json['numero1'] != null ? json["numero1"] : 0;
    numero2 = json['numero2'] != null ? json["numero2"] : 0;
    numero3 = json['numero3'] != null ? json["numero3"] : 0;
    logo = json["logo"] != null ? json["logo"] : "";
  }
  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = new Map();
    map["adresse"] = adresse;
    map["email"] = email;
    map["numero1"] = numero1;
    map["numero2"] = numero2;
    map["numero3"] = numero3;
    map["logo"] = logo;

    return map;
  }
}
