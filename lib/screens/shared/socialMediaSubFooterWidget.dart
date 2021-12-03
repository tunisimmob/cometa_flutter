import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SocialMediaSubFooterWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      color: Color(0xff0c4b98),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            GestureDetector(
              onTap: () {
                const url =
                    'https://www.google.com/maps/search/COMETA/@36.8715088,10.1828719,13z/data=!3m1!4b1';
                launchURL(url);
              },
              child: Container(
                width: 18,
                height: 18,
                child: Image.asset(
                  'assets/maps.png',
                  fit: BoxFit.cover,
                  color: Colors.white,
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                const url = 'https://www.facebook.com/cometa.com.tn';
                launchURL(url);
              },
              child: Container(
                width: 18,
                height: 18,
                child: Image.asset(
                  'assets/facebook.png',
                  fit: BoxFit.cover,
                  color: Colors.white,
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                const url = 'https://www.cometa.com.tn/';
                launchURL(url);
              },
              child: Container(
                width: 18,
                height: 18,
                child: Image.asset(
                  'assets/web.png',
                  fit: BoxFit.cover,
                  color: Colors.white,
                ),
              ),
            ),
           /* GestureDetector(
              onTap: () {
                const url =
                    'https://www.linkedin.com/company/cometa-officielle/';
                launchURL(url);
              },
              child: Container(
                width: 18,
                height: 18,
                child: Image.asset(
                  'assets/linkedin.png',
                  fit: BoxFit.cover,
                  color: Colors.white,
                ),
              ),
            ),*/
           /* GestureDetector(
              onTap: () {
                const url =
                    'https://www.youtube.com/channel/UCs5qK-X-N2B-niLSCdLgs2Q';
                launchURL(url);
              },
              child: Container(
                width: 18,
                height: 18,
                child: Image.asset(
                  'assets/logotype-youtube.png',
                  fit: BoxFit.cover,
                  color: Colors.white,
                ),
              ),
            ),*/
          ]),
    );
  }
}

launchURL(String url) async {
  if (await canLaunch(url)) {
    await launch(url, forceWebView: true, enableJavaScript: true);
  } else {
    throw 'Could not launch $url';
  }
}
