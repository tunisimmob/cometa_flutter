import 'dart:io';

import 'package:cometa_flutter/Consts/consts.dart';
import 'package:flutter/material.dart';

class NetworkError extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Consts.maincolor,
        body: AlertDialog(
          contentPadding: EdgeInsets.all(5),
          content: Container(
            color: Colors.white,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: EdgeInsets.all(20),
                  child: Image.asset('assets/logocometa.png'),
                ),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(20),
                  child: Center(
                    child: new Text(
                      ' ERREUR',
                      style: new TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 15.0,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(20),
                  child: Center(
                    child: new Text(
                      ' Oups! un problème est survenu, veuillez vérifier votre connexion Internet',
                      style: new TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 15.0,
                        color: Consts.maincolor,
                      ),
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(10),
                  color: Colors.white,
                  child: FloatingActionButton(
                    backgroundColor: Consts.maincolor,
                    onPressed: () => exit(0),
                    tooltip: "Fermer l'application",
                    child: new Icon(Icons.close),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
