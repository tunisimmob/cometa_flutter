import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:cometa_flutter/Consts/consts.dart';
import 'package:cometa_flutter/Models/produitModels/ProduitModel.dart';
// import 'package:cometa_flutter/screens/DemandeDevisScreens/DemandeDevis.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:responsive_flutter/responsive_flutter.dart';
import 'package:cometa_flutter/screens/shared/BaseAppBar.dart';
import 'package:cometa_flutter/screens/shared/contactUsFooterWidget.dart';
import 'package:cometa_flutter/screens/shared/socialMediaSubFooterWidget.dart';

class ProductDetails extends StatefulWidget {
  final List<ProduitModel> selectedProduitslist;
  final int index;
  final String categoryName;
  final String productName;

  const ProductDetails({
    Key key,
    this.selectedProduitslist,
    this.index,
    this.productName,
    this.categoryName,
  }) : super(key: key);
  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  int index;
  List<ProduitModel> selectedProduitslist;
  bool isLoading = false;
  bool isSent = false;
  List<Widget> selectedProduitImagesList = [];
  final _formKey = GlobalKey<FormState>();
  final TextEditingController largeurController = TextEditingController();
  final TextEditingController hauteurController = TextEditingController();
  final TextEditingController quantiteController = TextEditingController();
  final TextEditingController nomEtPrenomController = TextEditingController();
  final TextEditingController telController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController adresseController = TextEditingController();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    index = widget.index;
    selectedProduitslist = widget.selectedProduitslist;
    print(widget.selectedProduitslist);
  }

  @override
  void dispose() {
    super.dispose();
  }

  List<Widget> getProduitImagesList1list(List produitImagesList) {
    produitImagesList
      ..forEach((element) {
        if (selectedProduitImagesList.length < 3) {
          selectedProduitImagesList = selectedProduitImagesList +
              [
                CachedNetworkImage(
                  imageUrl: element,
                  progressIndicatorBuilder: (context, url, downloadProgress) =>
                      CircularProgressIndicator(
                          backgroundColor: Colors.transparent,
                          valueColor: new AlwaysStoppedAnimation<Color>(
                              Consts.maincolor),
                          value: downloadProgress.progress),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                )
              ];
          print('$selectedProduitImagesList');
        }
      });
    return selectedProduitImagesList;
  }

  Future<void> _showAccessoiresDialog(
      String categoryName, String productName) async {
    return showDialog<void>(
      barrierDismissible: true, // user must tap button! if it's false
      context: _scaffoldKey.currentContext,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            categoryName.toUpperCase() +
                " :" +
                "\n" +
                productName.toUpperCase(),
            style: TextStyle(color: Colors.red[900]),
          ),
          content: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: ListBody(
                children: <Widget>[
                  Container(
                    width: ResponsiveFlutter.of(context).wp(50),
                    padding: EdgeInsets.all(3),
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
                          hintText: 'Nom et prénom*',
                          hintStyle: TextStyle(
                            color: Colors.blue[900],
                            fontSize: 10,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.blue[900], width: 0.5),
                            borderRadius: BorderRadius.circular(3.0),
                          ),
                          contentPadding:
                              EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(3.0))),
                    ),
                  ),
                  Container(
                    width: ResponsiveFlutter.of(context).wp(50),
                    padding: EdgeInsets.all(3),
                    child: TextFormField(
                      controller: telController,
                      style: TextStyle(color: Colors.black),
                      keyboardType: TextInputType.phone,
                      validator: (text) {
                        if (text == null || text.isEmpty) {
                          return "Champ obligatoire";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          hintText: 'Teléphone *',
                          hintStyle: TextStyle(
                            color: Colors.blue[900],
                            fontSize: 10,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.blue[900], width: 0.5),
                            borderRadius: BorderRadius.circular(3.0),
                          ),
                          contentPadding:
                              EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(3.0))),
                    ),
                  ),
                  Container(
                    width: ResponsiveFlutter.of(context).wp(50),
                    padding: EdgeInsets.all(3),
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
                          hintStyle: TextStyle(
                            color: Colors.blue[900],
                            fontSize: 10,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.blue[900], width: 0.5),
                            borderRadius: BorderRadius.circular(3.0),
                          ),
                          contentPadding:
                              EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(3.0))),
                    ),
                  ),
                  Container(
                    width: ResponsiveFlutter.of(context).wp(50),
                    padding: EdgeInsets.all(3),
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
                          hintStyle: TextStyle(
                            color: Colors.blue[900],
                            fontSize: 10,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.blue[900], width: 0.5),
                            borderRadius: BorderRadius.circular(3.0),
                          ),
                          contentPadding:
                              EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(3.0))),
                    ),
                  ),
                  Container(
                    width: ResponsiveFlutter.of(context).wp(50),
                    padding: EdgeInsets.all(3),
                    child: TextFormField(
                      controller: quantiteController,
                      style: TextStyle(color: Colors.black),
                      keyboardType: TextInputType.phone,
                      // validator: (text) {
                      //   if (text == null || text.isEmpty) {
                      //     return "Champ obligatoire";
                      //   }
                      //   return null;
                      // },
                      decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          hintText: 'Quantitée (1 par defaut)',
                          hintStyle: TextStyle(
                            color: Colors.blue[900],
                            fontSize: 10,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.blue[900], width: 0.5),
                            borderRadius: BorderRadius.circular(3.0),
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 0),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(3.0))),
                    ),
                  ),
                ],
              ),
            ),
          ),
          actions: <Widget>[
            Center(
              child: TextButton(
                style: TextButton.styleFrom(
                  primary: Colors.white,
                  backgroundColor: Consts.maincolor,
                  onSurface: Colors.grey[200],
                ),
                child: Text('Demande de prix'),
                onPressed: () {
                  if (_formKey.currentState.validate()) {
                    setState(() {
                      isLoading = true;
                    });
                    sendForm(categoryName, productName);
                    if (isSent == true) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(
                            'Votre demande de devis a été envoyé avec succès'),
                        duration: Duration(seconds: 2),
                      ));
                      // Navigator.of(context).pop();
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
          ],
        );
      },
    );
  }

  Future<void> _showOthersDialog(
      String categoryName, String productName) async {
    return showDialog<void>(
      context: _scaffoldKey.currentContext,
      barrierDismissible: true, // user must tap button! if it's false
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            categoryName.toUpperCase() +
                " :" +
                "\n" +
                productName.toUpperCase(),
            style: TextStyle(color: Colors.red[900]),
          ),
          content: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: ListBody(
                children: <Widget>[
                  Container(
                    width: ResponsiveFlutter.of(context).wp(50),
                    padding: EdgeInsets.all(3),
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
                          hintText: 'Nom et prénom*',
                          hintStyle: TextStyle(
                            color: Colors.blue[900],
                            fontSize: 10,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.blue[900], width: 0.5),
                            borderRadius: BorderRadius.circular(3.0),
                          ),
                          contentPadding:
                              EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(3.0))),
                    ),
                  ),
                  Container(
                    width: ResponsiveFlutter.of(context).wp(50),
                    padding: EdgeInsets.all(3),
                    child: TextFormField(
                      controller: telController,
                      style: TextStyle(color: Colors.black),
                      keyboardType: TextInputType.phone,
                      validator: (text) {
                        if (text == null || text.isEmpty) {
                          return "Champ obligatoire";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          hintText: 'Teléphone *',
                          hintStyle: TextStyle(
                            color: Colors.blue[900],
                            fontSize: 10,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.blue[900], width: 0.5),
                            borderRadius: BorderRadius.circular(3.0),
                          ),
                          contentPadding:
                              EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(3.0))),
                    ),
                  ),
                  Container(
                    width: ResponsiveFlutter.of(context).wp(50),
                    padding: EdgeInsets.all(3),
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
                          hintStyle: TextStyle(
                            color: Colors.blue[900],
                            fontSize: 10,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.blue[900], width: 0.5),
                            borderRadius: BorderRadius.circular(3.0),
                          ),
                          contentPadding:
                              EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(3.0))),
                    ),
                  ),
                  Container(
                    width: ResponsiveFlutter.of(context).wp(50),
                    padding: EdgeInsets.all(3),
                    child: TextFormField(
                      controller: largeurController,
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
                          hintStyle: TextStyle(
                            color: Colors.blue[900],
                            fontSize: 10,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.blue[900], width: 0.5),
                            borderRadius: BorderRadius.circular(3.0),
                          ),
                          contentPadding:
                              EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(3.0))),
                    ),
                  ),
                ],
              ),
            ),
          ),
          actions: <Widget>[
            Center(
              child: TextButton(
                style: TextButton.styleFrom(
                  primary: Colors.white,
                  backgroundColor: Consts.maincolor,
                  onSurface: Colors.grey[200],
                ),
                child: Text('Demande de prix'),
                onPressed: () {
                  if (_formKey.currentState.validate()) {
                    setState(() {
                      isLoading = true;
                    });
                    sendForm(categoryName, productName);
                    Navigator.of(context).pop();
                  }
                },
              ),
            ),
          ],
        );
      },
    );
  }

  sendForm(String categoryName, String productName) async {
    var jsonResponse;
    Map data = {
      "nomprenom": nomEtPrenomController.text,
      "telephone": telController.text,
      "email": emailController.text,
      "quantite": quantiteController.text,
      "adresse": adresseController.text,
      "sujet": selectedProduitslist[index].titre, //widget.productName,
    };
    print(data);
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
        print("product list ");
        print(widget.selectedProduitslist);
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
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        appBar: BaseAppBar(
          appBar: AppBar(),
        ),
        body: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  child: Column(
                    children: <Widget>[
                      SingleChildScrollView(
                        child: Container(
                          width: ResponsiveFlutter.of(context).wp(100),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(8.0),
                                      topRight: Radius.circular(8.0)),
                                ),
                                child: new Center(
                                  child: Text(
                                    (selectedProduitslist[index].titre)
                                        .toUpperCase(),
                                    style: TextStyle(
                                        color: Consts.maincolor,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                    textAlign: TextAlign.justify,
                                  ),
                                ),
                              ),
                              Container(
                                height: ResponsiveFlutter.of(context).hp(35),
                                width: ResponsiveFlutter.of(context).wp(100),
                                child: Carousel(
                                  boxFit: BoxFit.cover,
                                  autoplay: true,
                                  animationCurve: Curves.fastOutSlowIn,
                                  animationDuration:
                                      Duration(milliseconds: 1500),
                                  dotSize: 6.0,
                                  dotIncreasedColor: Consts.maincolor,
                                  dotBgColor: Colors.transparent,
                                  dotPosition: DotPosition.bottomCenter,
                                  dotVerticalPadding: 10.0,
                                  showIndicator: true,
                                  indicatorBgPadding: 7.0,
                                  images: getProduitImagesList1list(
                                      selectedProduitslist[index].images),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(8.0),
                                      topRight: Radius.circular(8.0)),
                                ),
                                child: Text(
                                  'détails'.toUpperCase(),
                                  style: TextStyle(
                                      color: Consts.maincolor,
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.justify,
                                ),
                              ),
                              Divider(
                                indent: 10,
                                endIndent: 10,
                                height: 5,
                                thickness: 2,
                                color: Consts.maincolor,
                              ),
                              Container(
                                padding: EdgeInsets.only(
                                  left: 10,
                                  right: 10,
                                  top: 5,
                                  bottom: 5,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(8.0),
                                      topRight: Radius.circular(8.0)),
                                ),
                                child: Text(
                                  'description'.toUpperCase(),
                                  style: TextStyle(
                                      color: Colors.black87,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.justify,
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.only(
                                  left: 10,
                                  right: 10,
                                  top: 5,
                                  bottom: 5,
                                ),
                                margin: EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  color: Colors.grey[200],
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(5.0),
                                    bottomRight: Radius.circular(5.0),
                                    topLeft: Radius.circular(5.0),
                                    topRight: Radius.circular(5.0),
                                  ),
                                ),
                                child: Text(
                                  selectedProduitslist[index]
                                      .description
                                      .toString(),
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: Colors.black87,
                                    fontWeight: FontWeight.w600,
                                    height: 1.5,
                                  ),
                                  textAlign: TextAlign.justify,
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.only(
                                  left: 10,
                                  right: 10,
                                  bottom: 5,
                                ),
                                child: Align(
                                  alignment: Alignment.centerRight,
                                  child: ButtonTheme(
                                    child: TextButton(
                                      child: Text(
                                        'Demande de devis',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      style: TextButton.styleFrom(
                                        primary: Colors.white,
                                        backgroundColor: Consts.maincolor,
                                        onSurface: Colors.grey[200],
                                      ),
                                      onPressed: () {
                                        _showAccessoiresDialog(
                                            selectedProduitslist[index]
                                                .categorie,
                                            selectedProduitslist[index].titre);
                                        /* if (selectedProduitslist[index]
                                                    .categorie ==
                                                "Accessoires-Kitchen" ||
                                            selectedProduitslist[index]
                                                    .categorie ==
                                                "Accessoires-Dressing") {
                                          _showAccessoiresDialog(
                                              selectedProduitslist[index]
                                                  .categorie,
                                              selectedProduitslist[index]
                                                  .titre);
                                        } else
                                          _showOthersDialog(
                                              selectedProduitslist[index]
                                                  .categorie,
                                              selectedProduitslist[index]
                                                  .titre);*/
                                      },
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            ContactUsFooter(),
            SocialMediaSubFooterWidget(),
          ],
        ),
      ),
    );
  }
}
