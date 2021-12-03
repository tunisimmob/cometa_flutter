import 'package:flutter/material.dart';

class Porte {
  String name;
  AssetImage image;
  Porte({
    this.name,
    this.image,
  });
}

List portelist = [
  Porte(
    image: AssetImage(
      'assets/basculante_couverture.jpg',
    ),
    name: "Porte basculante",
  ),
  Porte(
    image: AssetImage(
      'assets/coulissante_couverture.jpg',
    ),
    name: "Porte coulissante",
  ),
  Porte(
    image: AssetImage(
      'assets/radar_couverture.jpg',
    ),
    name: "Porte à radar",
  ),
  Porte(
    image: AssetImage(
      'assets/rideau_couverture.jpg',
    ),
    name: "Porte rideau",
  ),
];

class Tole {
  String name;
  AssetImage image;
  Tole({
    this.name,
    this.image,
  });
}

List tolelist = [
  Tole(
    image: AssetImage(
      'assets/tole_chaud_1.jpg',
    ),
    name: "Tôle laminée à chaud",
  ),
  Tole(
    image: AssetImage(
      'assets/tole_chaud_2.jpg',
    ),
    name: "Tôle laminée à Chaud Striée",
  ),
  Tole(
    image: AssetImage(
      'assets/tole_chaud_3.jpg',
    ),
    name: "Tôle laminée à Chaud larmée",
  ),
  Tole(
    image: AssetImage(
      'assets/tole_froid.jpg',
    ),
    name: "Tôle laminée à froid",
  ),
  Tole(
    image: AssetImage(
      'assets/tole_galvanisee.jpg',
    ),
    name: "Tôle galvanisée",
  ),
  Tole(
    image: AssetImage(
      'assets/tole_nervurees_1.jpg',
    ),
    name: "Tôles nervurée Galvanisée",
  ),
  Tole(
    image: AssetImage(
      'assets/tole_nervurees_2.jpg',
    ),
    name: "Tôles nervurées prelaquées",
  ),
  Tole(
    image: AssetImage(
      'assets/tole_nervurees_3.jpg',
    ),
    name: "Tôles micro nervurées",
  ),
  Tole(
    image: AssetImage(
      'assets/toles_ondulees.jpg',
    ),
    name: "Tôles ondulées",
  ),
  Tole(
    image: AssetImage(
      'assets/Tole_aluminium.jpg',
    ),
    name: "Tôle aluminium",
  ),
  Tole(
    image: AssetImage(
      'assets/tole_aluminium_striee.jpg',
    ),
    name: "Tôle aluminium striée",
  ),
  Tole(
    image: AssetImage(
      'assets/tole_inox.jpg',
    ),
    name: "Tôle inox",
  ),
  // Tole(
  //   image: AssetImage(
  //     'assets/tole_electrozinguee.jpg',
  //   ),
  //   name: "Tôle electrozinguée",
  // ),
];

class Tube {
  String name;
  AssetImage image;
  Tube({
    this.name,
    this.image,
  });
}

List tubelist = [
  Tube(
    image: AssetImage(
      'assets/tube1.jpg',
    ),
    name: "Tube Carré",
  ),
  Tube(
    image: AssetImage(
      'assets/tube2.jpg',
    ),
    name: "Tube rond",
  ),
  Tube(
    image: AssetImage(
      'assets/tube3.jpg',
    ),
    name: "Tube Rectangulaire",
  ),
  Tube(
    image: AssetImage(
      'assets/tube5.jpg',
    ),
    name: "TUBE OVAL",
  ),
  Tube(
    image: AssetImage(
      'assets/tube6.jpg',
    ),
    name: "Tube Semi Ovale",
  ),
  Tube(
    image: AssetImage(
      'assets/tube4.png',
    ),
    name: "Tube rond inox",
  ),
];

class Lame {
  String name;
  AssetImage image;
  Lame({
    this.name,
    this.image,
  });
}

List lamelist = [
  Lame(
    image: AssetImage(
      'assets/lame_rideau1.jpg',
    ),
    name: "Lame rideaux Plane",
  ),
  Lame(
    image: AssetImage(
      'assets/lame_rideau2.jpg',
    ),
    name: "Lame rideaux Type C",
  ),
  Lame(
    image: AssetImage(
      'assets/lame_rideau3.jpg',
    ),
    name: "Lame Rideaux",
  ),
  Lame(
    image: AssetImage(
      'assets/lame_rideau4.jpg',
    ),
    name: "Lame Rideaux Perforée",
  ),
  Lame(
    image: AssetImage(
      'assets/lame_rideau5.jpg',
    ),
    name: "Lame Rideaux Finale",
  ),
];

class Porteetautomatisme {
  String name;
  String image;
  bool isSelected;
  Porteetautomatisme({this.name, this.image, this.isSelected});
}

List Porteautomatisme = [
  Porteetautomatisme(
    image: 'Assets/categories/porteetautomatisme.jpg',
    name: "Libellé : Porte rideau métallique",
    isSelected: false,
  ),
  Porteetautomatisme(
    image: 'Assets/categories/c1p2.jpg',
    name: "Libellé : Porte coulissante",
    isSelected: false,
  ),
  Porteetautomatisme(
    image: 'Assets/categories/c1p3.jpg',
    name: "Libellé : Porte à radar",
    isSelected: false,
  ),
  Porteetautomatisme(
    image: 'Assets/categories/c1p4.jpg',
    name: "Porte sectionnelle SOMMER",
    isSelected: false,
  ),
  Porteetautomatisme(
    image: 'Assets/categories/c1p5.jpg',
    name: "Libellé : Porte battante",
    isSelected: false,
  ),
];

