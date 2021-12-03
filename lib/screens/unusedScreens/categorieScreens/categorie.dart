import 'package:flutter/material.dart';
import 'package:responsive_flutter/responsive_flutter.dart';

import 'package:cometa_flutter/screens/homeScreens/Home.dart';

class Categorie extends StatefulWidget {
  Categorie({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _CategorieState();
  }
}

class _CategorieState extends State<Categorie> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          iconTheme: new IconThemeData(color: Colors.blue[900]),
          backgroundColor: Colors.white,
          shadowColor: Colors.blue[900],
          title: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(
                      context, MaterialPageRoute(builder: (context) => Home()));
                },
                child: Container(
                  width: 125,
                  child: Image.asset('assets/cometa.png'),
                ),
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                Container(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          Container(
                            padding: EdgeInsets.all(5),
                            width: ResponsiveFlutter.of(context).wp(33),
                            height: 100,
                            child: Image.asset('assets/home4.jpg'),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(8.0),
                                  bottomRight: Radius.circular(8.0),
                                  topLeft: Radius.circular(8.0),
                                  topRight: Radius.circular(8.0)),
                            ),
                          ),
                          Container(
                            width: ResponsiveFlutter.of(context).wp(30),
                            child: Text(
                              'Portes Metalliques',
                              style: TextStyle(
                                  color: Colors.blue[900],
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.start,
                            ),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          Container(
                            padding: EdgeInsets.all(5),
                            width: ResponsiveFlutter.of(context).wp(33),
                            height: 100,
                            child: Image.asset('assets/porte-automatique.jpg'),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(8.0),
                                  bottomRight: Radius.circular(8.0),
                                  topLeft: Radius.circular(8.0),
                                  topRight: Radius.circular(8.0)),
                            ),
                          ),
                          Container(
                            width: ResponsiveFlutter.of(context).wp(30),
                            child: Text(
                              'Portes Automatique',
                              style: TextStyle(
                                  color: Colors.blue[900],
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.start,
                            ),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          Container(
                            padding: EdgeInsets.all(5),
                            width: ResponsiveFlutter.of(context).wp(33),
                            height: 100,
                            child: Image.asset('assets/home3.jpg'),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(8.0),
                                  bottomRight: Radius.circular(8.0),
                                  topLeft: Radius.circular(8.0),
                                  topRight: Radius.circular(8.0)),
                            ),
                          ),
                          Container(
                            width: ResponsiveFlutter.of(context).wp(30),
                            child: Text(
                              'Autres Produits',
                              style: TextStyle(
                                  color: Colors.blue[900],
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.start,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                Divider(
                  thickness: 1,
                ),
                Container(
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: produitlist.length,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Home(),
                            ),
                          );
                        },
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Container(
                                width: double.infinity,
                                padding: EdgeInsets.all(5),
                                child: Row(children: [
                                  Container(
                                    padding: EdgeInsets.all(5),
                                    child: CircleAvatar(
                                      maxRadius: 20,
                                      backgroundImage: AssetImage(
                                        produitlist[index].image,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(5),
                                    child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                            width: ResponsiveFlutter.of(context)
                                                .wp(80),
                                            padding: EdgeInsets.only(
                                                left: 5, right: 5, top: 5),
                                            child: Text(
                                              produitlist[index].name,
                                              style: TextStyle(
                                                  color: Colors.blue[900],
                                                  fontSize: 13,
                                                  fontWeight: FontWeight.bold),
                                              textAlign: TextAlign.start,
                                            ),
                                          ),
                                          Container(
                                            width: ResponsiveFlutter.of(context)
                                                .wp(80),
                                            padding: EdgeInsets.all(5),
                                            child: Text(
                                              produitlist[index].description,
                                              style: TextStyle(
                                                  color: Colors.blue[900],
                                                  fontSize: 11),
                                              textAlign: TextAlign.start,
                                            ),
                                          ),
                                        ]),
                                  ),
                                ]),
                              ),
                            ]),
                      );
                    },
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  color: Colors.black12,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: ResponsiveFlutter.of(context).wp(30),
                            padding: EdgeInsets.all(5),
                            child: Text(
                              'Portes Metalliques',
                              style: TextStyle(
                                  color: Colors.blue[900],
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.start,
                            ),
                          ),
                          Divider(
                            thickness: 1,
                          ),
                          Container(
                            width: ResponsiveFlutter.of(context).wp(30),
                            padding: EdgeInsets.all(5),
                            child: Text(
                              'Portes Automatiques',
                              style: TextStyle(
                                color: Colors.blue[900],
                                fontSize: 12,
                              ),
                              textAlign: TextAlign.start,
                            ),
                          ),
                          Container(
                            width: ResponsiveFlutter.of(context).wp(30),
                            padding: EdgeInsets.all(5),
                            child: Text(
                              'Descriptive',
                              style: TextStyle(
                                color: Colors.blue[900],
                                fontSize: 12,
                              ),
                              textAlign: TextAlign.start,
                            ),
                          ),
                          Container(
                            width: ResponsiveFlutter.of(context).wp(30),
                            padding: EdgeInsets.all(5),
                            child: Text(
                              'Garantie',
                              style: TextStyle(
                                color: Colors.blue[900],
                                fontSize: 12,
                              ),
                              textAlign: TextAlign.start,
                            ),
                          ),
                          Container(
                            width: ResponsiveFlutter.of(context).wp(30),
                            padding: EdgeInsets.all(5),
                            child: Text(
                              'Demande de Prix',
                              style: TextStyle(
                                color: Colors.blue[900],
                                fontSize: 12,
                              ),
                              textAlign: TextAlign.start,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: ResponsiveFlutter.of(context).wp(30),
                            padding: EdgeInsets.all(5),
                            child: Text(
                              'Portes Automatiques',
                              style: TextStyle(
                                  color: Colors.blue[900],
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.start,
                            ),
                          ),
                          Divider(
                            thickness: 1,
                          ),
                          Container(
                            width: ResponsiveFlutter.of(context).wp(30),
                            padding: EdgeInsets.all(5),
                            child: Text(
                              'Portes Automatiques',
                              style: TextStyle(
                                color: Colors.blue[900],
                                fontSize: 12,
                              ),
                              textAlign: TextAlign.start,
                            ),
                          ),
                          Container(
                            width: ResponsiveFlutter.of(context).wp(30),
                            padding: EdgeInsets.all(5),
                            child: Text(
                              'Descriptive',
                              style: TextStyle(
                                color: Colors.blue[900],
                                fontSize: 12,
                              ),
                              textAlign: TextAlign.start,
                            ),
                          ),
                          Container(
                            width: ResponsiveFlutter.of(context).wp(30),
                            padding: EdgeInsets.all(5),
                            child: Text(
                              'Garantie',
                              style: TextStyle(
                                color: Colors.blue[900],
                                fontSize: 12,
                              ),
                              textAlign: TextAlign.start,
                            ),
                          ),
                          Container(
                            width: ResponsiveFlutter.of(context).wp(30),
                            padding: EdgeInsets.all(5),
                            child: Text(
                              'Demande de Prix',
                              style: TextStyle(
                                color: Colors.blue[900],
                                fontSize: 12,
                              ),
                              textAlign: TextAlign.start,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: ResponsiveFlutter.of(context).wp(30),
                            padding: EdgeInsets.all(5),
                            child: Text(
                              'Autres Produits',
                              style: TextStyle(
                                  color: Colors.blue[900],
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.start,
                            ),
                          ),
                          Divider(
                            thickness: 1,
                          ),
                          Container(
                            width: ResponsiveFlutter.of(context).wp(30),
                            padding: EdgeInsets.all(5),
                            child: Text(
                              'Portes Automatiques',
                              style: TextStyle(
                                color: Colors.blue[900],
                                fontSize: 12,
                              ),
                              textAlign: TextAlign.start,
                            ),
                          ),
                          Container(
                            width: ResponsiveFlutter.of(context).wp(30),
                            padding: EdgeInsets.all(5),
                            child: Text(
                              'Descriptive',
                              style: TextStyle(
                                color: Colors.blue[900],
                                fontSize: 12,
                              ),
                              textAlign: TextAlign.start,
                            ),
                          ),
                          Container(
                            width: ResponsiveFlutter.of(context).wp(30),
                            padding: EdgeInsets.all(5),
                            child: Text(
                              'Garantie',
                              style: TextStyle(
                                color: Colors.blue[900],
                                fontSize: 12,
                              ),
                              textAlign: TextAlign.start,
                            ),
                          ),
                          Container(
                            width: ResponsiveFlutter.of(context).wp(30),
                            padding: EdgeInsets.all(5),
                            child: Text(
                              'Demande de Prix',
                              style: TextStyle(
                                color: Colors.blue[900],
                                fontSize: 12,
                              ),
                              textAlign: TextAlign.start,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  color: Colors.blue[900],
                  padding: EdgeInsets.all(10),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.only(right: 15),
                          child: Text(
                            '48 458 369',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 15, right: 15),
                          decoration: BoxDecoration(
                            border: Border(
                                right:
                                    BorderSide(width: 2, color: Colors.black),
                                left:
                                    BorderSide(width: 2, color: Colors.black)),
                          ),
                          child: Text(
                            '55 425 635',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 15),
                          child: Text(
                            '36 456 197',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ]),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Produits {
  String name;
  String image;
  String description;

  // ignore: sort_constructors_first
  Produits({this.name, this.image, this.description});
}

List produitlist = [
  Produits(
    name: 'PORTES',
    description:
        'Now residence dashwoods she excellent you. Shade being under his bed her. Much read on as draw. Blessing for ignorant exercise any yourself unpacked. ',
    image: 'assets/home3.jpg',
  ),
  Produits(
    name: 'IRON',
    description:
        'Now residence dashwoods she excellent you. Shade being under his bed her. Much read on as draw. Blessing for ignorant exercise any yourself unpacked. ',
    image: 'assets/home3.jpg',
  ),
  Produits(
    name: 'ACCESSOIRES',
    description:
        'Now residence dashwoods she excellent you. Shade being under his bed her. Much read on as draw. Blessing for ignorant exercise any yourself unpacked. ',
    image: 'assets/home2.jpg',
  ),
  Produits(
    name: 'IRON',
    description:
        'Now residence dashwoods she excellent you. Shade being under his bed her. Much read on as draw. Blessing for ignorant exercise any yourself unpacked. ',
    image: 'assets/home3.jpg',
  ),
  Produits(
    name: 'ACCESSOIRES',
    description:
        'Now residence dashwoods she excellent you. Shade being under his bed her. Much read on as draw. Blessing for ignorant exercise any yourself unpacked. ',
    image: 'assets/home2.jpg',
  ),
  Produits(
    name: 'IRON',
    description:
        'Now residence dashwoods she excellent you. Shade being under his bed her. Much read on as draw. Blessing for ignorant exercise any yourself unpacked. ',
    image: 'assets/home3.jpg',
  ),
  Produits(
    name: 'ACCESSOIRES',
    description:
        'Now residence dashwoods she excellent you. Shade being under his bed her. Much read on as draw. Blessing for ignorant exercise any yourself unpacked. ',
    image: 'assets/home2.jpg',
  ),
  Produits(
    name: 'IRON',
    description:
        'Now residence dashwoods she excellent you. Shade being under his bed her. Much read on as draw. Blessing for ignorant exercise any yourself unpacked. ',
    image: 'assets/home3.jpg',
  ),
  Produits(
    name: 'ACCESSOIRES',
    description:
        'Now residence dashwoods she excellent you. Shade being under his bed her. Much read on as draw. Blessing for ignorant exercise any yourself unpacked. ',
    image: 'assets/home2.jpg',
  ),
  Produits(
    name: 'IRON',
    description:
        'Now residence dashwoods she excellent you. Shade being under his bed her. Much read on as draw. Blessing for ignorant exercise any yourself unpacked. ',
    image: 'assets/home3.jpg',
  ),
  Produits(
    name: 'ACCESSOIRES',
    description:
        'Now residence dashwoods she excellent you. Shade being under his bed her. Much read on as draw. Blessing for ignorant exercise any yourself unpacked. ',
    image: 'assets/home2.jpg',
  ),
  Produits(
    name: 'PORTES',
    description:
        'Now residence dashwoods she excellent you. Shade being under his bed her. Much read on as draw. Blessing for ignorant exercise any yourself unpacked. ',
    image: 'assets/home3.jpg',
  )
];
