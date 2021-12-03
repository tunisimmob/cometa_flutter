import 'package:cometa_flutter/screens/shared/BaseAppBar.dart';
import 'package:cometa_flutter/screens/shared/contactUsFooterWidget.dart';
import 'package:cometa_flutter/screens/shared/socialMediaSubFooterWidget.dart';
import 'package:flutter/material.dart';
import 'package:responsive_flutter/responsive_flutter.dart';
import 'package:auto_size_text/auto_size_text.dart';

class SellPoint extends StatefulWidget {
  @override
  _SellPointState createState() => _SellPointState();
}

class _SellPointState extends State<SellPoint> {
  @override
  void initState() {
    super.initState();
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
                  child: Column(
                    children: <Widget>[
                      Container(
                        height: ResponsiveFlutter.of(context).hp(24),
                        child:
                            Image.asset('assets/home5.jpg', fit: BoxFit.cover),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(8.0),
                              bottomRight: Radius.circular(8.0),
                              topLeft: Radius.circular(8.0),
                              topRight: Radius.circular(8.0)),
                        ),
                      ),
                      Container(
                        color: Colors.grey[300],
                        padding: EdgeInsets.all(8),
                        child: Center(
                            child: RichText(
                          text: TextSpan(
                            text: 'POINTS DE VENTES :'.toUpperCase(),
                            style: TextStyle(
                              color: Colors.black87,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )),
                      ),
                      GestureDetector(
                        onTap: () {
                          // LoginAction();
                          // Navigator.push(context,
                          //     MaterialPageRoute(builder: (context) => Owner()));
                        },
                        child: Container(
                          margin: EdgeInsets.only(
                            top: 15,
                            left: 10,
                            right: 10,
                          ),
                          padding: EdgeInsets.all(7),
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            // color: Color(0xffb52632),
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(8.0),
                              bottomRight: Radius.circular(8.0),
                              topRight: Radius.circular(8.0),
                              topLeft: Radius.circular(8.0),
                            ),
                          ),
                          width: double.infinity,
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Container(
                                  padding: EdgeInsets.only(right: 5),
                                  width: ResponsiveFlutter.of(context).wp(44),
                                  height:
                                      ResponsiveFlutter.of(context).hp(14.5),
                                  child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        AutoSizeText(
                                          'Devenez propriétaire ',
                                          style: TextStyle(
                                            color: Colors.black87,
                                            fontWeight: FontWeight.bold,
                                          ),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        Flexible(
                                          child: AutoSizeText(
                                            "entre le moment de l’acquisition et le moment de la livraison du bien, il s’écoule souvent une période comprise entre 12 et 24 mois.",
                                            style: TextStyle(
                                              color: Colors.black87,
                                            ),
                                            maxLines: 5,
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.justify,
                                          ),
                                        ),
                                      ]),
                                ),
                                Container(
                                  width: ResponsiveFlutter.of(context).wp(45),
                                  height:
                                      ResponsiveFlutter.of(context).hp(14.5),
                                  child: Image.asset(
                                    'assets/home2.jpg',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ]),
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
