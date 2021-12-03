import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:cometa_flutter/screens/shared/BaseAppBar.dart';
import 'package:cometa_flutter/screens/shared/socialMediaSubFooterWidget.dart';

import 'package:flutter/material.dart';
import 'package:responsive_flutter/responsive_flutter.dart';

class PointsDeVentes extends StatefulWidget {
  const PointsDeVentes({Key key}) : super(key: key);

  @override
  _PointsDeVentesState createState() => _PointsDeVentesState();
}

class _PointsDeVentesState extends State<PointsDeVentes> {
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
          appBar: BaseAppBar(
            appBar: AppBar(),
          ),
          body: ListView(
            children: [
              Container(
                height: h / 55,
              ),
              Container(
                  width: ResponsiveFlutter.of(context).wp(90),
                  height: ResponsiveFlutter.of(context).hp(5),
                  child: Align(
                      alignment: Alignment.center,
                      child: AnimatedTextKit(
                        animatedTexts: [
                          TypewriterAnimatedText("Notre Points De Ventes",
                              speed: const Duration(milliseconds: 120),
                              textStyle: const TextStyle(
                                  fontSize: 25,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold))
                        ],
                        isRepeatingAnimation: false,
                        repeatForever: false,
                        displayFullTextOnTap: true,
                        stopPauseOnTap: false,
                        // repeatForever: true ,
                        // isRepeatingAnimation: true,
                      ))),
              Container(
                height: h / 55,
              ),
              Align(
                  alignment: Alignment.center,
                  child: Container(
                      child: Column(
                    children: [
                      Container(
                        height: h / 30,
                      ),
                      Align(
                          alignment: Alignment.center,
                          child: Divider(
                            color: Colors.blue[900],
                            height: 2,
                            //endIndent: w / 3,
                          )),
                      Container(
                        height: h / 200,
                      ),
                      Align(
                          alignment: Alignment.center,
                          child: RichText(
                            text: const TextSpan(
                              children: <TextSpan>[
                                TextSpan(
                                    text: 'COMETA',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold)),
                              ],
                            ),
                          )),
                      Container(
                        height: h / 200,
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Container(
                            child: GestureDetector(
                          onTap: () {
                            const url =
                                'https://www.google.com/maps/place/COMETA/@36.870142,10.2105953,17z/data=!3m1!4b1!4m5!3m4!1s0x12e2cb27a96b0c43:0xf7310155fd596eae!8m2!3d36.870142!4d10.212784';
                            launchURL(url);
                          },
                          child: Image.asset(
                            'assets/pointsdeventes/p1.jpg',
                            fit: BoxFit.fill,
                          ),
                        )),
                      ),
                      Align(
                          alignment: Alignment.topLeft,
                          child: RichText(
                            text: const TextSpan(
                              children: <TextSpan>[
                                TextSpan(
                                    text: '    Adresse :',
                                    style: TextStyle(
                                        color: Colors.blueAccent,
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold)),
                                TextSpan(
                                    text:
                                        " COMETA : 124, Avenue Mustapha Mohsen 2073 ",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 12,
                                    )),
                              ],
                            ),
                          )),
                      Align(
                          alignment: Alignment.topLeft,
                          child: RichText(
                            text: const TextSpan(
                              children: <TextSpan>[
                                TextSpan(
                                    text: "    Borj Louzir Ariana - Tunisie",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 12,
                                    )),
                              ],
                            ),
                          )),
                      Align(
                          alignment: Alignment.topLeft,
                          child: RichText(
                            text: const TextSpan(
                              children: <TextSpan>[
                                TextSpan(
                                    text: '    Ville :',
                                    style: TextStyle(
                                        color: Colors.blueAccent,
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold)),
                                TextSpan(
                                    text: ' Ariana',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 12,
                                    )),
                              ],
                            ),
                          )),
                      Align(
                          alignment: Alignment.topLeft,
                          child: RichText(
                            text: const TextSpan(
                              children: <TextSpan>[
                                TextSpan(
                                    text: '    Pays :',
                                    style: TextStyle(
                                        color: Colors.blueAccent,
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold)),
                                TextSpan(
                                    text: ' Tunisie',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 12,
                                    )),
                              ],
                            ),
                          )),
                      Align(
                          alignment: Alignment.topLeft,
                          child: RichText(
                            text: const TextSpan(
                              children: <TextSpan>[
                                TextSpan(
                                    text: '    Email :',
                                    style: TextStyle(
                                        color: Colors.blueAccent,
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold)),
                                TextSpan(
                                    text: ' contact@cometa.com.tn',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 12,
                                    )),
                              ],
                            ),
                          )),
                      Align(
                          alignment: Alignment.topLeft,
                          child: RichText(
                            text: const TextSpan(
                              children: <TextSpan>[
                                TextSpan(
                                    text: '    Tél :',
                                    style: TextStyle(
                                        color: Colors.blueAccent,
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold)),
                                TextSpan(
                                    text: ' +216 70 68 15 82 (L.G)',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 12,
                                    )),
                              ],
                            ),
                          )),
                      Align(
                        alignment: Alignment.topLeft,
                        child: RichText(
                          text: const TextSpan(
                            children: <TextSpan>[
                              TextSpan(
                                  text: '    Fax :',
                                  style: TextStyle(
                                      color: Colors.blueAccent,
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold)),
                              TextSpan(
                                  text: ' +216 70 68 35 85',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12,
                                  )),
                            ],
                          ),
                        ),
                      ),
                      Align(
                          alignment: Alignment.topLeft,
                          child: Row(children: const <Widget>[
                            Text(
                              "    Google Maps:",
                              style: TextStyle(
                                  color: Colors.blueAccent,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold),
                            ),
                            Icon(
                              Icons.location_on,
                              color: Colors.blueAccent,
                              size: 12,
                            ),
                          ])),
                    ],
                  ))),
              Container(
                height: h / 30,
              ),
              Align(
                  alignment: Alignment.center,
                  child: Divider(
                    color: Colors.blue[900],
                    height: 2,
                    //endIndent: w / 3,
                  )),
              Container(
                height: h / 200,
              ),
              Align(
                  alignment: Alignment.center,
                  child: RichText(
                    text: const TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                            text: 'Showroom La Marsa',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.bold)),
                      ],
                    ),
                  )),
              Container(
                height: h / 200,
              ),
              Align(
                  alignment: Alignment.center,
                  child: Container(
                      child: Column(
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Container(
                            child: GestureDetector(
                          onTap: () {
                            const url =
                                'https://www.google.com/maps/place/COMETA+LA+MARSA/@36.86832,10.3029673,17z/data=!3m1!4b1!4m5!3m4!1s0x12e2b4df8630fa53:0x55979b82429b06b8!8m2!3d36.86832!4d10.305156';
                            launchURL(url);
                          },
                          child: Image.asset(
                            'assets/pointsdeventes/p2.jpg',
                            fit: BoxFit.fill,
                          ),
                        )),
                      ),
                      Align(
                          alignment: Alignment.topLeft,
                          child: RichText(
                            text: const TextSpan(
                              children: <TextSpan>[
                                TextSpan(
                                    text: '    Adresse :',
                                    style: TextStyle(
                                        color: Colors.blueAccent,
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold)),
                                TextSpan(
                                    text:
                                        " Showroom La Marsa: Z.I Sidi Daoued,",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 12,
                                    )),
                              ],
                            ),
                          )),
                      Align(
                          alignment: Alignment.topLeft,
                          child: RichText(
                            text: const TextSpan(
                              children: <TextSpan>[
                                TextSpan(
                                    text:
                                        "    route de la marsa,derrière kiosque shell, GP9 km 14 - 2046 tunis ",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 12,
                                    )),
                              ],
                            ),
                          )),
                      Align(
                          alignment: Alignment.topLeft,
                          child: RichText(
                            text: const TextSpan(
                              children: <TextSpan>[
                                TextSpan(
                                    text: '    Ville :',
                                    style: TextStyle(
                                        color: Colors.blueAccent,
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold)),
                                TextSpan(
                                    text: ' Tunis',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 12,
                                    )),
                              ],
                            ),
                          )),
                      Align(
                          alignment: Alignment.topLeft,
                          child: RichText(
                            text: const TextSpan(
                              children: <TextSpan>[
                                TextSpan(
                                    text: '    Pays :',
                                    style: TextStyle(
                                        color: Colors.blueAccent,
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold)),
                                TextSpan(
                                    text: ' Tunisie',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 12,
                                    )),
                              ],
                            ),
                          )),
                      Align(
                          alignment: Alignment.topLeft,
                          child: RichText(
                            text: const TextSpan(
                              children: <TextSpan>[
                                TextSpan(
                                    text: '    Email :',
                                    style: TextStyle(
                                        color: Colors.blueAccent,
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold)),
                                TextSpan(
                                    text: ' commercial@cometa.com.tn',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 12,
                                    )),
                              ],
                            ),
                          )),
                      Align(
                          alignment: Alignment.topLeft,
                          child: RichText(
                            text: const TextSpan(
                              children: <TextSpan>[
                                TextSpan(
                                    text: '    Tél :',
                                    style: TextStyle(
                                        color: Colors.blueAccent,
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold)),
                                TextSpan(
                                    text:
                                        ' +216 71 85 44 76 / +216 71 85 44 77',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 12,
                                    )),
                              ],
                            ),
                          )),
                      Align(
                        alignment: Alignment.topLeft,
                        child: RichText(
                          text: const TextSpan(
                            children: <TextSpan>[
                              TextSpan(
                                  text: '    Fax :',
                                  style: TextStyle(
                                      color: Colors.blueAccent,
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold)),
                              TextSpan(
                                  text: ' +216 70 68 35 85',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12,
                                  )),
                            ],
                          ),
                        ),
                      ),
                      Align(
                          alignment: Alignment.topLeft,
                          child: Row(children: const <Widget>[
                            Text(
                              "    Google Maps:",
                              style: TextStyle(
                                  color: Colors.blueAccent,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold),
                            ),
                            Icon(
                              Icons.location_on,
                              color: Colors.blueAccent,
                              size: 12,
                            ),
                          ])),
                    ],
                  ))),
              Container(
                height: h / 30,
              ),
              Align(
                  alignment: Alignment.center,
                  child: Divider(
                    color: Colors.blue[900],
                    height: 2,
                    //endIndent: w / 3,
                  )),
              Container(
                height: h / 200,
              ),
              Align(
                  alignment: Alignment.center,
                  child: RichText(
                    text: const TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                            text: "Showroom El M'nihla",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.bold)),
                      ],
                    ),
                  )),
              Container(
                height: h / 200,
              ),
              Align(
                  alignment: Alignment.center,
                  child: Container(
                      child: Column(
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Container(
                            child: GestureDetector(
                          onTap: () {
                            const url =
                                "https://www.google.com/maps/place/COMETA+EL+M'NIHLA/@36.891362,10.1148953,17z/data=!3m1!4b1!4m5!3m4!1s0x12e2cd8a41d20437:0xd10c5586075e0d42!8m2!3d36.8913984!4d10.1170741";
                            launchURL(url);
                          },
                          child: Image.asset(
                            'assets/pointsdeventes/p3.jpg',
                            fit: BoxFit.fill,
                          ),
                        )),
                      ),
                      Align(
                          alignment: Alignment.topLeft,
                          child: RichText(
                            text: const TextSpan(
                              children: <TextSpan>[
                                TextSpan(
                                    text: '    Adresse :',
                                    style: TextStyle(
                                        color: Colors.blueAccent,
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold)),
                                TextSpan(
                                    text:
                                        " Showroom El M'nihla: Route de BIZERTE km10 à 500m  ",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 12,
                                    )),
                              ],
                            ),
                          )),
                      Align(
                          alignment: Alignment.topLeft,
                          child: RichText(
                            text: const TextSpan(
                              children: <TextSpan>[
                                TextSpan(
                                    text:
                                        "    de Géant M'nihla 2094 Ariana - Tunisie ",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 12,
                                    )),
                              ],
                            ),
                          )),
                      Align(
                          alignment: Alignment.topLeft,
                          child: RichText(
                            text: const TextSpan(
                              children: <TextSpan>[
                                TextSpan(
                                    text: '    Ville :',
                                    style: TextStyle(
                                        color: Colors.blueAccent,
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold)),
                                TextSpan(
                                    text: ' Ariana',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 12,
                                    )),
                              ],
                            ),
                          )),
                      Align(
                          alignment: Alignment.topLeft,
                          child: RichText(
                            text: const TextSpan(
                              children: <TextSpan>[
                                TextSpan(
                                    text: '    Pays :',
                                    style: TextStyle(
                                        color: Colors.blueAccent,
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold)),
                                TextSpan(
                                    text: ' Tunisie',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 12,
                                    )),
                              ],
                            ),
                          )),
                      Align(
                          alignment: Alignment.topLeft,
                          child: RichText(
                            text: const TextSpan(
                              children: <TextSpan>[
                                TextSpan(
                                    text: '    Email :',
                                    style: TextStyle(
                                        color: Colors.blueAccent,
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold)),
                                TextSpan(
                                    text: ' commercial@cometa.com.tn',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 12,
                                    )),
                              ],
                            ),
                          )),
                      Align(
                          alignment: Alignment.topLeft,
                          child: RichText(
                            text: const TextSpan(
                              children: <TextSpan>[
                                TextSpan(
                                    text: '    Tél :',
                                    style: TextStyle(
                                        color: Colors.blueAccent,
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold)),
                                TextSpan(
                                    text: ' +216 70 52 75 80 (L.G)',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 12,
                                    )),
                              ],
                            ),
                          )),
                      Align(
                        alignment: Alignment.topLeft,
                        child: RichText(
                          text: const TextSpan(
                            children: <TextSpan>[
                              TextSpan(
                                  text: '    Fax :',
                                  style: TextStyle(
                                      color: Colors.blueAccent,
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold)),
                              TextSpan(
                                  text: ' +216 70 68 35 85',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12,
                                  )),
                            ],
                          ),
                        ),
                      ),
                      Align(
                          alignment: Alignment.topLeft,
                          child: Row(children: const <Widget>[
                            Text(
                              "    Google Maps:",
                              style: TextStyle(
                                  color: Colors.blueAccent,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold),
                            ),
                            Icon(
                              Icons.location_on,
                              color: Colors.blueAccent,
                              size: 12,
                            ),
                          ])),
                    ],
                  ))),
            ],
          )),
    );
  }
}

