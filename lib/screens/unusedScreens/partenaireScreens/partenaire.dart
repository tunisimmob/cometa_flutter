import 'package:cached_network_image/cached_network_image.dart';
import 'package:cometa_flutter/Models/PartenairesModel.dart';
import 'package:cometa_flutter/Repositories/unusedRepositories/partenaireRepositories/PartenairesRepository.dart';
import 'package:cometa_flutter/screens/shared/BaseAppBar.dart';
import 'package:cometa_flutter/screens/shared/contactUsFooterWidget.dart';
import 'package:cometa_flutter/screens/shared/socialMediaSubFooterWidget.dart';
import 'package:flutter/material.dart';
import 'package:responsive_flutter/responsive_flutter.dart';

class Partenaire extends StatefulWidget {
  @override
  _PartenaireState createState() => _PartenaireState();
}

class _PartenaireState extends State<Partenaire> {
  List<PartenaireModel> partenaireslist = [];
  bool isLoading = false;
  @override
  void initState() {
    super.initState();
    partenairesList();
  }

  @override
  void dispose() {
    super.dispose();
  }

  partenairesList() async {
    print("partenairesList");
    this.setState(() {
      isLoading = true;
    });
    var response = await PartenairesRepository().partenairesList();
    print(response);
    setState(() {
      isLoading = false;
      partenaireslist = response;
    });
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
                            Image.asset('assets/home3.jpg', fit: BoxFit.cover),
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
                            text: 'Nos Partenaires :'.toUpperCase(),
                            style: TextStyle(
                              color: Colors.black87,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )),
                      ),
                      Container(
                        color: Colors.white,
                        child: Wrap(
                          spacing: 8.0, // gap between adjacent chips
                          runSpacing: 4.0, // gap between lines
                          children: <Widget>[
                            for (var item in partenaireslist)
                              Container(
                                child: CachedNetworkImage(
                                  imageUrl: item.partenaire_logo,
                                  fit: BoxFit.cover,
                                  errorWidget: (context, url, error) =>
                                      Icon(Icons.error),
                                ),
                              )
                          ],
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
