import 'package:carousel_pro/carousel_pro.dart';
import 'package:cometa_flutter/Models/produitModels/ProduitModel.dart';
import 'package:cometa_flutter/Models/PresentationsModel.dart';
import 'package:cometa_flutter/Repositories/presentationRepositories/PresentationRepository.dart';
import 'package:cometa_flutter/Repositories/produitRepositories/ProduitsRepository.dart';
import 'package:cometa_flutter/screens/DemandeDevisScreens/DemandeDevis.dart';
import 'package:cometa_flutter/screens/DevenirFranchis%C3%A9Screens.dart/BecomeFranchise.dart';
import 'package:cometa_flutter/screens/catalogueScreens.dart/cataloguePdfViewer.dart';
import 'package:cometa_flutter/screens/contactScreens/contact.dart';
import 'package:cometa_flutter/screens/nouveauteScreens/Nouveau.dart';
import 'package:cometa_flutter/screens/points%20de%20ventes/points_de_ventes.dart';
import 'package:cometa_flutter/screens/presentationScreens/Presentation.dart';
import 'package:cometa_flutter/screens/produitsScreens/product.dart';
import 'package:cometa_flutter/screens/shared/BaseAppBar.dart';
import 'package:cometa_flutter/screens/shared/categorieList.dart';
import 'package:cometa_flutter/screens/shared/contactUsFooterWidget.dart';
import 'package:cometa_flutter/screens/shared/socialMediaSubFooterWidget.dart';
// ignore: unused_import
import 'package:cometa_flutter/Consts/consts.dart';
import 'package:cometa_flutter/screens/unusedScreens/gallerieScreens/gallerieVideos.dart';
import 'package:flutter/material.dart';
import 'package:responsive_flutter/responsive_flutter.dart';
import 'package:auto_size_text/auto_size_text.dart';