/* Column(
        children: [
          Expanded(
              child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Container(
                  width: ResponsiveFlutter.of(context).wp(0),
                  height: ResponsiveFlutter.of(context).hp(3),
                ),
                Container(
                    width: ResponsiveFlutter.of(context).wp(90),
                    height: ResponsiveFlutter.of(context).hp(5),
                    child: AnimatedTextKit(
                      animatedTexts: [
                        TypewriterAnimatedText("Notre Points De Ventes",
                            speed: const Duration(milliseconds: 120),
                            textStyle: const TextStyle(
                                fontSize: 25,
                                color: Colors.black,
                                fontWeight: FontWeight.bold))
                      ],
                      isRepeatingAnimation: false,
                      repeatForever: false,
                      displayFullTextOnTap: true,
                      stopPauseOnTap: false,
                      // repeatForever: true ,
                      // isRepeatingAnimation: true,
                    )),

                // const  Text(" Nos partenaire "),

                Container(
                  width: ResponsiveFlutter.of(context).wp(100),
                  height: ResponsiveFlutter.of(context).hp(100),
                  child: Column(
                    children: [
                      Container(
                        width: w - 4,
                        height: h / 60,
                      ),
                      Container(
                        width: w - 4,
                        height: h / 5,

                        color: Colors.transparent,
                        child: Row(
                          children: [
                            Container(
                              width: (w - 4) / 2,
                              height: h / 5,
                              color: Colors.blue,
                              child: Image.asset(
                                'Assets/pointsdeventes/p1.jpg',
                                fit: BoxFit.fill,
                              ),
                            ),
                            Container(
                              width: (w - 4) / 2,
                              height: h / 5,
                              color: Colors.transparent,
                              child: Column(
                                children: [
                                  const Text(
                                    "Cometa",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Align(
                                      alignment: Alignment.topLeft,
                                      child: RichText(
                                        text: const TextSpan(
                                          children: <TextSpan>[
                                            TextSpan(
                                                text: 'Adresse :',
                                                style: TextStyle(
                                                    color: Colors.blueAccent,
                                                    fontSize: 9,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                            TextSpan(
                                                text:
                                                    " COMETA : 124, Avenue Mustapha Mohsen 2073 Borj Louzir Ariana - Tunisie",
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 9,
                                                )),
                                          ],
                                        ),
                                      )),
                                  Align(
                                      alignment: Alignment.topLeft,
                                      child: RichText(
                                        text: const TextSpan(
                                          children: <TextSpan>[
                                            TextSpan(
                                                text: 'Ville :',
                                                style: TextStyle(
                                                    color: Colors.blueAccent,
                                                    fontSize: 9,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                            TextSpan(
                                                text: ' Ariana',
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 9,
                                                )),
                                          ],
                                        ),
                                      )),
                                  Align(
                                      alignment: Alignment.topLeft,
                                      child: RichText(
                                        text: const TextSpan(
                                          children: <TextSpan>[
                                            TextSpan(
                                                text: 'Pays :',
                                                style: TextStyle(
                                                    color: Colors.blueAccent,
                                                    fontSize: 9,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                            TextSpan(
                                                text: ' Tunisie',
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 9,
                                                )),
                                          ],
                                        ),
                                      )),
                                  Align(
                                      alignment: Alignment.topLeft,
                                      child: RichText(
                                        text: const TextSpan(
                                          children: <TextSpan>[
                                            TextSpan(
                                                text: 'Email :',
                                                style: TextStyle(
                                                    color: Colors.blueAccent,
                                                    fontSize: 9,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                            TextSpan(
                                                text: ' contact@cometa.com.tn',
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 9,
                                                )),
                                          ],
                                        ),
                                      )),
                                  Align(
                                      alignment: Alignment.topLeft,
                                      child: RichText(
                                        text: const TextSpan(
                                          children: <TextSpan>[
                                            TextSpan(
                                                text: 'Tél :',
                                                style: TextStyle(
                                                    color: Colors.blueAccent,
                                                    fontSize: 9,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                            TextSpan(
                                                text: ' +216 70 68 15 82 (L.G)',
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 9,
                                                )),
                                          ],
                                        ),
                                      )),
                                  Align(
                                    alignment: Alignment.topLeft,
                                    child: RichText(
                                      text: const TextSpan(
                                        children: <TextSpan>[
                                          TextSpan(
                                              text: 'Fax :',
                                              style: TextStyle(
                                                  color: Colors.blueAccent,
                                                  fontSize: 9,
                                                  fontWeight: FontWeight.bold)),
                                          TextSpan(
                                              text: ' +216 70 68 35 85',
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 9,
                                              )),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Align(
                                      alignment: Alignment.topLeft,
                                      child: Row(children: const <Widget>[
                                        Text(
                                          "Google Maps:",
                                          style: TextStyle(
                                              color: Colors.blueAccent,
                                              fontSize: 9,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Icon(
                                          Icons.location_on,
                                          color: Colors.blueAccent,
                                          size: 9,
                                        ),
                                      ])),
                                ],
                              ),
                            )
                          ],
                        ),
                        //color: Colors.blue,
                      ),
                      Container(
                        width: w - 4,
                        height: h / 60,
                      ),
                      Container(
                        color: Colors.transparent,
                        width: w - 4,
                        height: h / 5,
                        child: Row(
                          children: [
                            Container(
                              width: (w - 4) / 2,
                              height: h / 5,
                              color: Colors.blue,
                              child: Image.asset(
                                'Assets/pointsdeventes/p2.jpg',
                                fit: BoxFit.fill,
                              ),
                            ),
                            Container(
                              width: (w - 4) / 2,
                              height: h / 5,
                              color: Colors.transparent,
                              child: Column(
                                children: [
                                  const Text(
                                    "Showroom La Marsa",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Align(
                                      alignment: Alignment.topLeft,
                                      child: RichText(
                                        text: const TextSpan(
                                          children: <TextSpan>[
                                            TextSpan(
                                                text: 'Adresse :',
                                                style: TextStyle(
                                                    color: Colors.blueAccent,
                                                    fontSize: 9,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                            TextSpan(
                                                text:
                                                    ' Showroom La Marsa: Z.I Sidi Daoued, route de la marsa, derrière kiosque shell, GP9 km 14 - 2046 tunis',
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 9,
                                                )),
                                          ],
                                        ),
                                      )),
                                  Align(
                                      alignment: Alignment.topLeft,
                                      child: RichText(
                                        text: const TextSpan(
                                          children: <TextSpan>[
                                            TextSpan(
                                                text: 'Ville :',
                                                style: TextStyle(
                                                    color: Colors.blueAccent,
                                                    fontSize: 9,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                            TextSpan(
                                                text: ' Tunis',
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 9,
                                                )),
                                          ],
                                        ),
                                      )),
                                  Align(
                                      alignment: Alignment.topLeft,
                                      child: RichText(
                                        text: const TextSpan(
                                          children: <TextSpan>[
                                            TextSpan(
                                                text: 'Pays :',
                                                style: TextStyle(
                                                    color: Colors.blueAccent,
                                                    fontSize: 9,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                            TextSpan(
                                                text: ' Tunisie',
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 9,
                                                )),
                                          ],
                                        ),
                                      )),
                                  Align(
                                      alignment: Alignment.topLeft,
                                      child: RichText(
                                        text: const TextSpan(
                                          children: <TextSpan>[
                                            TextSpan(
                                                text: 'Email :',
                                                style: TextStyle(
                                                    color: Colors.blueAccent,
                                                    fontSize: 9,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                            TextSpan(
                                                text:
                                                    ' commercial@cometa.com.tn',
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 9,
                                                )),
                                          ],
                                        ),
                                      )),
                                  Align(
                                      alignment: Alignment.topLeft,
                                      child: RichText(
                                        text: const TextSpan(
                                          children: <TextSpan>[
                                            TextSpan(
                                                text: 'Tél :',
                                                style: TextStyle(
                                                    color: Colors.blueAccent,
                                                    fontSize: 9,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                            TextSpan(
                                                text:
                                                    ' +216 71 85 44 76 / +216 71 85 44 77',
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 9,
                                                )),
                                          ],
                                        ),
                                      )),
                                  Align(
                                    alignment: Alignment.topLeft,
                                    child: RichText(
                                      text: const TextSpan(
                                        children: <TextSpan>[
                                          TextSpan(
                                              text: 'Fax :',
                                              style: TextStyle(
                                                  color: Colors.blueAccent,
                                                  fontSize: 9,
                                                  fontWeight: FontWeight.bold)),
                                          TextSpan(
                                              text: ' +216 70 68 35 85',
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 9,
                                              )),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Align(
                                      alignment: Alignment.topLeft,
                                      child: Row(children: const <Widget>[
                                        Text(
                                          "Google Maps:",
                                          style: TextStyle(
                                              color: Colors.blueAccent,
                                              fontSize: 9,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Icon(
                                          Icons.location_on,
                                          color: Colors.blueAccent,
                                          size: 9,
                                        ),
                                      ])),
                                ],
                              ),
                            )
                          ],
                        ),
                        //color: Colors.blue,
                      ),
                      Container(
                        width: w - 4,
                        height: h / 60,
                      ),
                      Container(
                        width: w - 4,
                        height: h / 5,
                        color: Colors.transparent,
                        child: Row(
                          children: [
                            Container(
                              width: (w - 4) / 2,
                              height: h / 5,
                              color: Colors.blue,
                              child: Image.asset(
                                'Assets/pointsdeventes/p3.jpg',
                                fit: BoxFit.fill,
                              ),
                            ),
                            Container(
                              width: (w - 4) / 2,
                              height: h / 5,
                              color: Colors.transparent,
                              child: Column(
                                children: [
                                  const Text(
                                    "Showroom El M'nihla",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Align(
                                      alignment: Alignment.topLeft,
                                      child: RichText(
                                        text: const TextSpan(
                                          children: <TextSpan>[
                                            TextSpan(
                                                text: 'Adresse :',
                                                style: TextStyle(
                                                    color: Colors.blueAccent,
                                                    fontSize: 9,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                            TextSpan(
                                                text:
                                                    " Showroom El M'nihla: Route de BIZERTE km10 à 500m de Géant M'nihla 2094 Ariana - Tunisie",
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 9,
                                                )),
                                          ],
                                        ),
                                      )),
                                  Align(
                                      alignment: Alignment.topLeft,
                                      child: RichText(
                                        text: const TextSpan(
                                          children: <TextSpan>[
                                            TextSpan(
                                                text: 'Ville :',
                                                style: TextStyle(
                                                    color: Colors.blueAccent,
                                                    fontSize: 9,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                            TextSpan(
                                                text: ' Ariana',
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 9,
                                                )),
                                          ],
                                        ),
                                      )),
                                  Align(
                                      alignment: Alignment.topLeft,
                                      child: RichText(
                                        text: const TextSpan(
                                          children: <TextSpan>[
                                            TextSpan(
                                                text: 'Pays :',
                                                style: TextStyle(
                                                    color: Colors.blueAccent,
                                                    fontSize: 9,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                            TextSpan(
                                                text: ' Tunisie',
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 9,
                                                )),
                                          ],
                                        ),
                                      )),
                                  Align(
                                      alignment: Alignment.topLeft,
                                      child: RichText(
                                        text: const TextSpan(
                                          children: <TextSpan>[
                                            TextSpan(
                                                text: 'Email :',
                                                style: TextStyle(
                                                    color: Colors.blueAccent,
                                                    fontSize: 9,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                            TextSpan(
                                                text:
                                                    ' commercial@cometa.com.tn',
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 9,
                                                )),
                                          ],
                                        ),
                                      )),
                                  Align(
                                      alignment: Alignment.topLeft,
                                      child: RichText(
                                        text: const TextSpan(
                                          children: <TextSpan>[
                                            TextSpan(
                                                text: 'Tél :',
                                                style: TextStyle(
                                                    color: Colors.blueAccent,
                                                    fontSize: 9,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                            TextSpan(
                                                text: ' +216 70 52 75 80 (L.G)',
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 9,
                                                )),
                                          ],
                                        ),
                                      )),
                                  Align(
                                    alignment: Alignment.topLeft,
                                    child: RichText(
                                      text: const TextSpan(
                                        children: <TextSpan>[
                                          TextSpan(
                                              text: 'Fax :',
                                              style: TextStyle(
                                                  color: Colors.blueAccent,
                                                  fontSize: 9,
                                                  fontWeight: FontWeight.bold)),
                                          TextSpan(
                                              text: ' +216 70 68 35 85',
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 9,
                                              )),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Align(
                                      alignment: Alignment.topLeft,
                                      child: Row(children: const <Widget>[
                                        Text(
                                          "Google Maps:",
                                          style: TextStyle(
                                              color: Colors.blueAccent,
                                              fontSize: 9,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Icon(
                                          Icons.location_on,
                                          color: Colors.blueAccent,
                                          size: 9,
                                        ),
                                      ])),
                                ],
                              ),
                            )
                          ],
                        ),
                        //color: Colors.blue,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )),
          const ContactUsFooter(),
          const SocialMediaSubFooterWidget(),
        ],
      ),
    ));*/
