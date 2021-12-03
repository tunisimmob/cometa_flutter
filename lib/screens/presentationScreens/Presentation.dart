import 'package:carousel_pro/carousel_pro.dart';
import 'package:cometa_flutter/Consts/consts.dart';
import 'package:cometa_flutter/screens/shared/BaseAppBar.dart';
import 'package:cometa_flutter/screens/shared/contactUsFooterWidget.dart';
import 'package:cometa_flutter/screens/shared/socialMediaSubFooterWidget.dart';
import 'package:flutter/material.dart';
import 'package:responsive_flutter/responsive_flutter.dart';
import '../../Models/PresentationsModel.dart';
import '../../Repositories/presentationRepositories/PresentationRepository.dart';

class Presentation extends StatefulWidget {
  @override
  _PresentationState createState() => _PresentationState();
}

class _PresentationState extends State<Presentation> {
  List<PresentationModel> presentationslist = [];
  List<Widget> images1List = [];
  List<Widget> images2List = [];
  bool isLoading = false;
  @override
  void initState() {
    super.initState();
    presentationsList();
  }

  presentationsList() async {
    print("presentationsList");
    this.setState(() {
      isLoading = true;
    });
    var response = await PresentationsRepository().presentationsList();
    print(response);
    setState(() {
      isLoading = false;
      presentationslist = response;
    });
  }

  // List<Widget> getImages1list(List images1) {
  //   images1
  //     ..forEach((element) {
  //       images1List = images1List + [CachedNetworkImage(imageUrl: element)];
  //       print('$images1List');
  //     });
  //   return images1List;
  // }

  // List<Widget> getImages2list(List images1) {
  //   images1
  //     ..forEach((element) {
  //       images2List = images2List + [CachedNetworkImage(imageUrl: element)];
  //       print('$images2List');
  //     });
  //   return images2List;
  // }

  @override
  void dispose() {
    super.dispose();
    // images1List.dispose();
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
                        width: ResponsiveFlutter.of(context).wp(100),
                        height: ResponsiveFlutter.of(context).hp(24),
                        child: Carousel(
                          boxFit: BoxFit.cover,
                          autoplay: true,
                          animationCurve: Curves.fastOutSlowIn,
                          animationDuration: Duration(milliseconds: 1000),
                          dotSize: 6.0,
                          dotIncreasedColor: Consts.maincolor,
                          dotBgColor: Colors.transparent,
                          dotPosition: DotPosition.bottomCenter,
                          dotVerticalPadding: 10.0,
                          showIndicator: true,
                          indicatorBgPadding: 7.0,
                          // images: getImages1list(
                          //     snapshot.data.images1),
                          images: [
                            /* ExactAssetImage(
                                "assets/presentation/couverture.jpg"),*/
                            ExactAssetImage("assets/home/home1.png"),
                            ExactAssetImage("assets/home/home2.jpg"),
                            ExactAssetImage("assets/home/home3.png"),
                            ExactAssetImage("assets/home/home4.jpg"),
                          ],
                        ),
                      ),
                      // qui somme nous
                      isLoading
                          ? Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  height: ResponsiveFlutter.of(context).hp(20),
                                ),
                                CircularProgressIndicator(
                                  backgroundColor: Colors.transparent,
                                  valueColor: new AlwaysStoppedAnimation<Color>(
                                      Consts.maincolor),
                                ),
                                SizedBox(height: 20),
                                Text('Chargement en cours'),
                              ],
                            )
                          : Container(
                              decoration: BoxDecoration(
                                color: Colors.grey[200],
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10.0),
                                  topRight: Radius.circular(10.0),
                                  bottomLeft: Radius.circular(10.0),
                                  bottomRight: Radius.circular(10.0),
                                ),
                              ),
                              margin: EdgeInsets.only(top: 20),
                              padding: EdgeInsets.all(10),
                              width: ResponsiveFlutter.of(context).wp(95),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // titre 1
                                  ListView.separated(
                                    shrinkWrap: true,
                                    physics: NeverScrollableScrollPhysics(),
                                    padding: EdgeInsets.only(bottom: 0),
                                    itemCount: presentationslist.length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            padding: EdgeInsets.only(bottom: 5),
                                            child: Text(
                                              presentationslist[index]
                                                      .titre
                                                      .toUpperCase() +
                                                  ' :',
                                              style: TextStyle(
                                                color: Consts.maincolor,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 13,
                                              ),
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                          Container(
                                            padding: EdgeInsets.only(bottom: 5),
                                            child: Text(
                                              presentationslist[index]
                                                  .texte
                                                  .toString(),
                                              style: TextStyle(
                                                color: Colors.black87,
                                                fontSize: 12.5,
                                                height: 1.5,
                                              ),
                                              textAlign: TextAlign.justify,
                                            ),
                                          ),
                                        ],
                                      );
                                    },
                                    separatorBuilder:
                                        (BuildContext context, int index) {
                                      return Container(
                                        margin: EdgeInsets.only(
                                            top: 10, bottom: 10),
                                      );
                                    },
                                  ),
                                  // images
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
