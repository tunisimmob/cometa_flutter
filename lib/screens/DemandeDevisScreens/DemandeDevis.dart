// import 'package:cached_network_image/cached_network_image.dart';
import 'package:cometa_flutter/Consts/consts.dart';
import 'package:cometa_flutter/screens/shared/BaseAppBar.dart';
import 'package:flutter/material.dart';
import 'package:responsive_flutter/responsive_flutter.dart';
import 'package:cometa_flutter/screens/homeScreens/Home.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class DemandeDevis extends StatefulWidget {
  final String productName;

  const DemandeDevis({Key key, this.productName}) : super(key: key);

  @override
  _DemandeDevisState createState() => _DemandeDevisState();
}

class _DemandeDevisState extends State<DemandeDevis> {
  final TextEditingController nomEtPrenomController = TextEditingController();
  final TextEditingController adresseController = TextEditingController();
  final TextEditingController postalController = TextEditingController();

  final TextEditingController villeController = TextEditingController();
  final TextEditingController telController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController sujetController = TextEditingController();
  final TextEditingController messageController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  String nomEtPrenomVal;
  String villeVal;
  String telVal;
  String emailVal;
  String sujetVal;
  String messageVal;
  bool isLoading = false;
  bool isSent = false;

  sendForm() async {
    var jsonResponse;
    Map data = {
      "nomprenom": nomEtPrenomController.text,
      "ville": villeController.text,
      "telephone": telController.text,
      "adresse": adresseController.text,
      "codepostal": postalController.text,
      "email": emailController.text,
      "sujet": widget.productName,
      "message": messageController.text,
      "quantite": "1",
    };
    // Map body = {"devi": data};
    var response = await http.post(
      Uri.parse(Consts.hostName + Consts.devis),
      body: jsonEncode(data),
      headers: {'Content-type': 'application/json'},
    );
    print(response.statusCode);
    if (response.statusCode == 200) {
      jsonResponse = jsonEncode(response.body);
      if (jsonResponse != null) {
        print(response.body + " jsonResponse is not null");
        setState(() {
          isLoading = false;
          isSent = true;
        });
      }
    } else {
      setState(() {
        isLoading = false;
        isSent = false;
      });
      print(response.body + "error jsonResponse = null");
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
// ignore: must_call_super
  void dispose() {
    super.dispose();
    // Clean up the controller when the widget is disposed.
    nomEtPrenomController.dispose();
    villeController.dispose();
    telController.dispose();
    emailController.dispose();
    sujetController.dispose();
    messageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Container inputadresse = Container(
      width: ResponsiveFlutter.of(context).wp(43),
      padding: const EdgeInsets.only(bottom: 5, top: 5),
      child: TextFormField(
        controller: adresseController,
        style: TextStyle(color: Colors.black),
        keyboardType: TextInputType.text,
        validator: (text) {
          if (text == null || text.isEmpty) {
            return "Champ obligatoire";
          }
          return null;
        },
        decoration: InputDecoration(
            fillColor: Colors.white,
            filled: true,
            hintText: 'Adresse *',
            hintStyle: TextStyle(color: Colors.black54),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.black54, width: 0.5),
              borderRadius: BorderRadius.circular(3.0),
            ),
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(5.0))),
      ),
    );
    final Container inputville = Container(
      width: ResponsiveFlutter.of(context).wp(43),
      padding: const EdgeInsets.only(bottom: 5, top: 5),
      child: TextFormField(
        controller: villeController,
        style: TextStyle(color: Colors.black),
        keyboardType: TextInputType.text,
        validator: (text) {
          if (text == null || text.isEmpty) {
            return "Champ obligatoire";
          }
          return null;
        },
        decoration: InputDecoration(
            fillColor: Colors.white,
            filled: true,
            hintText: 'Ville *',
            hintStyle: TextStyle(color: Colors.black54),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.black54, width: 0.5),
              borderRadius: BorderRadius.circular(3.0),
            ),
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(5.0))),
      ),
    );
    final Container inputNomEtPrenom = Container(
      width: ResponsiveFlutter.of(context).wp(43),
      padding: const EdgeInsets.only(bottom: 5, top: 5),
      child: TextFormField(
        controller: nomEtPrenomController,
        style: TextStyle(color: Colors.black),
        keyboardType: TextInputType.text,
        validator: (text) {
          if (text == null || text.isEmpty) {
            return "Champ obligatoire";
          }
          return null;
        },
        decoration: InputDecoration(
            fillColor: Colors.white,
            filled: true,
            hintText: 'Nom et Prénom *',
            hintStyle: TextStyle(color: Colors.black54),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.black54, width: 0.5),
              borderRadius: BorderRadius.circular(3.0),
            ),
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(5.0))),
      ),
    );
    final Padding inputEmail = Padding(
      padding: const EdgeInsets.only(bottom: 5, top: 5),
      child: TextFormField(
        controller: emailController,
        style: TextStyle(color: Colors.black),
        keyboardType: TextInputType.emailAddress,
        validator: (email) {
          bool emailValid = RegExp(
                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
              .hasMatch(email);

          if (!emailValid) {
            return "Entrez un E-mail valide";
          }
          return null;
        },
        decoration: InputDecoration(
            fillColor: Colors.white,
            filled: true,
            hintText: 'Email *',
            hintStyle: TextStyle(color: Colors.black54),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.black54, width: 0.5),
              borderRadius: BorderRadius.circular(3.0),
            ),
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(5.0))),
      ),
    );
    final Container inputPhoneNumber = Container(
      width: ResponsiveFlutter.of(context).wp(63.5),
      padding: const EdgeInsets.only(bottom: 5, top: 5),
      child: TextFormField(
        controller: telController,
        style: TextStyle(color: Colors.black),
        keyboardType: TextInputType.number,
        validator: (text) {
          if (text == null || text.isEmpty) {
            return 'Champ obligatoire';
          }
          return null;
        },
        decoration: InputDecoration(
            fillColor: Colors.white,
            filled: true,
            hintText: 'Numéro De Téléphone *',
            hintStyle: TextStyle(color: Colors.black54),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.black54, width: 0.5),
              borderRadius: BorderRadius.circular(3.0),
            ),
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(5.0))),
      ),
    );
    final Container inputpostal = Container(
      width: ResponsiveFlutter.of(context).wp(63.5),
      padding: const EdgeInsets.only(bottom: 5, top: 5),
      child: TextFormField(
        controller: postalController,
        style: TextStyle(color: Colors.black),
        keyboardType: TextInputType.number,
        validator: (text) {
          if (text == null || text.isEmpty) {
            return 'Champ obligatoire';
          }
          return null;
        },
        decoration: InputDecoration(
            fillColor: Colors.white,
            filled: true,
            hintText: 'Code Postal *',
            hintStyle: TextStyle(color: Colors.black54),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.black54, width: 0.5),
              borderRadius: BorderRadius.circular(3.0),
            ),
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(5.0))),
      ),
    );
    final Container inputMessage = Container(
      padding: EdgeInsets.only(bottom: 5, top: 5),
      child: TextFormField(
        controller: messageController,
        style: TextStyle(color: Colors.black),
        keyboardType: TextInputType.multiline,
        validator: (message) {
          if (message == null || message.isEmpty) {
            return "N'oublier pas d'écrivez votre message";
          }
          return null;
        },
        maxLines: 5,
        decoration: InputDecoration(
            fillColor: Colors.white,
            filled: true,
            hintText: 'Message *',
            hintStyle: TextStyle(color: Colors.black54),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.black54, width: 0.5),
              borderRadius: BorderRadius.circular(3.0),
            ),
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(5.0))),
      ),
    );
    final Padding buttonEnvoyer = Padding(
      padding: EdgeInsets.only(bottom: 5, top: 5),
      child: ButtonTheme(
        height: ResponsiveFlutter.of(context).hp(6),
        child: ElevatedButton(
          child: Text('Envoyer',
              style: TextStyle(color: Colors.white, fontSize: 16)),
          style: TextButton.styleFrom(
            primary: Colors.white,
            backgroundColor: Colors.blue[900],
            onSurface: Colors.grey[200],
          ),
          onPressed: () {
            if (_formKey.currentState.validate()) {
              sendForm();
              if (isSent == true) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content:
                      Text('Votre demande de devis a été envoyé avec succès'),
                  duration: Duration(seconds: 2),
                ));
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Home()));
              } else if (isSent == false) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text(
                      "Oups! Quelque chose c'est mal passé. Merci d'essayer plus tard"),
                  duration: Duration(seconds: 2),
                ));
              }
            }
          },
        ),
      ),
    );
    final Padding buttonRetourner = Padding(
      padding: EdgeInsets.only(bottom: 5),
      child: ButtonTheme(
        height: ResponsiveFlutter.of(context).hp(6),
        child: ElevatedButton(
            child: Text('Retour',
                style: TextStyle(color: Colors.white, fontSize: 16)),
            style: TextButton.styleFrom(
              primary: Colors.white,
              backgroundColor: Color(0xffb52632),
              onSurface: Colors.grey[200],
            ),
            onPressed: () {
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => Home()));
            }),
      ),
    );
    return SafeArea(
      child: Scaffold(
        appBar: BaseAppBar(
          appBar: AppBar(),
        ),
        body: Form(
          key: _formKey,
          child: Container(
            color: Colors.white,
            child: Center(
              child: ListView(
                shrinkWrap: true,
                padding: const EdgeInsets.symmetric(horizontal: 15),
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.only(top: 10, bottom: 10),
                        child: Text(
                          "DEMANDEZ VOTRE DEVIS",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(5.0),
                            bottomRight: Radius.circular(5.0),
                            topLeft: Radius.circular(5.0),
                            topRight: Radius.circular(5.0),
                          ),
                        ),
                        padding: EdgeInsets.all(5),
                        child: Text(
                          "VOUS POUVEZ DEMANDER VOTRE DEVIS EN REMPLISSANT LE FORMULAIRE CI-DESSOUS. NOUS SERIONS HEUREUX DE POUVOIR VOUS AIDER.",
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.black87,
                            fontWeight: FontWeight.w700,
                            height: 1.3,
                          ),
                        ),
                      ),
                    ],
                  ),
                  // logo,
                  Container(
                    color: Colors.blue[900],
                    width: ResponsiveFlutter.of(context).wp(100),
                    padding: EdgeInsets.all(15),
                    margin: EdgeInsets.only(top: 10, bottom: 15),
                    child: Text(
                      'DEMANDEZ VOTRE DEVIS '.toUpperCase(),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  inputNomEtPrenom,
                  inputEmail,
                  inputPhoneNumber,
                  inputadresse,
                  inputville,
                  inputpostal,
                  inputMessage,
                  buttonEnvoyer,
                  buttonRetourner,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // getNomVal() {
  //   return nomVal = nomController.text;
  // }

  // getPrenomVal() {
  //   return prenomVal = prenomController.text;
  // }

  // getTelVal() {
  //   return telVal = telController.text;
  // }

  // getEmailVal() {
  //   return emailVal = emailController.text;
  // }

  // getSujetVal() {
  //   return sujetVal = sujetController.text;
  // }

  // getMessageVal() {
  //   return messageVal = messageController.text;
  // }
}
