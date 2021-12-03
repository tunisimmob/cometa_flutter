import 'package:flutter/material.dart';

class Kitchen {
  String name;
  String image;
  bool isSelected;

  Kitchen({
    this.name,
    this.image,
    this.isSelected,
  });
}

List kitchenslist = [
  Kitchen(
    image: 'assets/kitchen-massif.jpg',
    name: "Kitchen supreme massif",
    isSelected: false,
  ),
  Kitchen(
    image: 'assets/kitchen-laque.jpg',
    name: "Kitchen crystal laque",
    isSelected: false,
  ),
  Kitchen(
    image: 'assets/kitchen-flex.jpg',
    name: "Kitchen flex stratfie",
    isSelected: false,
  ),
  Kitchen(
    image: 'assets/kitchen-gloss.png',
    name: "Kitchen gloss",
    isSelected: false,
  ),
];

class Accessoire {
  String name;
  String image;
  bool isSelected;
  Accessoire({
    this.name,
    this.image,
    this.isSelected,
  });
}

List accessoireslist = [
  Accessoire(
    image: 'assets/kitchen-accessoires.jpg',
    name: "Accessoires kitchen",
    isSelected: false,
  ),
  Accessoire(
    image: 'assets/dressing-accessoires.jpg',
    name: "Accessoires dressing",
    isSelected: false,
  ),
];

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
      'assets/categories/porteetautomatisme.jpg',
    ),
    name: "Porte et Automatisme",
    isSelected: false,
  ),
  Categorie(
    image: AssetImage(
      'assets/categories/toles.jpg',
    ),
    name: "Toles",
    isSelected: false,
  ),
  Categorie(
    image: AssetImage(
      'assets/categories/tubes.jpg',
    ),
    name: "Tubes",
    isSelected: false,
  ),
  Categorie(
    image: AssetImage(
      'assets/categories/fermarchant.jpg',
    ),
    name: "Fer Marchands",
    isSelected: false,
  ),
  Categorie(
    image: AssetImage(
      'assets/categories/lamerideaux.jpg',
    ),
    name: "Lame Rideaux et Accessoires",
    isSelected: false,
  ),
  Categorie(
    image: AssetImage(
      'assets/categories/accessoireporte.jpg',
    ),
    name: "Accessoires Porte",
    isSelected: false,
  ),
  Categorie(
    image: AssetImage(
      'assets/categories/decoration.jpg',
    ),
    name: "Décoration",
    isSelected: false,
  ),
  Categorie(
    image: AssetImage(
      'assets/categories/couverture.png',
    ),
    name: "Couverture",
    isSelected: false,
  ),
  Categorie(
    image: AssetImage(
      'assets/categories/polycarbonate.jpg',
    ),
    name: "Polycarbonate",
    isSelected: false,
  ),
  Categorie(
    image: AssetImage(
      'assets/categories/quincaillerie.jpg',
    ),
    name: "Quincaillerie",
    isSelected: false,
  ),
  Categorie(
    image: AssetImage(
      'assets/categories/outillage.jpg',
    ),
    name: "Outillage",
    isSelected: false,
  ),
  Categorie(
    image: AssetImage(
      'assets/categories/equipementbosch.jpg',
    ),
    name: "Equipement Bosch",
    isSelected: false,
  ),
];

/*List categorielist = [
  Categorie(
    image: AssetImage(
      'assets/kitchen-gloss.png',
    ),
    name: "Kitchens",
    isSelected: false,
  ),
  Categorie(
    image: AssetImage(
      'assets/dressing.jpg',
    ),
    name: "Dressings",
    isSelected: false,
  ),
  Categorie(
    image: AssetImage(
      'assets/bathrooms.png',
    ),
    name: "Bathrooms",
    isSelected: false,
  ),
  Categorie(
    image: AssetImage(
      'assets/accessoires.jpeg',
    ),
    name: "Accessoires",
    isSelected: false,
  ),
];*/
