import 'package:cometa_flutter/screens/homeScreens/Home.dart';
import 'Login.dart';
import 'package:flutter/material.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:responsive_flutter/responsive_flutter.dart';

class SignUp extends StatefulWidget {
  // final SignUpAction;
  // final String SignUpError;
  // const SignUp(this.SignUpAction, this.SignUpError);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    final Center logo = Center(
      child: Image.asset('assets/cometa.png', fit: BoxFit.cover),
    );
    final Container inputFname = Container(
      width: ResponsiveFlutter.of(context).wp(43),
      padding: const EdgeInsets.only(bottom: 5, top: 5, right: 5),
      child: TextField(
        style: TextStyle(color: Colors.black),
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
            fillColor: Colors.white,
            filled: true,
            hintText: 'First Name',
            hintStyle: TextStyle(color: Colors.black54),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.black54, width: 0.5),
              borderRadius: BorderRadius.circular(3.0),
            ),
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(5.0))),
      ),
    );
    final Container inputLname = Container(
      width: ResponsiveFlutter.of(context).wp(43),
      padding: const EdgeInsets.only(bottom: 5, top: 5, left: 5),
      child: TextField(
        style: TextStyle(color: Colors.black),
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
            fillColor: Colors.white,
            filled: true,
            hintText: 'Last Name',
            hintStyle: TextStyle(color: Colors.black54),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.black54, width: 0.5),
              borderRadius: BorderRadius.circular(3.0),
            ),
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(5.0))),
      ),
    );
    final Padding inputEmail = Padding(
      padding: const EdgeInsets.only(bottom: 5, top: 5),
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
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(5.0))),
      ),
    );

    final Container inputCountryCode = Container(
      width: ResponsiveFlutter.of(context).wp(25),
      height: 57,
      padding: const EdgeInsets.only(bottom: 5, top: 5, right: 5),
      child: CountryCodePicker(
        onChanged: print,
        // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
        initialSelection: 'IT',
        favorite: ['+216', 'TN'],
        // optional. Shows only country name and flag
        showCountryOnly: false,
        // optional. Shows only country name and flag when popup is closed.
        showOnlyCountryWhenClosed: false,
        // optional. aligns the flag and the Text left
        alignLeft: false,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(3.0),
            topRight: Radius.circular(3.0),
            bottomLeft: Radius.circular(3.0),
            bottomRight: Radius.circular(3.0)),
        border: Border.all(width: 1),
      ),
    );
    final Container inputPhoneNumber = Container(
      width: ResponsiveFlutter.of(context).wp(63.5),
      padding: const EdgeInsets.only(bottom: 5, top: 5, left: 5),
      child: TextField(
        style: TextStyle(color: Colors.black),
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
            fillColor: Colors.white,
            filled: true,
            hintText: 'Phone Number',
            hintStyle: TextStyle(color: Colors.black54),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.black54, width: 0.5),
              borderRadius: BorderRadius.circular(3.0),
            ),
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(5.0))),
      ),
    );
    final Padding inputPassword = Padding(
      padding: const EdgeInsets.only(bottom: 5, top: 5),
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
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(5.0))),
      ),
    );
    final Padding inputPasswordConfirmation = Padding(
      padding: const EdgeInsets.only(bottom: 5, top: 5),
      child: TextField(
        style: TextStyle(color: Colors.black),
        keyboardType: TextInputType.emailAddress,
        obscureText: true,
        decoration: InputDecoration(
            fillColor: Colors.white,
            filled: true,
            hintText: 'Password Confirmation',
            hintStyle: TextStyle(color: Colors.black54),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.black54, width: 0.5),
              borderRadius: BorderRadius.circular(3.0),
            ),
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(5.0))),
      ),
    );
    final Padding buttonSignUp = Padding(
      padding: const EdgeInsets.only(bottom: 5, top: 5),
      child: ButtonTheme(
        height: 57,
        child: ElevatedButton(
          child: Text('Register',
              style: TextStyle(color: Colors.white, fontSize: 16)),
          style: TextButton.styleFrom(
            primary: Colors.white,
            backgroundColor: Color(0xffb52632),
            onSurface: Colors.grey[200],
          ),
          onPressed: () {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => Home()));
          },
        ),
      ),
    );
    final Padding buttonLogin = Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: ButtonTheme(
        height: ResponsiveFlutter.of(context).hp(9),
        child: TextButton(
            child: Text('Already have an account? Login.',
                style: TextStyle(color: Colors.blue[900], fontSize: 16)),
            style: TextButton.styleFrom(
              primary: Colors.white,
              backgroundColor: Color(0xffb52632),
              onSurface: Colors.grey[200],
            ),
            onPressed: () {
              // LoginAction();
              //
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => Login()));
            }),
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(child: inputFname),
                    Container(child: inputLname),
                  ],
                ),
                inputEmail,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(child: inputCountryCode),
                    Container(child: inputPhoneNumber),
                  ],
                ),
                inputPassword,
                inputPasswordConfirmation,
                buttonSignUp,
                buttonLogin
              ],
            ),
          ),
        ),
      ),
    );
  }
}
