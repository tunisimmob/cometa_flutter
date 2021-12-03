import 'package:auto_size_text/auto_size_text.dart';
import 'package:cometa_flutter/Models/ContactsModel.dart';
import 'package:cometa_flutter/Repositories/contactRepositories/ContactRepository.dart';
import 'package:flutter/material.dart';
import 'package:responsive_flutter/responsive_flutter.dart';

class ContactUsFooter extends StatefulWidget {
  @override
  _ContactUsFooterState createState() => _ContactUsFooterState();
}

class _ContactUsFooterState extends State<ContactUsFooter> {
  Future<ContactModel> futureContact;
  @override
  void initState() {
    super.initState();

    futureContact = fetchContact();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<ContactModel>(
      future: futureContact,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Container(
            decoration: BoxDecoration(
              color: Colors.grey[300],
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.5),
                  spreadRadius: 4,
                  blurRadius: 7,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            padding: EdgeInsets.all(5),
            child: Column(
              children: [
                Container(
                  child: AutoSizeText(
                    snapshot.data.adresse.toString(),
                    style: TextStyle(
                      color: Colors.black87,
                    ),
                    maxLines: 1,
                    minFontSize: 11,
                    maxFontSize: 12,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                  ),
                ),
                Container(
                  child: AutoSizeText(
                    snapshot.data.email.toString(),
                    style: TextStyle(
                      color: Colors.black87,
                    ),
                    maxLines: 1,
                    minFontSize: 11,
                    maxFontSize: 12,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                  ),
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        child: Text(
                          snapshot.data.numero1.toString(),
                          style: TextStyle(
                            color: Color(0xff0c4b98),
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.justify,
                        ),
                      ),
                      Container(
                        child: Text(
                          ' - ',
                          style: TextStyle(
                            color: Color(0xff0c4b98),
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.justify,
                        ),
                      ),
                      Container(
                        child: Text(
                          ' ' + snapshot.data.numero2.toString(),
                          style: TextStyle(
                            color: Color(0xff0c4b98),
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.justify,
                        ),
                      ),
                      Container(
                        child: Text(
                          ' - ',
                          style: TextStyle(
                            color: Color(0xff0c4b98),
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.justify,
                        ),
                      ),
                      Container(
                        child: Text(
                          ' ' + snapshot.data.numero3.toString(),
                          style: TextStyle(
                            color: Color(0xff0c4b98),
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.justify,
                        ),
                      ),
                    ]),
              ],
            ),
          );
        } else if (snapshot.hasError) {
          return Container(
            width: ResponsiveFlutter.of(context).wp(100),
            height: 54,
            padding: EdgeInsets.all(5),
            color: Colors.grey[300],
            child: Container(
                margin: EdgeInsets.only(left: 152, right: 152),
                child: Center()),
          );
        }
        return Container(
          decoration: BoxDecoration(
            color: Colors.grey[300],
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.5),
                spreadRadius: 4,
                blurRadius: 7,
                offset: Offset(0, 3),
              ),
            ],
          ),
          padding: EdgeInsets.all(5),
          child: Column(
            children: [
              Container(
                child: AutoSizeText(
                  "124, Avenue Mustapha Mohsen 2073 Borj Louzir Ariana Tunis     ",
                  style: TextStyle(
                    color: Colors.black87,
                  ),
                  maxLines: 1,
                  minFontSize: 11,
                  maxFontSize: 12,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                child: AutoSizeText(
                  'contact@cometa.com.tn',
                  style: TextStyle(
                    color: Colors.black87,
                  ),
                  maxLines: 1,
                  minFontSize: 11,
                  maxFontSize: 12,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    child: Text(
                      ' 70 68 15 82 ',
                      style: TextStyle(
                        color: Color(0xff0c4b98),
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                  Container(
                    child: Text(
                      ' - ',
                      style: TextStyle(
                        color: Color(0xff0c4b98),
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                  Container(
                    child: Text(
                      ' ' + '70 68 35 85',
                      style: TextStyle(
                        color: Color(0xff0c4b98),
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                  Container(
                    child: Text(
                      ' ',
                      style: TextStyle(
                        color: Color(0xff0c4b98),
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                  Container(
                    child: Text(
                      ' ' + '',
                      style: TextStyle(
                        color: Color(0xff0c4b98),
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                ],
              ),
            ],
          ),
        );

        //
      },
    );
  }
}
