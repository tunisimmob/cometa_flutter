import 'package:cometa_flutter/screens/homeScreens/Home.dart';
import 'package:flutter/material.dart';

class BaseAppBar extends StatelessWidget implements PreferredSizeWidget {
  final AppBar appBar;

  const BaseAppBar({Key key, this.appBar}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      iconTheme: new IconThemeData(
        color: Color(0xff0c4b98),
      ),
      backgroundColor: Colors.white,
      shadowColor: Colors.black,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          GestureDetector(
            onTap: () {
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => Home()));
            },
            child: Container(
              width: 105,
              child: Image.asset('assets/logocometa.png', fit: BoxFit.cover),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => new Size.fromHeight(appBar.preferredSize.height);
}
