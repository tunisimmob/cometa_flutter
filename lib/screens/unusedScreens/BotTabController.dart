import 'package:cometa_flutter/screens/contactScreens/contact.dart';
import 'package:cometa_flutter/screens/nouveauteScreens/Nouveau.dart';
import 'package:cometa_flutter/screens/produitsScreens/product.dart';
import 'package:cometa_flutter/screens/unusedScreens/partenaireScreens/partenaire.dart';
import 'authScreens/Login.dart';
import 'categorieScreens/categorie.dart';
import '../presentationScreens/Presentation.dart';
import 'package:cometa_flutter/screens/homeScreens/Home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BotTabController extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _BotTabController();
  }
}

class _BotTabController extends State<BotTabController> {
  @override
  Widget build(BuildContext context) {
    // var bottomNavigationBar = _buildBottomNavigationBar(defaultTabController);
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Scaffold(
        drawer: Drawer(
          // Add a ListView to the drawer. This ensures the user can scroll
          // through the options in the drawer if there isn't enough vertical
          // space to fit everything.
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: <Widget>[
              UserAccountsDrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blue[900],
                ),
                accountName: Text("Damin"),
                accountEmail: Text("Damin.azaiez.97@gmail.com"),
                currentAccountPicture: CircleAvatar(
                  child: Image.asset('assets/avatar.png'),
                ),
              ),
              ListTile(
                title: Text('Présentation'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Presentation(),
                    ),
                  );
                },
              ),
              ListTile(
                title: Text('Actualités'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Nouveau(),
                    ),
                  );
                },
              ),
              ListTile(
                title: Text('Categorie'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Categorie(),
                    ),
                  );
                },
              ),
              Divider(),
              ListTile(
                title: Text('Partenaires'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Partenaire(),
                    ),
                  );
                },
              ),
              ListTile(
                title: Text('Contact'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Contact(),
                    ),
                  );
                },
              ),
              Divider(),
              ListTile(
                title: Text('Deconnexion'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Login(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
        appBar: AppBar(
          iconTheme: new IconThemeData(color: Colors.blue[900]),
          backgroundColor: Colors.white,
          shadowColor: Colors.blue[900],
          title: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => BotTabController()));
                },
                child: Container(
                  width: 125,
                  child: Image.asset('assets/cometa.png'),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: TabBar(
          tabs: [
            Tab(
                icon: Icon(
              Icons.home,
              color: Colors.blue[900],
            )),
            Tab(
                icon: Icon(
              Icons.add_shopping_cart,
              color: Colors.blue[900],
            )),
          ],
        ),
        body: TabBarView(
          children: [
            Home(),
            Produit(),
          ],
        ),
      ),
    );
  }
}
