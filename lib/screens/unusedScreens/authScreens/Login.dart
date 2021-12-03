import 'SignUp.dart';
import 'package:cometa_flutter/screens/homeScreens/Home.dart';
import 'package:flutter/material.dart';
import 'package:responsive_flutter/responsive_flutter.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    final Center logo = Center(
      child: Image.asset('assets/cometa.png', fit: BoxFit.cover),
    );
    final Padding inputEmail = Padding(
      padding: const EdgeInsets.only(bottom: 10, top: 20),
      child: TextField(
        style: TextStyle(color: Colors.black),
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
            fillColor: Colors.white,
            filled: true,
            hintText: 'Email',
            hintStyle: TextStyle(color: Colors.black54),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.black54, width: 0.5),
              borderRadius: BorderRadius.circular(3.0),
            ),
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.0),
              borderSide: const BorderSide(color: Colors.black, width: 0.5),
            )),
      ),
    );
    final Padding inputPassword = Padding(
      padding: const EdgeInsets.only(bottom: 0),
      child: TextField(
        style: TextStyle(color: Colors.black),
        keyboardType: TextInputType.emailAddress,
        obscureText: true,
        decoration: InputDecoration(
            fillColor: Colors.white,
            filled: true,
            hintText: 'Password',
            hintStyle: TextStyle(color: Colors.black54),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.black54, width: 0.5),
              borderRadius: BorderRadius.circular(3.0),
            ),
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.0),
              borderSide: const BorderSide(color: Colors.black, width: 0.5),
            )),
      ),
    );

    final TextButton buttonForgotPassword = TextButton(
        child: Text(
          'Forgot Password ? Reset Now.',
          style: TextStyle(color: Colors.blue[900], fontSize: 14),
        ),
        onPressed: null);
    final Padding buttonLogin = Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: ButtonTheme(
        height: ResponsiveFlutter.of(context).hp(9),
        child: ElevatedButton(
            child: Text('Login',
                style: TextStyle(color: Colors.white, fontSize: 16)),
            style: TextButton.styleFrom(
              primary: Colors.white,
              backgroundColor: Color(0xffb52632),
              onSurface: Colors.grey[200],
            ),
            // color: Colors.blue[900],
            // shape: RoundedRectangleBorder(
            //   borderRadius: BorderRadius.circular(5),
            //   side: BorderSide(color: Colors.blue[900], width: 0.5),
            // ),
            onPressed: () {
              // LoginAction();
              //
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => Home()));
            }),
      ),
    );
    final Padding buttonSignUp = Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: ButtonTheme(
        height: ResponsiveFlutter.of(context).hp(9),
        child: TextButton(
          child: Text('First time here ? Create Account !',
              style: TextStyle(color: Colors.blue[900], fontSize: 16)),
          style: TextButton.styleFrom(
            primary: Colors.white,
            backgroundColor: Color(0xffb52632),
            onSurface: Colors.grey[200],
          ),
          // color: Colors.white,
          // shape: RoundedRectangleBorder(
          //   borderRadius: BorderRadius.circular(5),
          // ),
          onPressed: () {
            // signUpAction();
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => SignUp()));
          },
        ),
      ),
    );

    return SafeArea(
      child: Scaffold(
        body: Container(
          color: Colors.white,
          child: Center(
            child: ListView(
              shrinkWrap: true,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              children: <Widget>[
                logo,
                inputEmail,
                inputPassword,
                buttonForgotPassword,
                buttonLogin,
                buttonSignUp
              ],
            ),
          ),
        ),
      ),
    );
  }
}