class Home extends StatefulWidget {
  final Color color;
  const Home({Key key, this.color}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

// List currentlist = [];
String categoryName;
int selectedIndex;

class _HomeState extends State<Home> {
  List<PresentationModel> presentationslist = [];
  bool isLoading = false;
  bool isExpand = false;
  List<ProduitModel> produitslist = [];
  List<ProduitModel> selectedProduitsList = [];

  @override
  void initState() {
    super.initState();
    presentationsList();
    produitsList();
  }

  presentationsList() async {
    print("presentationsList");
    this.setState(() {
      isLoading = true;
    });
    var response = await PresentationsRepository().presentationsList();
    print(response);
    setState(() {
      isLoading = false;
      presentationslist = response;
    });
  }

  produitsList() async {
    print("produitsList");
    this.setState(() {
      isLoading = true;
    });
    var response = await ProduitsRepository().produitsList();
    print(response);
    setState(() {
      isLoading = false;
      produitslist = response;
    });
  }

  setSelectToFalseInCategorieList() {
    categorielist
      ..forEach((element) {
        element.isSelected = false;
      });
  }

  List<ProduitModel> getselectedProduitsList(
      List produitslist, String categorieName) {
    produitslist
      ..forEach((element) {
        if (element.categorie == categoryName) {
          selectedProduitsList = selectedProduitsList + [element];
          print('$selectedProduitsList');
        }
      });
    return selectedProduitsList;
  }

  Future<void> _showKitchenDialog(selectedIndex) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true, // user must tap button! if it's false
      builder: (BuildContext context) {
        return AlertDialog(
          contentPadding: EdgeInsets.all(5),
          content: Container(
            height: ResponsiveFlutter.of(context).hp(70),
            width: double.maxFinite,
            child: ListView.separated(
              scrollDirection: Axis.vertical,
              physics: BouncingScrollPhysics(),
              // padding: EdgeInsets.only(top: 5, bottom: 5),
              itemCount: kitchenslist.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      switch (index) {
                        case 0:
                          {
                            setSelectToFalseInCategorieList();
                            categoryName = 'Kitchen-supreme-massif';
                            selectedProduitsList = [];
                            getselectedProduitsList(produitslist, categoryName);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Produit(
                                          categoryName: categoryName,
                                          selectedProduitsList:
                                              selectedProduitsList,
                                          selectedIndex: selectedIndex,
                                        )));
                          }
                          break;

                        case 1:
                          {
                            setSelectToFalseInCategorieList();
                            categoryName = 'Kitchen-crystal-laque';
                            selectedProduitsList = [];
                            getselectedProduitsList(produitslist, categoryName);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Produit(
                                          categoryName: categoryName,
                                          selectedProduitsList:
                                              selectedProduitsList,
                                          selectedIndex: selectedIndex,
                                        )));
                          }
                          break;
                        case 2:
                          {
                            setSelectToFalseInCategorieList();
                            categoryName = 'Kitchen-flex-stratfie';
                            selectedProduitsList = [];
                            getselectedProduitsList(produitslist, categoryName);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Produit(
                                          categoryName: categoryName,
                                          selectedProduitsList:
                                              selectedProduitsList,
                                          selectedIndex: selectedIndex,
                                        )));
                          }
                          break;
                        case 3:
                          {
                            setSelectToFalseInCategorieList();
                            categoryName = 'Kitchen-gloss';
                            selectedProduitsList = [];
                            getselectedProduitsList(produitslist, categoryName);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Produit(
                                          categoryName: categoryName,
                                          selectedProduitsList:
                                              selectedProduitsList,
                                          selectedIndex: selectedIndex,
                                        )));
                          }
                          break;
                        default:
                          {
                            setSelectToFalseInCategorieList();
                            categoryName = 'Kitchen-gloss';
                            selectedProduitsList = [];
                            getselectedProduitsList(produitslist, categoryName);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Produit(
                                          categoryName: categoryName,
                                          selectedProduitsList:
                                              selectedProduitsList,
                                          selectedIndex: selectedIndex,
                                        )));
                          }
                          break;
                      }
                    });
                  },
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Container(
                          decoration: BoxDecoration(
                            color: Consts.maincolor,
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(5.0),
                              topLeft: Radius.circular(5.0),
                            ),
                          ),
                          padding: EdgeInsets.all(7),
                          child: new Center(
                            child: Text(
                              (kitchenslist[index].name).toUpperCase(),
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 11,
                                  fontWeight: FontWeight.w600),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(5.0),
                            bottomLeft: Radius.circular(5.0),
                          ),
                          child: Image.asset(
                            kitchenslist[index].image,
                            fit: BoxFit.cover,
                          ),
                        )
                      ]),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return Padding(padding: EdgeInsets.all(3));
              },
            ),
          ),
          // actions: <Widget>[
          //   Center(
          //     child: TextButton(
          //       style: TextButton.styleFrom(
          //         primary: Colors.white,
          //         backgroundColor: Color(0xffb52632),
          //         onSurface: Colors.grey[200],
          //       ),
          //       child: Text('click me'),
          //       onPressed: () {
          //         // test
          //       },
          //     ),
          //   ),
          // ],
        );
      },
    );
  }

  Future<void> _showAccessoiresDialog(selectedIndex) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true, // user must tap button! if it's false
      builder: (BuildContext context) {
        return AlertDialog(
          contentPadding: EdgeInsets.all(5),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: ResponsiveFlutter.of(context).hp(55),
                width: double.maxFinite,
                child: ListView.separated(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  physics: BouncingScrollPhysics(),
                  // padding: EdgeInsets.only(top: 5, bottom: 5),
                  itemCount: accessoireslist.length,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          switch (index) {
                            case 0:
                              {
                                setSelectToFalseInCategorieList();
                                categoryName = 'Accessoires-Kitchen';
                                selectedProduitsList = [];
                                getselectedProduitsList(
                                    produitslist, categoryName);
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Produit(
                                              categoryName: categoryName,
                                              selectedProduitsList:
                                                  selectedProduitsList,
                                              selectedIndex: selectedIndex,
                                            )));
                              }
                              break;

                            case 1:
                              {
                                setSelectToFalseInCategorieList();
                                categoryName = 'Accessoires-Dressing';
                                selectedProduitsList = [];
                                getselectedProduitsList(
                                    produitslist, categoryName);
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Produit(
                                              categoryName: categoryName,
                                              selectedProduitsList:
                                                  selectedProduitsList,
                                              selectedIndex: selectedIndex,
                                            )));
                              }
                              break;
                            default:
                              {
                                setSelectToFalseInCategorieList();
                                categoryName = 'Accessoires-Dressing';
                                selectedProduitsList = [];
                                getselectedProduitsList(
                                    produitslist, categoryName);
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Produit(
                                              categoryName: categoryName,
                                              selectedProduitsList:
                                                  selectedProduitsList,
                                              selectedIndex: selectedIndex,
                                            )));
                              }
                              break;
                          }
                        });
                      },
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Container(
                              decoration: BoxDecoration(
                                color: Color(0xffb52632),
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(5.0),
                                  topLeft: Radius.circular(5.0),
                                ),
                              ),
                              padding: EdgeInsets.all(7),
                              child: new Center(
                                child: Text(
                                  (accessoireslist[index].name).toUpperCase(),
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 11,
                                      fontWeight: FontWeight.w600),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                            ClipRRect(
                              borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(5.0),
                                bottomLeft: Radius.circular(5.0),
                              ),
                              child: Image.asset(
                                accessoireslist[index].image,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ]),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return Padding(padding: EdgeInsets.all(3));
                  },
                ),
              ),
            ],
          ),
          // actions: <Widget>[
          //   Center(
          //     child: TextButton(
          //       style: TextButton.styleFrom(
          //         primary: Colors.white,
          //         backgroundColor: Color(0xffb52632),
          //         onSurface: Colors.grey[200],
          //       ),
          //       child: Text('click me'),
          //       onPressed: () {
          //         // test
          //       },
          //     ),
          //   ),
          // ],
        );
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // final theme = Theme.of(context).copyWith(dividerColor: Colors.transparent);

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: Colors.white,
        drawer: Theme(
          data: Theme.of(context).copyWith(
            canvasColor: Colors
                .grey[200], //This will change the drawer background to blue.
            //other styles
          ),
          child: Drawer(
            child: Stack(
              children: [
                ListView(
                  shrinkWrap: true,
                  children: <Widget>[
                    Container(
                      color: Colors.white,
                      padding: EdgeInsets.all(10),
                      height: 70,
                      child: Image.asset(
                        'assets/logocometa.png',
                        fit: BoxFit.contain,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Home()));
                      },
                      child: ListTile(
                        dense: true,
                        // width: ResponsiveFlutter.of(context).wp(78),
                        // padding: EdgeInsets.only(left: 15, top: 10, bottom: 10),
                        title: Text(
                          "Page D'accueil",
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w700,
                            color: Colors.grey[900],
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Presentation()));
                      },
                      child: ListTile(
                        dense: true,
                        // width: ResponsiveFlutter.of(context).wp(78),
                        // padding: EdgeInsets.only(left: 15, top: 10, bottom: 10),
                        title: Text(
                          "à".toUpperCase() + " propos",
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w700,
                            color: Colors.grey[900],
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setSelectToFalseInCategorieList();
                        categoryName = 'Porte et Automatisme';
                        selectedProduitsList = [];
                        getselectedProduitsList(produitslist, categoryName);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Produit(
                                      categoryName: categoryName,
                                      selectedProduitsList:
                                          selectedProduitsList,
                                      selectedIndex: 0,
                                    )));
                      },
                      child: ListTile(
                        dense: true,
                        // width: ResponsiveFlutter.of(context).wp(78),
                        // padding: EdgeInsets.only(left: 15, top: 10, bottom: 10),
                        title: Text(
                          'Produits',
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.grey[900],
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Nouveau()));
                      },
                      child: ListTile(
                        dense: true,
                        // width: ResponsiveFlutter.of(context).wp(78),
                        // padding: EdgeInsets.only(left: 15, top: 10, bottom: 10),
                        title: Text(
                          'Actualités',
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.grey[900],
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => GallerieVideos()));
                      },
                      child: ListTile(
                        dense: true,
                        title: Text(
                          "Gallerie vidéos",
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w700,
                            color: Colors.grey[900],
                          ),
                        ),
                      ),
                    ),
                    /*GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CataloguePdfViewer()));
                      },
                      child: ListTile(
                        dense: true,
                        title: Text(
                          "Notre Catalogue",
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w700,
                            color: Colors.grey[900],
                          ),
                        ),
                      ),
                    ),*/
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => BecomeFranchise()));
                      },
                      child: ListTile(
                        dense: true,
                        // width: ResponsiveFlutter.of(context).wp(78),
                        // padding: EdgeInsets.only(left: 15, top: 10, bottom: 10),
                        title: Text(
                          'Devenir franchisé',
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.grey[900],
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DemandeDevis()));
                      },
                      child: ListTile(
                        dense: true,
                        // width: ResponsiveFlutter.of(context).wp(78),
                        // padding: EdgeInsets.only(left: 15, top: 10, bottom: 10),
                        title: Text(
                          'Demander votre devis',
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.grey[900],
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PointsDeVentes()));
                      },
                      child: ListTile(
                        dense: true,
                        // width: ResponsiveFlutter.of(context).wp(78),
                        // padding: EdgeInsets.only(left: 15, top: 10, bottom: 10),
                        title: Text(
                          'Points De Ventes',
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.grey[900],
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Contact()));
                      },
                      child: ListTile(
                        dense: true,
                        // width: ResponsiveFlutter.of(context).wp(78),
                        // padding: EdgeInsets.only(left: 15, top: 10, bottom: 10),
                        title: Text(
                          "Contacter nous",
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w700,
                            color: Colors.grey[900],
                          ),
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(bottom: 65),
                    ),
                  ],
                ),
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: 0,
                  height: kToolbarHeight,
                  child: SocialMediaSubFooterWidget(),
                ),
              ],
            ),
          ),
        ),
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
                      Stack(
                        alignment: AlignmentDirectional.center,
                        children: [
                          Container(
                            width: double.infinity,
                            height: ResponsiveFlutter.of(context).hp(25),
                            // child: Image.asset('assets/acceuil.jpg',
                            //     fit: BoxFit.cover),
                            child: Carousel(
                              boxFit: BoxFit.cover,
                              autoplay: true,
                              animationCurve: Curves.fastOutSlowIn,
                              animationDuration: Duration(milliseconds: 1000),
                              dotSize: 6.0,
                              dotIncreasedColor: Consts.maincolor,
                              dotBgColor: Colors.transparent,
                              dotPosition: DotPosition.bottomCenter,
                              dotVerticalPadding: 10.0,
                              showIndicator: true,
                              indicatorBgPadding: 7.0,
                              images: [
                                ExactAssetImage("assets/home/home1.png"),
                                ExactAssetImage("assets/home/home2.jpg"),
                                ExactAssetImage("assets/home/home3.png"),
                                ExactAssetImage("assets/home/home4.jpg"),
                              ],
                            ),
                          ),
                          /* Center(
                            child: Container(
                              child: Text(
                                'KITCHENS, DRESSINGS & BATHROOMS.',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                            ),
                          ),*/
                        ],
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Presentation()));
                        },
                        child: Container(
                          padding: EdgeInsets.only(
                              top: 7, bottom: 7, left: 5, right: 5),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: ResponsiveFlutter.of(context).wp(35),
                                  height:
                                      ResponsiveFlutter.of(context).hp(25.5),
                                  child: Image.asset(
                                    'assets/presentation/couverture1.jpg',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Container(
                                  width: ResponsiveFlutter.of(context).wp(61),
                                  child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          padding: EdgeInsets.only(
                                              left: 5, right: 5, bottom: 5),
                                          child: AutoSizeText(
                                            'Cometa'.toUpperCase(),
                                            style: TextStyle(
                                              color: Consts.maincolor,
                                              fontWeight: FontWeight.bold,
                                            ),
                                            maxLines: 1,
                                            minFontSize: 13,
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.justify,
                                          ),
                                        ),
                                        Container(
                                          padding: EdgeInsets.only(
                                              left: 5, right: 10, bottom: 3),
                                          child: Text(
                                            // snapshot.data.text_1
                                            //     .toString(),
                                            "La société COMETA est crée en 1983. Depuis, elle n'a jamais cessé de diversifier ses produits et d'élargir la gamme de ses articles afin de satisfaire les besoins d'une clientèle constituée essentiellement de professionnels et de particuliers. La société COMETA est sise à Borj Louzir à 5 km du centre du capital et exploite un gigantesque parc de 2518 m², couronnée d’un Showroom de 1040 m² situé à la Zone Industrielle de Sidi Daoued, route de la Marsa et un showroom de 400m² situé à El M'nihla à 500 m de Géant",

                                            style: TextStyle(
                                                fontSize: 12, height: 1.3),
                                            maxLines: 7,
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.justify,
                                          ),
                                        ),
                                        Container(
                                          padding: EdgeInsets.only(
                                              left: 5, right: 5),
                                          height: ResponsiveFlutter.of(context)
                                              .hp(4.4),
                                          child: ButtonTheme(
                                            child: OutlinedButton(
                                              style: TextButton.styleFrom(
                                                primary: Colors.white,
                                                backgroundColor:
                                                    Consts.maincolor,
                                                onSurface: Colors.grey[200],
                                              ),
                                              child: Text(
                                                'Plus de détails',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 12,
                                                ),
                                              ),
                                              onPressed: () {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        Presentation(),
                                                  ),
                                                );
                                              },
                                            ),
                                          ),
                                        ),
                                      ]),
                                ),
                              ]),
                        ),

                        // By default, show a Chargement en cours spinner.
                        // return Container(
                        //   height: ResponsiveFlutter.of(context).hp(20),
                        //   child: Column(
                        //     mainAxisAlignment: MainAxisAlignment.center,
                        //     children: [
                        //       CircularProgressIndicator(
                        //         backgroundColor: Colors.transparent,
                        //         valueColor:
                        //             new AlwaysStoppedAnimation<Color>(
                        //                 Color(0xffb52632)),
                        //       ),
                        //       SizedBox(height: 20),
                        //       Text('Chargement en cours'),
                        //     ],
                        //   ),
                        // );
                      ),
                      Container(
                        color: Colors.grey[300],
                        padding: EdgeInsets.all(7.5),
                        child: Center(
                            child: RichText(
                          text: TextSpan(
                            text: 'Nos produits',
                            style: TextStyle(
                              color: Consts.maincolor,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                            children: <TextSpan>[
                              TextSpan(
                                  // text: '(Plus de 2000 Produit)',
                                  text: '',
                                  style: TextStyle(
                                    color: Colors.black87,
                                    fontSize: 12,
                                    fontWeight: FontWeight.normal,
                                  )),
                            ],
                          ),
                        )),
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                                child: SizedBox(
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height / 6.4,
                              child: Container(
                                //padding: EdgeInsets.only(top: 7.5, bottom: 7.5),
                                child: ListView.builder(
                                  physics: BouncingScrollPhysics(),
                                  scrollDirection: Axis.horizontal,
                                  itemCount: categorielist.length,
                                  /* shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          //    itemCount: categorielist.length,
                          itemCount: 12,
                          gridDelegate:
                              new SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                          ),*/
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            switch (index) {
                                              case 0:
                                                {
                                                  setSelectToFalseInCategorieList();
                                                  selectedIndex = index;
                                                  categoryName =
                                                      "Porte et automatisme";
                                                  selectedProduitsList = [];
                                                  getselectedProduitsList(
                                                      produitslist,
                                                      categoryName);
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              Produit(
                                                                categoryName:
                                                                    categoryName,
                                                                selectedProduitsList:
                                                                    selectedProduitsList,
                                                                selectedIndex:
                                                                    selectedIndex,
                                                              )));
                                                  /*selectedIndex = index;
                                        _showKitchenDialog(selectedIndex);*/
                                                }
                                                break;

                                              case 1:
                                                {
                                                  setSelectToFalseInCategorieList();
                                                  selectedIndex = index;
                                                  categoryName = 'Toles';
                                                  selectedProduitsList = [];
                                                  getselectedProduitsList(
                                                      produitslist,
                                                      categoryName);
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              Produit(
                                                                categoryName:
                                                                    categoryName,
                                                                selectedProduitsList:
                                                                    selectedProduitsList,
                                                                selectedIndex:
                                                                    selectedIndex,
                                                              )));
                                                }
                                                break;
                                              case 2:
                                                {
                                                  setSelectToFalseInCategorieList();
                                                  selectedIndex = index;
                                                  categoryName = 'Tubes';
                                                  selectedProduitsList = [];
                                                  getselectedProduitsList(
                                                      produitslist,
                                                      categoryName);
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              Produit(
                                                                categoryName:
                                                                    categoryName,
                                                                selectedProduitsList:
                                                                    selectedProduitsList,
                                                                selectedIndex:
                                                                    selectedIndex,
                                                              )));
                                                }
                                                break;
                                              case 3:
                                                {
                                                  setSelectToFalseInCategorieList();
                                                  selectedIndex = index;
                                                  categoryName =
                                                      'Fer Marchands';
                                                  selectedProduitsList = [];
                                                  getselectedProduitsList(
                                                      produitslist,
                                                      categoryName);
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              Produit(
                                                                categoryName:
                                                                    categoryName,
                                                                selectedProduitsList:
                                                                    selectedProduitsList,
                                                                selectedIndex:
                                                                    selectedIndex,
                                                              )));
                                                  /* selectedIndex = index;
                                        _showAccessoiresDialog(selectedIndex);*/
                                                }

                                                break;
                                              case 4:
                                                {
                                                  setSelectToFalseInCategorieList();
                                                  selectedIndex = index;
                                                  categoryName =
                                                      'Lames rideaux et Accessoires';
                                                  selectedProduitsList = [];
                                                  getselectedProduitsList(
                                                      produitslist,
                                                      categoryName);
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              Produit(
                                                                categoryName:
                                                                    categoryName,
                                                                selectedProduitsList:
                                                                    selectedProduitsList,
                                                                selectedIndex:
                                                                    selectedIndex,
                                                              )));
                                                  /* selectedIndex = index;
                                        _showAccessoiresDialog(selectedIndex);*/
                                                }
                                                break;
                                              case 5:
                                                {
                                                  setSelectToFalseInCategorieList();
                                                  selectedIndex = index;
                                                  categoryName =
                                                      'Accessoires porte';
                                                  selectedProduitsList = [];
                                                  getselectedProduitsList(
                                                      produitslist,
                                                      categoryName);
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              Produit(
                                                                categoryName:
                                                                    categoryName,
                                                                selectedProduitsList:
                                                                    selectedProduitsList,
                                                                selectedIndex:
                                                                    selectedIndex,
                                                              )));
                                                  /* selectedIndex = index;
                                        _showAccessoiresDialog(selectedIndex);*/
                                                }
                                                break;
                                              case 6:
                                                {
                                                  setSelectToFalseInCategorieList();
                                                  selectedIndex = index;
                                                  categoryName = 'Décoration';
                                                  selectedProduitsList = [];
                                                  getselectedProduitsList(
                                                      produitslist,
                                                      categoryName);
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              Produit(
                                                                categoryName:
                                                                    categoryName,
                                                                selectedProduitsList:
                                                                    selectedProduitsList,
                                                                selectedIndex:
                                                                    selectedIndex,
                                                              )));
                                                  /* selectedIndex = index;
                                        _showAccessoiresDialog(selectedIndex);*/
                                                }
                                                break;
                                              case 7:
                                                {
                                                  setSelectToFalseInCategorieList();
                                                  selectedIndex = index;
                                                  categoryName = 'Couverture';
                                                  selectedProduitsList = [];
                                                  getselectedProduitsList(
                                                      produitslist,
                                                      categoryName);
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              Produit(
                                                                categoryName:
                                                                    categoryName,
                                                                selectedProduitsList:
                                                                    selectedProduitsList,
                                                                selectedIndex:
                                                                    selectedIndex,
                                                              )));
                                                  /* selectedIndex = index;
                                        _showAccessoiresDialog(selectedIndex);*/
                                                }
                                                break;
                                              case 8:
                                                {
                                                  setSelectToFalseInCategorieList();
                                                  selectedIndex = index;
                                                  categoryName =
                                                      'Polycarbonate';
                                                  selectedProduitsList = [];
                                                  getselectedProduitsList(
                                                      produitslist,
                                                      categoryName);
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              Produit(
                                                                categoryName:
                                                                    categoryName,
                                                                selectedProduitsList:
                                                                    selectedProduitsList,
                                                                selectedIndex:
                                                                    selectedIndex,
                                                              )));
                                                  /* selectedIndex = index;
                                        _showAccessoiresDialog(selectedIndex);*/
                                                }
                                                break;
                                              case 9:
                                                {
                                                  setSelectToFalseInCategorieList();
                                                  selectedIndex = index;
                                                  categoryName =
                                                      'Quincaillerie';
                                                  selectedProduitsList = [];
                                                  getselectedProduitsList(
                                                      produitslist,
                                                      categoryName);
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              Produit(
                                                                categoryName:
                                                                    categoryName,
                                                                selectedProduitsList:
                                                                    selectedProduitsList,
                                                                selectedIndex:
                                                                    selectedIndex,
                                                              )));
                                                  /* selectedIndex = index;
                                        _showAccessoiresDialog(selectedIndex);*/
                                                }
                                                break;
                                              case 10:
                                                {
                                                  setSelectToFalseInCategorieList();
                                                  selectedIndex = index;
                                                  categoryName = 'Outillage';
                                                  selectedProduitsList = [];
                                                  getselectedProduitsList(
                                                      produitslist,
                                                      categoryName);
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              Produit(
                                                                categoryName:
                                                                    categoryName,
                                                                selectedProduitsList:
                                                                    selectedProduitsList,
                                                                selectedIndex:
                                                                    selectedIndex,
                                                              )));
                                                  /* selectedIndex = index;
                                        _showAccessoiresDialog(selectedIndex);*/
                                                }
                                                break;
                                              case 11:
                                                {
                                                  setSelectToFalseInCategorieList();
                                                  selectedIndex = index;
                                                  categoryName =
                                                      'Equipement Bosch';
                                                  selectedProduitsList = [];
                                                  getselectedProduitsList(
                                                      produitslist,
                                                      categoryName);
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              Produit(
                                                                categoryName:
                                                                    categoryName,
                                                                selectedProduitsList:
                                                                    selectedProduitsList,
                                                                selectedIndex:
                                                                    selectedIndex,
                                                              )));
                                                  /* selectedIndex = index;
                                        _showAccessoiresDialog(selectedIndex);*/
                                                }
                                                break;
                                              default:
                                                setSelectToFalseInCategorieList();
                                                selectedIndex = index;
                                                categoryName =
                                                    'Equipement Bosch';
                                                selectedProduitsList = [];
                                                getselectedProduitsList(
                                                    produitslist, categoryName);
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            Produit(
                                                              categoryName:
                                                                  categoryName,
                                                              selectedProduitsList:
                                                                  selectedProduitsList,
                                                              selectedIndex:
                                                                  selectedIndex,
                                                            )));
                                                /* selectedIndex = index;
                                        _showKitchenDialog(selectedIndex);*/
                                                break;
                                            }
                                          });
                                        },
                                        child: Row(
                                          children: [
                                            Container(
                                              margin: const EdgeInsets.all(3.0),
                                              width: 100,
                                              child: Stack(
                                                children: <Widget>[
                                                  Container(
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.only(
                                                        bottomLeft:
                                                            Radius.circular(
                                                                3.0),
                                                        bottomRight:
                                                            Radius.circular(
                                                                3.0),
                                                        topRight:
                                                            Radius.circular(
                                                                3.0),
                                                        topLeft:
                                                            Radius.circular(
                                                                3.0),
                                                      ),
                                                      image: DecorationImage(
                                                        fit: BoxFit.fill,
                                                        image:
                                                            categorielist[index]
                                                                .image,
                                                      ),
                                                    ),
                                                  ),
                                                  Container(
                                                    padding:
                                                        EdgeInsets.all(5.0),
                                                    alignment:
                                                        Alignment.bottomCenter,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.only(
                                                        bottomLeft:
                                                            Radius.circular(
                                                                3.0),
                                                        bottomRight:
                                                            Radius.circular(
                                                                3.0),
                                                        topRight:
                                                            Radius.circular(
                                                                3.0),
                                                        topLeft:
                                                            Radius.circular(
                                                                3.0),
                                                      ),
                                                      gradient: LinearGradient(
                                                        begin:
                                                            Alignment.topCenter,
                                                        end: Alignment
                                                            .bottomCenter,
                                                        colors: <Color>[
                                                          Colors.black
                                                              .withAlpha(0),
                                                          Colors.black12,
                                                          Colors.black26,
                                                          Colors.black38,
                                                        ],
                                                      ),
                                                    ),
                                                    child: Text(
                                                      categorielist[index].name,
                                                      style: TextStyle(
                                                        color: Colors.amber[50],
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize: 12,
                                                      ),
                                                      maxLines: 2,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      textAlign:
                                                          TextAlign.center,
                                                      textWidthBasis:
                                                          TextWidthBasis.parent,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        )

                                        /*Container(
                                padding: EdgeInsets.all(2.5),
                                child: Stack(
                                  children: <Widget>[
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(3.0),
                                          bottomRight: Radius.circular(3.0),
                                          topRight: Radius.circular(3.0),
                                          topLeft: Radius.circular(3.0),
                                        ),
                                        image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: categorielist[index].image,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.all(3.0),
                                      alignment: Alignment.bottomCenter,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(3.0),
                                          bottomRight: Radius.circular(3.0),
                                          topRight: Radius.circular(3.0),
                                          topLeft: Radius.circular(3.0),
                                        ),
                                        gradient: LinearGradient(
                                          begin: Alignment.center,
                                          end: Alignment.bottomCenter,
                                          colors: <Color>[
                                            Colors.black.withAlpha(0),
                                            Colors.black54,
                                            Colors.black
                                          ],
                                        ),
                                      ),
                                      child: Text(
                                        categorielist[index].name,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 11,
                                        ),
                                        maxLines: 3,
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ],
                                ),
                              ),*/
                                        );
                                  },
                                ),
                              ),
                            ))
                          ])
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

