import 'package:cometa_flutter/Consts/consts.dart';
import 'package:cometa_flutter/Models/produitModels/ProduitModel.dart';
import 'package:cometa_flutter/Repositories/produitRepositories/ProduitsRepository.dart';
import 'package:cometa_flutter/screens/homeScreens/Home.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cometa_flutter/screens/shared/BaseAppBar.dart';
import 'package:cometa_flutter/screens/shared/categorieList.dart';
import 'package:cometa_flutter/screens/shared/contactUsFooterWidget.dart';
import 'package:cometa_flutter/screens/shared/socialMediaSubFooterWidget.dart';
import 'package:flutter/material.dart';
import 'package:responsive_flutter/responsive_flutter.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'productDetails.dart';

class Produit extends StatefulWidget {
  final String categoryName;
  final List selectedProduitsList;
  final int selectedIndex;

  const Produit(
      {Key key,
      this.categoryName,
      this.selectedProduitsList,
      this.selectedIndex})
      : super(key: key);
  @override
  _ProduitState createState() => _ProduitState();
}

class _ProduitState extends State<Produit> {
  bool isLoading = false;
  List<ProduitModel> produitslist = [];
  List<ProduitModel> selectedProduitsList = [];
  final TextEditingController largeurController = TextEditingController();
  final TextEditingController hauteurController = TextEditingController();
  final TextEditingController quantiteController = TextEditingController();
  final TextEditingController nomEtPrenomController = TextEditingController();
  final TextEditingController telController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  @override
  void initState() {
    super.initState();
    categoryName = widget.categoryName;
    selectedProduitsList = widget.selectedProduitsList;
    selectedIndex = widget.selectedIndex;
    produitsList();
    categorielist[selectedIndex].isSelected =
        !categorielist[selectedIndex].isSelected;
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

  List<ProduitModel> getselectedProduitsList(
      List produitslist, String categorieName) {
    produitslist
      ..forEach((element) {
        if (element.categorie == categoryName) {
          selectedProduitsList = selectedProduitsList + [element];
          print('the selected product list is : ' + '$selectedProduitsList');
        }
      });
    return selectedProduitsList;
  }

  setSelectToFalseInCategorieList() {
    categorielist
      ..forEach((element) {
        element.isSelected = false;
      });
  }

  @override
  void dispose() {
    super.dispose();
    largeurController.dispose();
    hauteurController.dispose();
    quantiteController.dispose();
    nomEtPrenomController.dispose();
    telController.dispose();
    emailController.dispose();
  }

  Future<void> _showKitchensDialog() async {
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
                            categoryName = 'Kitchen-supreme-massif';
                            selectedProduitsList = [];
                            getselectedProduitsList(produitslist, categoryName);
                            Navigator.pop(context);
                          }
                          break;

                        case 1:
                          {
                            categoryName = 'Kitchen-crystal-laque';
                            selectedProduitsList = [];
                            getselectedProduitsList(produitslist, categoryName);
                            Navigator.pop(context);
                          }
                          break;
                        case 2:
                          {
                            categoryName = 'Kitchen-flex-stratfie';
                            selectedProduitsList = [];
                            getselectedProduitsList(produitslist, categoryName);
                            Navigator.pop(context);
                          }
                          break;
                        case 3:
                          {
                            categoryName = 'Kitchen-gloss';
                            selectedProduitsList = [];
                            getselectedProduitsList(produitslist, categoryName);
                            Navigator.pop(context);
                          }
                          break;
                        default:
                          {
                            categoryName = 'Kitchen-gloss';
                            selectedProduitsList = [];
                            getselectedProduitsList(produitslist, categoryName);
                            Navigator.pop(context);
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
        );
      },
    );
  }

  Future<void> _showAccessoiresDialog() async {
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
                                categoryName = 'Accessoires-Kitchen';
                                selectedProduitsList = [];
                                getselectedProduitsList(
                                    produitslist, categoryName);
                                Navigator.pop(context);
                              }
                              break;

                            case 1:
                              {
                                categoryName = 'Accessoires-Dressing';
                                selectedProduitsList = [];
                                getselectedProduitsList(
                                    produitslist, categoryName);
                                Navigator.pop(context);
                              }
                              break;
                            default:
                              {
                                categoryName = 'Accessoires-Dressing';
                                selectedProduitsList = [];
                                getselectedProduitsList(
                                    produitslist, categoryName);
                                Navigator.pop(context);
                              }
                              break;
                          }
                        });
                      },
                      child: Column(
                          mainAxisSize: MainAxisSize.min,
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
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: BaseAppBar(
          appBar: AppBar(),
        ),
        body: Column(
          children: [
            Container(
              color: Colors.white,
              padding: EdgeInsets.only(top: 10),
              height: 109,
              child: Container(
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  physics: BouncingScrollPhysics(),
                  // padding: EdgeInsets.only(top: 5, bottom: 5),
                  itemCount: categorielist.length,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          switch (index) {
                            case 0:
                              {
                                setSelectToFalseInCategorieList();
                                categoryName = 'Porte et automatisme';
                                selectedProduitsList = [];
                                getselectedProduitsList(
                                    produitslist, categoryName);
                                /*setSelectToFalseInCategorieList();
                                _showKitchensDialog();*/
                                // if this item isn't selected yet, "isSelected": false -> true
                                // If this item already is selected: "isSelected": true -> false
                                setState(
                                  () {
                                    categorielist[index].isSelected =
                                        !categorielist[index].isSelected;
                                  },
                                );
                              }
                              break;
                            case 1:
                              {
                                setSelectToFalseInCategorieList();
                                categoryName = 'Toles';
                                selectedProduitsList = [];
                                getselectedProduitsList(
                                    produitslist, categoryName);
                                setState(
                                  () {
                                    categorielist[index].isSelected =
                                        !categorielist[index].isSelected;
                                  },
                                );
                              }
                              break;
                            case 2:
                              {
                                setSelectToFalseInCategorieList();
                                categoryName = 'Tubes';
                                selectedProduitsList = [];
                                getselectedProduitsList(
                                    produitslist, categoryName);
                                setState(
                                  () {
                                    categorielist[index].isSelected =
                                        !categorielist[index].isSelected;
                                  },
                                );
                              }
                              break;
                            case 3:
                              {
                                setSelectToFalseInCategorieList();
                                categoryName = 'Fer Marchands';
                                selectedProduitsList = [];
                                getselectedProduitsList(
                                    produitslist, categoryName);
                                /*setSelectToFalseInCategorieList();
                                _showAccessoiresDialog();*/
                                setState(
                                  () {
                                    categorielist[index].isSelected =
                                        !categorielist[index].isSelected;
                                  },
                                );
                              }
                              break;
                            case 4:
                              {
                                setSelectToFalseInCategorieList();
                                categoryName = 'Lames rideaux et Accessoires';
                                selectedProduitsList = [];
                                getselectedProduitsList(
                                    produitslist, categoryName);
                                /*setSelectToFalseInCategorieList();
                                _showAccessoiresDialog();*/
                                setState(
                                  () {
                                    categorielist[index].isSelected =
                                        !categorielist[index].isSelected;
                                  },
                                );
                              }
                              break;
                            case 5:
                              {
                                setSelectToFalseInCategorieList();
                                categoryName = 'Accessoires portes';
                                selectedProduitsList = [];
                                getselectedProduitsList(
                                    produitslist, categoryName);
                                /*setSelectToFalseInCategorieList();
                                _showAccessoiresDialog();*/
                                setState(
                                  () {
                                    categorielist[index].isSelected =
                                        !categorielist[index].isSelected;
                                  },
                                );
                              }
                              break;
                            case 6:
                              {
                                setSelectToFalseInCategorieList();
                                categoryName = 'Décoration';
                                selectedProduitsList = [];
                                getselectedProduitsList(
                                    produitslist, categoryName);
                                /*setSelectToFalseInCategorieList();
                                _showAccessoiresDialog();*/
                                setState(
                                  () {
                                    categorielist[index].isSelected =
                                        !categorielist[index].isSelected;
                                  },
                                );
                              }
                              break;
                            case 7:
                              {
                                setSelectToFalseInCategorieList();
                                categoryName = 'Couverture';
                                selectedProduitsList = [];
                                getselectedProduitsList(
                                    produitslist, categoryName);
                                /*setSelectToFalseInCategorieList();
                                _showAccessoiresDialog();*/
                                setState(
                                  () {
                                    categorielist[index].isSelected =
                                        !categorielist[index].isSelected;
                                  },
                                );
                              }
                              break;
                            case 8:
                              {
                                setSelectToFalseInCategorieList();
                                categoryName = 'Polycarbonate';
                                selectedProduitsList = [];
                                getselectedProduitsList(
                                    produitslist, categoryName);
                                /*setSelectToFalseInCategorieList();
                                _showAccessoiresDialog();*/
                                setState(
                                  () {
                                    categorielist[index].isSelected =
                                        !categorielist[index].isSelected;
                                  },
                                );
                              }
                              break;
                            case 9:
                              {
                                setSelectToFalseInCategorieList();
                                categoryName = 'Quincaillerie';
                                selectedProduitsList = [];
                                getselectedProduitsList(
                                    produitslist, categoryName);
                                /*setSelectToFalseInCategorieList();
                                _showAccessoiresDialog();*/
                                setState(
                                  () {
                                    categorielist[index].isSelected =
                                        !categorielist[index].isSelected;
                                  },
                                );
                              }
                              break;
                            case 10:
                              {
                                setSelectToFalseInCategorieList();
                                categoryName = 'Outillage';
                                selectedProduitsList = [];
                                getselectedProduitsList(
                                    produitslist, categoryName);
                                /*setSelectToFalseInCategorieList();
                                _showAccessoiresDialog();*/
                                setState(
                                  () {
                                    categorielist[index].isSelected =
                                        !categorielist[index].isSelected;
                                  },
                                );
                              }
                              break;
                            case 11:
                              {
                                setSelectToFalseInCategorieList();
                                categoryName = 'Equipement Bosch';
                                selectedProduitsList = [];
                                getselectedProduitsList(
                                    produitslist, categoryName);
                                /*setSelectToFalseInCategorieList();
                                _showAccessoiresDialog();*/
                                setState(
                                  () {
                                    categorielist[index].isSelected =
                                        !categorielist[index].isSelected;
                                  },
                                );
                              }
                              break;
                            default:
                              {
                                /*setSelectToFalseInCategorieList();
                                _showKitchensDialog();*/
                                setState(
                                  () {
                                    categorielist[index].isSelected =
                                        !categorielist[index].isSelected;
                                  },
                                );
                              }
                              break;
                          }
                        });
                      },
                      child: AnimatedContainer(
                        // Define how long the animation should take.
                        duration: Duration(seconds: 1),
                        // Provide an optional curve to make the animation feel smoother.
                        curve: Curves.fastOutSlowIn,
                        width: ResponsiveFlutter.of(context).wp(24),
                        child: Column(
                          children: [
                            Container(
                              padding: EdgeInsets.only(bottom: 5),
                              child: CircleAvatar(
                                //backgroundColor: Colors.blueAccent,
                                maxRadius:
                                    categorielist[index].isSelected == true
                                        ? 35
                                        : 30,
                                backgroundImage: categorielist[index].image,
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(left: 5, right: 5),
                              child: Center(
                                child: AutoSizeText(
                                  categorielist[index].name,
                                  style: TextStyle(
                                    color: Consts.maincolor,
                                    fontWeight: FontWeight.bold,
                                    //fontSize: 11
                                  ),
                                  maxLines: 2,
                                  minFontSize:
                                      categorielist[index].isSelected == true
                                          ? 10
                                          : 10,
                                  maxFontSize:
                                      categorielist[index].isSelected == true
                                          ? 10
                                          : 10,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            Divider(
              height: 5,
              thickness: 0,
              color: Consts.maincolor,
            ),
            Expanded(
              child: isLoading
                  ? Center(
                      child: CircularProgressIndicator(
                        backgroundColor: Colors.transparent,
                        valueColor:
                            new AlwaysStoppedAnimation<Color>(Consts.maincolor),
                      ),
                    )
                  : SingleChildScrollView(
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.only(left: 5, right: 5),
                            child: GridView.builder(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: selectedProduitsList.length,
                              gridDelegate:
                                  new SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                              ),
                              itemBuilder: (BuildContext context, int index) {
                                return GestureDetector(
                                  onTap: () async {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => ProductDetails(
                                          selectedProduitslist:
                                              selectedProduitsList,
                                          index: index,
                                        ),
                                      ),
                                    );
                                  },
                                  child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: <Widget>[
                                        Expanded(
                                          child: Container(
                                            margin: EdgeInsets.only(
                                                left: 10, right: 10, top: 10),
                                            child: CachedNetworkImage(
                                              imageUrl:
                                                  selectedProduitsList[index]
                                                      .images[0],
                                              fit: BoxFit.cover,
                                              progressIndicatorBuilder:
                                                  (context, url,
                                                          downloadProgress) =>
                                                      Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  CircularProgressIndicator(
                                                      backgroundColor:
                                                          Colors.transparent,
                                                      valueColor:
                                                          new AlwaysStoppedAnimation<
                                                                  Color>(
                                                              Consts.maincolor),
                                                      value: downloadProgress
                                                          .progress),
                                                ],
                                              ),
                                              errorWidget:
                                                  (context, url, error) =>
                                                      Icon(Icons.error),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          color: Colors.grey[200],
                                          padding: EdgeInsets.only(top: 4),
                                          margin: EdgeInsets.only(
                                              left: 10, right: 10),
                                          child: new Center(
                                            child: Text(
                                              (selectedProduitsList[index]
                                                      .titre)
                                                  .toUpperCase(),
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 11,
                                                  fontWeight: FontWeight.w600),
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(
                                              left: 10, right: 10),
                                          padding: EdgeInsets.only(bottom: 3),
                                          height: 30,
                                          decoration: BoxDecoration(
                                            color: Colors.grey[200],
                                            borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(3.0),
                                              bottomRight: Radius.circular(3.0),
                                            ),
                                          ),
                                          child: Center(
                                            child: ButtonTheme(
                                              child: TextButton(
                                                child: Text(
                                                  'Plus de détails',
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w600),
                                                ),
                                                style: TextButton.styleFrom(
                                                  primary: Colors.white,
                                                  backgroundColor:
                                                      Consts.maincolor,
                                                  onSurface: Colors.grey[200],
                                                ),
                                                onPressed: () {
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) =>
                                                          ProductDetails(
                                                        selectedProduitslist:
                                                            selectedProduitsList,
                                                        index: index,
                                                      ),
                                                    ),
                                                  );
                                                },
                                              ),
                                            ),
                                          ),
                                        ),
                                      ]),
                                );
                              },
                            ),
                          ),
                        ],
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
