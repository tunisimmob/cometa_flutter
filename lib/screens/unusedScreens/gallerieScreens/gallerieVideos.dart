import 'package:cometa_flutter/Consts/consts.dart';
import 'package:cometa_flutter/Models/VideoModel.dart';
import 'package:cometa_flutter/Repositories/unusedRepositories/videoRepositories/VideoRepository.dart';
import 'package:cometa_flutter/screens/shared/BaseAppBar.dart';
import 'package:cometa_flutter/screens/shared/contactUsFooterWidget.dart';
import 'package:cometa_flutter/screens/shared/socialMediaSubFooterWidget.dart';
import 'package:flutter/material.dart';
import 'package:responsive_flutter/responsive_flutter.dart';
import 'VideoPlayerScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';

class GallerieVideos extends StatefulWidget {
  GallerieVideos({
    Key key,
  }) : super(key: key);
  @override
  _GallerieVideosState createState() => _GallerieVideosState();
}

class _GallerieVideosState extends State<GallerieVideos> {
  List<VideoModel> videoslist = [];

  @override
  void initState() {
    videosList();
    super.initState();
  }

  videosList() async {
    print("videosList");
    var response = await VideoRepository().videosList();
    print(response);
    setState(() {
      videoslist = response;
    });
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
            Container(
              width: ResponsiveFlutter.of(context).wp(100),
              padding: EdgeInsets.only(top: 5, bottom: 5),
              child: Center(
                child: Text(
                  "album videos".toUpperCase(),
                  style: TextStyle(
                      fontSize: 16,
                      color: Consts.maincolor,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Expanded(
              child: Container(
                height: ResponsiveFlutter.of(context).hp(100),
                width: ResponsiveFlutter.of(context).wp(95),
                child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  padding: EdgeInsets.only(top: 5, bottom: 5),
                  itemCount: videoslist.length,
                  itemBuilder: (BuildContext context, int index) {
                    return VideoPlayerScreen(
                      videoUrl: videoslist[index].video,
                      titre: videoslist[index].titre,
                    );
                  },
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
