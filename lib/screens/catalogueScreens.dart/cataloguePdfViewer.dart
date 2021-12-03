import 'package:advance_pdf_viewer/advance_pdf_viewer.dart';
import 'package:cometa_flutter/Consts/consts.dart';
import 'package:flutter/material.dart';
import 'package:cometa_flutter/screens/shared/BaseAppBar.dart';
import 'package:cometa_flutter/screens/shared/contactUsFooterWidget.dart';
import 'package:cometa_flutter/screens/shared/socialMediaSubFooterWidget.dart';

class CataloguePdfViewer extends StatefulWidget {
  @override
  _CataloguePdfViewerState createState() => _CataloguePdfViewerState();
}

class _CataloguePdfViewerState extends State<CataloguePdfViewer> {
  bool _isLoading = true;
  PDFDocument document;

  @override
  void initState() {
    super.initState();
    loadDocument();
  }

  loadDocument() async {
    document = await PDFDocument.fromAsset('assets/Cuisina.pdf');
    // document = await PDFDocument.fromURL(
    //   Consts.cataloguePdf,
    //   /* cacheManager: CacheManager(
    //       Config(
    //         "customCacheKey",
    //         stalePeriod: const Duration(days: 2),
    //         maxNrOfCacheObjects: 10,
    //       ),
    //     ), */
    // );
    setState(() => _isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        appBar: AppBar(),
      ),
      body: Column(
        children: [
          Expanded(
            child: _isLoading
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircularProgressIndicator(
                        backgroundColor: Colors.transparent,
                        valueColor:
                            new AlwaysStoppedAnimation<Color>(Consts.maincolor),
                      ),
                      SizedBox(height: 20),
                      Text('Chargement du catalogue est en cours'),
                    ],
                  )
                : PDFViewer(
                    indicatorBackground: Consts.maincolor,
                    pickerButtonColor: Consts.maincolor,
                    document: document,
                    zoomSteps: 1,
                    //uncomment below line to preload all pages
                    // lazyLoad: false,
                    // uncomment below line to scroll vertically
                    // scrollDirection: Axis.vertical,
                    //uncomment below code to replace bottom navigation with your own
                    navigationBuilder:
                        (context, page, totalPages, jumpToPage, animateToPage) {
                      return ButtonBar(
                        alignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          IconButton(
                            icon: Icon(Icons.first_page),
                            onPressed: () {
                              animateToPage(page: 0);
                            },
                          ),
                          IconButton(
                            icon: Icon(Icons.arrow_back),
                            onPressed: () {
                              animateToPage(page: page - 2);
                            },
                          ),
                          IconButton(
                            icon: Icon(Icons.arrow_forward),
                            onPressed: () {
                              animateToPage(page: page);
                            },
                          ),
                          IconButton(
                            icon: Icon(Icons.last_page),
                            onPressed: () {
                              jumpToPage(page: totalPages - 1);
                            },
                          ),
                        ],
                      );
                    },
                  ),
          ),
          ContactUsFooter(),
          SocialMediaSubFooterWidget(),
        ],
      ),
    );
  }
}