class Toles {
  String name;
  String image;
  bool isSelected;
  Toles({
    this.name,
    this.image,
    this.isSelected,
  });
}

List Toleslist = [
  /* Toles(
    image: 'Assets/p_coulissant.jpg',
    name: "Portail Coulissant",
    isSelected: false,
  ),
  Toles(
    image: 'Assets/p_ouvrant.jpg',
    name: "Portail ouvrant",
    isSelected: false,
  ),*/
];

class Tubes {
  String name;
  String image;
  bool isSelected;
  Tubes({
    this.name,
    this.image,
    this.isSelected,
  });
}

List Tubeslist = [
  /* Tubes(
    image: 'Assets/porte_Sectionelle.jpg',
    name: "Portes Sectionnelles",
    isSelected: false,
  ),
  Tubes(
    image: 'Assets/porte_basculant.jpg',
    name: "Porte basculante",
    isSelected: false,
  ),
  Tubes(
    image: 'Assets/porte_Compact.jpg',
    name: "Porte Compact",
    isSelected: false,
  ),
  Tubes(
    image: 'Assets/porte_rapide.jpg',
    name: "Porte rapide enroulable",
    isSelected: false,
  ),
  Tubes(
    image: 'Assets/porte_radar.jpg',
    name: "Porte Radar",
    isSelected: false,
  ),*/
];

class Lamerideauxetaccessoires {
  String name;
  String image;
  bool isSelected;
  Lamerideauxetaccessoires({
    this.name,
    this.image,
    this.isSelected,
  });
}

List Lretalist = [
  /*Lamerideauxetaccessoires(
    image: 'Assets/Porte-coupe-feu.jpg',
    name: "Porte-coupe-feu",
    isSelected: false,
  ),
  Lamerideauxetaccessoires(
    image: 'Assets/images/rest.png',
    name: "Porte-coupe-feu",
    isSelected: false,
  ),*/
];

class Accessoiresporte {
  String name;
  String image;
  bool isSelected;
  Accessoiresporte({
    this.name,
    this.image,
    this.isSelected,
  });
}

List Accessoireportelist = [
  /* Accessoiresporte(
    image: 'Assets/images/rest.png',
    name: "Porte-coupe-feu",
    isSelected: false,
  ),
  Accessoiresporte(
    image: 'Assets/images/rest.png',
    name: "Porte-coupe-feu",
    isSelected: false,
  ),*/
];

class Decoration {
  String name;
  String image;
  bool isSelected;
  Decoration({
    this.name,
    this.image,
    this.isSelected,
  });
}

List Decorationlist = [];

class Couverture {
  String name;
  String image;
  bool isSelected;
  Couverture({
    this.name,
    this.image,
    this.isSelected,
  });
}

List Couverturetlist = [];

class Polycarbonate {
  String name;
  String image;
  bool isSelected;
  Polycarbonate({
    this.name,
    this.image,
    this.isSelected,
  });
}

List Polycarbonatelist = [];

class Quincaillerie {
  String name;
  String image;
  bool isSelected;
  Quincaillerie({
    this.name,
    this.image,
    this.isSelected,
  });
}

List Quincaillerielist = [];

class Outillage {
  String name;
  String image;
  bool isSelected;
  Outillage({
    this.name,
    this.image,
    this.isSelected,
  });
}

List Outillagelist = [];

class Categorie {
  String name;
  AssetImage image;
  bool isSelected;
  // set slected(bool isSelected) {
  //   this.isSelected = isSelected;
  // }

  Categorie({
    this.name,
    this.image,
    this.isSelected,
  });
}

List categorielist = [
  Categorie(
    image: AssetImage(
      'Assets/categories/c1p1.jpg',
    ),
    name: "Porte et Automatisme",
    isSelected: false,
  ),
  Categorie(
    image: AssetImage(
      'Assets/categories/rideaux.jpg',
    ),
    name: "Lames rideaux et Accessoires",
    isSelected: false,
  ),
  Categorie(
    image: AssetImage(
      'Assets/categories/accessoireporte.jpg',
    ),
    name: "Accessoires porte",
    isSelected: false,
  ),
  Categorie(
    image: AssetImage(
      'Assets/categories/bosch.png',
    ),
    name: "Equipements Bosch",
    isSelected: false,
  ),
  Categorie(
    image: AssetImage(
      'Assets/categories/toles.jpg',
    ),
    name: "Toles",
    isSelected: false,
  ),
  Categorie(
    image: AssetImage(
      'Assets/categories/tubes.jpg',
    ),
    name: "Tubes",
    isSelected: false,
  ),
  Categorie(
    image: AssetImage(
      'Assets/categories/equipement.jpg',
    ),
    name: "Fer Marchands",
    isSelected: false,
  ),
  Categorie(
    image: AssetImage(
      'Assets/categories/decoration.jpg',
    ),
    name: "Décoration",
    isSelected: false,
  ),
  Categorie(
    image: AssetImage(
      'Assets/categories/couverture.png',
    ),
    name: "Couverture",
    isSelected: false,
  ),
  Categorie(
    image: AssetImage(
      'Assets/categories/polycarbonate.png',
    ),
    name: "Polycarbonate",
    isSelected: false,
  ),
  Categorie(
    image: AssetImage(
      'Assets/categories/quin.jpg',
    ),
    name: "Quincaillerie",
    isSelected: false,
  ),
  Categorie(
    image: AssetImage(
      'Assets/categories/outillage.jpg',
    ),
    name: "Outillage",
    isSelected: false,
  ),
];