/*
GridView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          //    itemCount: categorielist.length,
                          itemCount: 12,
                          gridDelegate:
                              new SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                          ),
                          itemBuilder: (BuildContext context, int index) {
                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  switch (index) {
                                    case 0:
                                      {
                                        setSelectToFalseInCategorieList();
                                        selectedIndex = index;
                                        categoryName = 'porte-et-automatisme';
                                        selectedProduitsList = [];
                                        getselectedProduitsList(
                                            produitslist, categoryName);
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => Produit(
                                                      categoryName:
                                                          categoryName,
                                                      selectedProduitsList:
                                                          selectedProduitsList,
                                                      selectedIndex:
                                                          selectedIndex,
                                                    )));
                                        /*selectedIndex = index;
                                        _showKitchenDialog(selectedIndex);*/
                                      }
                                      break;

                                    case 1:
                                      {
                                        setSelectToFalseInCategorieList();
                                        selectedIndex = index;
                                        categoryName = 'toles';
                                        selectedProduitsList = [];
                                        getselectedProduitsList(
                                            produitslist, categoryName);
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => Produit(
                                                      categoryName:
                                                          categoryName,
                                                      selectedProduitsList:
                                                          selectedProduitsList,
                                                      selectedIndex:
                                                          selectedIndex,
                                                    )));
                                      }
                                      break;
                                    case 2:
                                      {
                                        setSelectToFalseInCategorieList();
                                        selectedIndex = index;
                                        categoryName = 'tubes';
                                        selectedProduitsList = [];
                                        getselectedProduitsList(
                                            produitslist, categoryName);
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => Produit(
                                                      categoryName:
                                                          categoryName,
                                                      selectedProduitsList:
                                                          selectedProduitsList,
                                                      selectedIndex:
                                                          selectedIndex,
                                                    )));
                                      }
                                      break;
                                    case 3:
                                      {
                                        setSelectToFalseInCategorieList();
                                        selectedIndex = index;
                                        categoryName = 'fer-marchands';
                                        selectedProduitsList = [];
                                        getselectedProduitsList(
                                            produitslist, categoryName);
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => Produit(
                                                      categoryName:
                                                          categoryName,
                                                      selectedProduitsList:
                                                          selectedProduitsList,
                                                      selectedIndex:
                                                          selectedIndex,
                                                    )));
                                        /* selectedIndex = index;
                                        _showAccessoiresDialog(selectedIndex);*/
                                      }

                                      break;
                                    case 4:
                                      {
                                        setSelectToFalseInCategorieList();
                                        selectedIndex = index;
                                        categoryName =
                                            'lames rideaux et accessoires';
                                        selectedProduitsList = [];
                                        getselectedProduitsList(
                                            produitslist, categoryName);
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => Produit(
                                                      categoryName:
                                                          categoryName,
                                                      selectedProduitsList:
                                                          selectedProduitsList,
                                                      selectedIndex:
                                                          selectedIndex,
                                                    )));
                                        /* selectedIndex = index;
                                        _showAccessoiresDialog(selectedIndex);*/
                                      }
                                      break;
                                    case 5:
                                      {
                                        setSelectToFalseInCategorieList();
                                        selectedIndex = index;
                                        categoryName = 'accessoires porte';
                                        selectedProduitsList = [];
                                        getselectedProduitsList(
                                            produitslist, categoryName);
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => Produit(
                                                      categoryName:
                                                          categoryName,
                                                      selectedProduitsList:
                                                          selectedProduitsList,
                                                      selectedIndex:
                                                          selectedIndex,
                                                    )));
                                        /* selectedIndex = index;
                                        _showAccessoiresDialog(selectedIndex);*/
                                      }
                                      break;
                                    case 6:
                                      {
                                        setSelectToFalseInCategorieList();
                                        selectedIndex = index;
                                        categoryName = 'decoration';
                                        selectedProduitsList = [];
                                        getselectedProduitsList(
                                            produitslist, categoryName);
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => Produit(
                                                      categoryName:
                                                          categoryName,
                                                      selectedProduitsList:
                                                          selectedProduitsList,
                                                      selectedIndex:
                                                          selectedIndex,
                                                    )));
                                        /* selectedIndex = index;
                                        _showAccessoiresDialog(selectedIndex);*/
                                      }
                                      break;
                                    case 7:
                                      {
                                        setSelectToFalseInCategorieList();
                                        selectedIndex = index;
                                        categoryName = 'couverture';
                                        selectedProduitsList = [];
                                        getselectedProduitsList(
                                            produitslist, categoryName);
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => Produit(
                                                      categoryName:
                                                          categoryName,
                                                      selectedProduitsList:
                                                          selectedProduitsList,
                                                      selectedIndex:
                                                          selectedIndex,
                                                    )));
                                        /* selectedIndex = index;
                                        _showAccessoiresDialog(selectedIndex);*/
                                      }
                                      break;
                                    case 8:
                                      {
                                        setSelectToFalseInCategorieList();
                                        selectedIndex = index;
                                        categoryName = 'polycarbonate';
                                        selectedProduitsList = [];
                                        getselectedProduitsList(
                                            produitslist, categoryName);
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => Produit(
                                                      categoryName:
                                                          categoryName,
                                                      selectedProduitsList:
                                                          selectedProduitsList,
                                                      selectedIndex:
                                                          selectedIndex,
                                                    )));
                                        /* selectedIndex = index;
                                        _showAccessoiresDialog(selectedIndex);*/
                                      }
                                      break;
                                    case 9:
                                      {
                                        setSelectToFalseInCategorieList();
                                        selectedIndex = index;
                                        categoryName = 'quincaillerie';
                                        selectedProduitsList = [];
                                        getselectedProduitsList(
                                            produitslist, categoryName);
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => Produit(
                                                      categoryName:
                                                          categoryName,
                                                      selectedProduitsList:
                                                          selectedProduitsList,
                                                      selectedIndex:
                                                          selectedIndex,
                                                    )));
                                        /* selectedIndex = index;
                                        _showAccessoiresDialog(selectedIndex);*/
                                      }
                                      break;
                                    case 10:
                                      {
                                        setSelectToFalseInCategorieList();
                                        selectedIndex = index;
                                        categoryName = 'outillage';
                                        selectedProduitsList = [];
                                        getselectedProduitsList(
                                            produitslist, categoryName);
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => Produit(
                                                      categoryName:
                                                          categoryName,
                                                      selectedProduitsList:
                                                          selectedProduitsList,
                                                      selectedIndex:
                                                          selectedIndex,
                                                    )));
                                        /* selectedIndex = index;
                                        _showAccessoiresDialog(selectedIndex);*/
                                      }
                                      break;
                                    case 11:
                                      {
                                        setSelectToFalseInCategorieList();
                                        selectedIndex = index;
                                        categoryName = 'equipement bosch';
                                        selectedProduitsList = [];
                                        getselectedProduitsList(
                                            produitslist, categoryName);
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => Produit(
                                                      categoryName:
                                                          categoryName,
                                                      selectedProduitsList:
                                                          selectedProduitsList,
                                                      selectedIndex:
                                                          selectedIndex,
                                                    )));
                                        /* selectedIndex = index;
                                        _showAccessoiresDialog(selectedIndex);*/
                                      }
                                      break;
                                    default:
                                      selectedIndex = index;
                                      _showKitchenDialog(selectedIndex);
                                      break;
                                  }
                                });
                              },
                              child: Container(
                                padding: EdgeInsets.all(2.5),
                                child: Stack(
                                  children: <Widget>[
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(3.0),
                                          bottomRight: Radius.circular(3.0),
                                          topRight: Radius.circular(3.0),
                                          topLeft: Radius.circular(3.0),
                                        ),
                                        image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: categorielist[index].image,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.all(3.0),
                                      alignment: Alignment.bottomCenter,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(3.0),
                                          bottomRight: Radius.circular(3.0),
                                          topRight: Radius.circular(3.0),
                                          topLeft: Radius.circular(3.0),
                                        ),
                                        gradient: LinearGradient(
                                          begin: Alignment.center,
                                          end: Alignment.bottomCenter,
                                          colors: <Color>[
                                            Colors.black.withAlpha(0),
                                            Colors.black54,
                                            Colors.black
                                          ],
                                        ),
                                      ),
                                      child: Text(
                                        categorielist[index].name,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 11,
                                        ),
                                        maxLines: 3,
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),*/
