import 'package:cached_network_image/cached_network_image.dart';
import 'package:cometa_flutter/Models/imageModel.dart';
import 'package:cometa_flutter/Repositories/imageRepositories/ImageRepository.dart';
import 'package:cometa_flutter/screens/shared/BaseAppBar.dart';
import 'package:cometa_flutter/screens/shared/contactUsFooterWidget.dart';
import 'package:cometa_flutter/screens/shared/socialMediaSubFooterWidget.dart';
import 'package:flutter/material.dart';
import 'package:responsive_flutter/responsive_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';

class GalleriePhotos extends StatefulWidget {
  GalleriePhotos({Key key}) : super(key: key);
  @override
  _GalleriePhotosState createState() => _GalleriePhotosState();
}

class _GalleriePhotosState extends State<GalleriePhotos> {
  List<ImageModel> imageslist = [];
  bool isLoading = false;

  @override
  void initState() {
    imagesList();
    super.initState();
  }

  imagesList() async {
    print("imagesList");
    this.setState(() {
      isLoading = true;
    });
    var response = await ImageRepository().imagesList();
    print(response);
    setState(() {
      isLoading = false;
      imageslist = response;
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
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Container(
                      width: ResponsiveFlutter.of(context).wp(90),
                      color: Color(0xffb52632),
                      padding: EdgeInsets.only(top: 5, bottom: 5),
                      child: Center(
                        child: Text(
                          "Album Photos".toUpperCase(),
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Container(
                      width: ResponsiveFlutter.of(context).wp(90),
                      child: isLoading
                          ? Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  height: ResponsiveFlutter.of(context).hp(27),
                                ),
                                CircularProgressIndicator(
                                  backgroundColor: Colors.transparent,
                                  valueColor: new AlwaysStoppedAnimation<Color>(
                                      Color(0xffb52632)),
                                ),
                                SizedBox(height: 20),
                                Text('Chargement en cours'),
                              ],
                            )
                          : GridView.builder(
                              shrinkWrap: true,
                              physics: BouncingScrollPhysics(),
                              itemCount: imageslist.length,
                              gridDelegate:
                                  new SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                              ),
                              itemBuilder: (BuildContext context, int index) {
                                return Card(
                                  elevation: 5,
                                  child: GestureDetector(
                                    onTap: () async {
                                      showGeneralDialog(
                                          barrierColor:
                                              Colors.black.withOpacity(0.5),
                                          transitionBuilder:
                                              (context, a1, a2, widget) {
                                            return Transform.scale(
                                              scale: a1.value,
                                              child: Opacity(
                                                opacity: a1.value,
                                                child: Container(
                                                  color: Colors.black54,
                                                  child: CachedNetworkImage(
                                                    imageUrl:
                                                        imageslist[index].image,
                                                    fit: BoxFit.contain,
                                                    progressIndicatorBuilder: (context,
                                                            url,
                                                            downloadProgress) =>
                                                        CircularProgressIndicator(
                                                            backgroundColor:
                                                                Colors
                                                                    .transparent,
                                                            valueColor:
                                                                new AlwaysStoppedAnimation<
                                                                        Color>(
                                                                    Color(
                                                                        0xffb52632)),
                                                            value:
                                                                downloadProgress
                                                                    .progress),
                                                    errorWidget:
                                                        (context, url, error) =>
                                                            Icon(Icons.error),
                                                  ),
                                                ),
                                              ),
                                            );
                                          },
                                          transitionDuration:
                                              Duration(milliseconds: 200),
                                          barrierDismissible: true,
                                          barrierLabel: '',
                                          context: context,
                                          // ignore: missing_return
                                          pageBuilder: (context, animation1,
                                              animation2) {});
                                      // await showDialog(
                                      //   context: context,
                                      //   builder: (_) => Dialog(
                                      //     insetPadding: EdgeInsets.all(0),
                                      //     child: Card(
                                      //       elevation: 5,
                                      //       child: CachedNetworkImage(
                                      //         imageUrl: imageslist[index].image,
                                      //         fit: BoxFit.contain,
                                      //         progressIndicatorBuilder:
                                      //             (context, url,
                                      //                     downloadProgress) =>
                                      //                 Column(
                                      //           mainAxisAlignment:
                                      //               MainAxisAlignment.center,
                                      //           children: [
                                      //             CircularProgressIndicator(
                                      //                 value: downloadProgress
                                      //                     .progress),
                                      //             SizedBox(height: 20),
                                      //             Text('Chargement en cours'),
                                      //           ],
                                      //         ),
                                      //         errorWidget:
                                      //             (context, url, error) =>
                                      //                 Icon(Icons.error),
                                      //       ),
                                      //     ),
                                      //   ),
                                      // );
                                    },
                                    child: Container(
                                      child: CachedNetworkImage(
                                        imageUrl: imageslist[index].image,
                                        fit: BoxFit.cover,
                                        progressIndicatorBuilder:
                                            (context, url, downloadProgress) =>
                                                Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            CircularProgressIndicator(
                                                backgroundColor:
                                                    Colors.transparent,
                                                valueColor:
                                                    new AlwaysStoppedAnimation<
                                                            Color>(
                                                        Color(0xffb52632)),
                                                value:
                                                    downloadProgress.progress),
                                            SizedBox(height: 20),
                                            Text('Chargement en cours'),
                                          ],
                                        ),
                                        errorWidget: (context, url, error) =>
                                            Icon(Icons.error),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                    ),
                  ],
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
