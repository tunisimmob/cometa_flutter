import 'dart:io';

import 'package:cometa_flutter/screens/Errors/networkerrorScreen.dart';
import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import 'Consts/consts.dart';
import 'screens/homeScreens/Home.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isConnected = false;

  isConnected() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        setState(() {
          _isConnected = true;
        });
      }
    } on SocketException catch (_) {
      setState(() {
        _isConnected = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    isConnected();
  }

  @override
  Widget build(BuildContext context) {
    return new SplashScreen(
      seconds: 2,
      navigateAfterSeconds:
          _isConnected ? new AfterSplashSuccess() : AfterSplashError(),
      photoSize: 150,
      image: Image.asset('assets/logocometa.png'),
      backgroundColor: Colors.white,
      title: new Text(
        'Bienvenue au cometa mobile !',
        style: new TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 14.0,
          color: Consts.maincolor,
        ),
      ),
      loaderColor: Consts.maincolor,
    );
  }
}

class AfterSplashError extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'cometa ',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: NetworkError(),
    );
  }
}

class AfterSplashSuccess extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'cometa ',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Home(),
    );
  }
}
