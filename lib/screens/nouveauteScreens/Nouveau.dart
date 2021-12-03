import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:cometa_flutter/Consts/consts.dart';
import 'package:cometa_flutter/screens/shared/BaseAppBar.dart';
import 'package:cometa_flutter/screens/shared/contactUsFooterWidget.dart';
import 'package:cometa_flutter/screens/shared/socialMediaSubFooterWidget.dart';
import 'package:flutter/material.dart';
import 'package:responsive_flutter/responsive_flutter.dart';
import '../../Models/NouveautesModel.dart';
import '../../Repositories/nouveauteRepositories/NouveauteRepository.dart';

class Nouveau extends StatefulWidget {
  @override
  _NouveauState createState() => _NouveauState();
}

class _NouveauState extends State<Nouveau> {
  List<NouveauteModel> nouveauteslist = [];

  bool isLoading = false;
  @override
  void initState() {
    super.initState();
    nouveautesList();
  }

  nouveautesList() async {
    print("portesList");
    this.setState(() {
      isLoading = true;
    });
    var response = await NouveautesRepository().nouveautesList();
    print(response);
    setState(() {
      isLoading = false;
      nouveauteslist = response;
    });
  }

  @override
  void dispose() {
    super.dispose();
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
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  child: Center(
                    child: Column(
                      children: <Widget>[
                        Container(
                          width: ResponsiveFlutter.of(context).wp(100),
                          height: ResponsiveFlutter.of(context).hp(24),
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
                            // images: getImages1list(
                            //     snapshot.data.images1),
                            images: [
                              /* ExactAssetImage(
                                  "assets/presentation/couverture.png"),*/
                              ExactAssetImage("assets/home/home1.png"),
                              ExactAssetImage("assets/home/home2.jpg"),
                              ExactAssetImage("assets/home/home3.png"),
                              ExactAssetImage("assets/home/home4.jpg"),
                            ],
                          ),
                        ),
                        Container(
                          color: Colors.grey[300],
                          padding: EdgeInsets.all(8),
                          child: Center(
                              child: RichText(
                            text: TextSpan(
                              text: 'Actualités :'.toUpperCase(),
                              style: TextStyle(
                                color: Colors.black87,
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          )),
                        ),
                        isLoading
                            ? Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    height:
                                        ResponsiveFlutter.of(context).hp(20),
                                  ),
                                  CircularProgressIndicator(
                                    backgroundColor: Colors.transparent,
                                    valueColor:
                                        new AlwaysStoppedAnimation<Color>(
                                            Consts.maincolor),
                                  ),
                                  SizedBox(height: 30),
                                  Text('Chargement en cours'),
                                ],
                              )
                            : ListView.separated(
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                padding: const EdgeInsets.only(
                                    left: 10, right: 10, top: 8, bottom: 20),
                                itemCount: nouveauteslist.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return Container(
                                    width:
                                        ResponsiveFlutter.of(context).wp(100),
                                    decoration: BoxDecoration(
                                      color: Colors.grey[200],
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(8.0),
                                        topRight: Radius.circular(8.0),
                                        bottomLeft: Radius.circular(8.0),
                                        bottomRight: Radius.circular(8.0),
                                      ),
                                    ),
                                    child: GestureDetector(
                                      // onTap: () {
                                      //   Navigator.pushReplacement(
                                      //       context,
                                      //       MaterialPageRoute(
                                      //           builder: (context) => ProjectDetails()));
                                      // },
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: <Widget>[
                                          Container(
                                            padding: EdgeInsets.all(7),
                                            color: Colors.grey[200],
                                            child: new Center(
                                              child: Text(
                                                (nouveauteslist[index].titre)
                                                    .toUpperCase(),
                                                style: TextStyle(
                                                    color: Consts.maincolor,
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.bold),
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                          ),
                                          Container(
                                            width: ResponsiveFlutter.of(context)
                                                .wp(100),
                                            child: CachedNetworkImage(
                                              imageUrl:
                                                  nouveauteslist[index].image,
                                              fit: BoxFit.contain,
                                              progressIndicatorBuilder:
                                                  (context, url,
                                                          downloadProgress) =>
                                                      Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Container(
                                                    child: CircularProgressIndicator(
                                                        backgroundColor:
                                                            Colors.transparent,
                                                        valueColor:
                                                            new AlwaysStoppedAnimation<
                                                                    Color>(
                                                                Consts
                                                                    .maincolor),
                                                        value: downloadProgress
                                                            .progress),
                                                  ),
                                                ],
                                              ),
                                              errorWidget:
                                                  (context, url, error) =>
                                                      Icon(Icons.error),
                                            ),
                                          ),
                                          Container(
                                            color: Colors.grey[200],
                                            padding: EdgeInsets.only(
                                                left: 8, right: 8, top: 10),
                                            child: Container(
                                              child: Text(
                                                nouveauteslist[index]
                                                    .texte
                                                    .toString(),
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 13,
                                                    height: 1.4),
                                                maxLines: 6,
                                                textAlign: TextAlign.justify,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ),
                                          ),
                                          Container(
                                            color: Colors.grey[200],
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                Container(
                                                  padding: EdgeInsets.only(
                                                      bottom: 5, right: 7),
                                                  child: new Center(
                                                    child: Text(
                                                      'LE : ' +
                                                          nouveauteslist[index]
                                                              .creeLe
                                                              .toUpperCase(),
                                                      style: TextStyle(
                                                          color:
                                                              Consts.maincolor,
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                      textAlign:
                                                          TextAlign.center,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                                separatorBuilder:
                                    (BuildContext context, int index) {
                                  return Divider(
                                    color: Consts.maincolor,
                                    height: 20,
                                  );
                                },
                              ),
                      ],
                    ),
                  ),
                ),
                // return Container(
                //   width: ResponsiveFlutter.of(context).wp(100),
                //   height: 54,
                //   padding: EdgeInsets.all(5),
                //   color: Colors.grey[300],
                //   child: Container(
                //       margin: EdgeInsets.only(left: 152, right: 152),
                //       child: Center()),
                // );
                //
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
