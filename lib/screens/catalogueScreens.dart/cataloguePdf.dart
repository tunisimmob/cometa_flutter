// import 'dart:async';
// import 'dart:io';
// import 'dart:typed_data';
// import 'package:cometa/Consts/consts.dart';
// import 'package:cometa/screens/shared/BaseAppBar.dart';
// import 'package:cometa/screens/shared/contactUsFooterWidget.dart';
// import 'package:cometa/screens/shared/socialMediaSubFooterWidget.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:path_provider/path_provider.dart';
// import 'package:pdf_viewer_plugin/pdf_viewer_plugin.dart';

// class CataloguePdf extends StatefulWidget {
//   @override
//   _CataloguePdfState createState() => _CataloguePdfState();
// }

// class _CataloguePdfState extends State<CataloguePdf> {
//   String path;
//   // String _downloadMessage = 'Initializing ...';
//   // bool _isDownloading = false;
//   Future<String> get _localPath async {
//     final directory = await getApplicationDocumentsDirectory();

//     return directory.path;
//   }

//   Future<File> get _localFile async {
//     final path = await _localPath;
//     return File('$path/cometa.pdf');
//   }

//   Future<File> writeCounter(Uint8List stream) async {
//     final file = await _localFile;

//     // Write the file
//     return file.writeAsBytes(stream);
//   }

//   Future<bool> existsFile() async {
//     final file = await _localFile;
//     return file.exists();
//   }

//   Future<Uint8List> fetchPost() async {
//     final response = await http.get(Uri.parse(Consts.cataloguePdf));
//     final responseJson = response.bodyBytes;
//     return responseJson;
//   }

//   void loadPdf() async {
//     await writeCounter(await fetchPost());
//     await existsFile();
//     path = (await _localFile).path;
//     if (!mounted) return;
//   }

//   @override
//   void initState() {
//     super.initState();
//     loadPdf();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: BaseAppBar(
//         appBar: AppBar(),
//       ),
//       body: Center(
//         child: Column(
//           children: <Widget>[
//             // FloatingActionButton.extended(
//             //   onPressed: () async {
//             //     setState(() {
//             //       _isDownloading = !_isDownloading;
//             //     });
//             //     var dir = await getExternalStorageDirectory();
//             //     Dio dio = Dio();
//             //     dio.download(Consts.cataloguePdf, '${dir.path}/cometa.pdf',
//             //         onReceiveProgress: (actualbytes, totalbytes) {
//             //       setState(() {});
//             //     });
//             //   },
//             //   label: Text(''),
//             //   icon: Icon(Icons.file_download),
//             // ),
//             // Text(downloadMessage ?? ""),
//             if (path != null)
//               Expanded(
//                 child: Container(
//                   child: PdfView(
//                     path: path,
//                   ),
//                 ),
//               )
//             else
//               Expanded(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     CircularProgressIndicator(
//                       backgroundColor: Colors.transparent,
//                       valueColor: new AlwaysStoppedAnimation<Color>(Color(0xffb52632)),
//                     ),
//                     SizedBox(height: 20),
//                     Text('Chargement du catalogue est en cours'),
//                   ],
//                 ),
//               ),
//             ContactUsFooter(),
//             SocialMediaSubFooterWidget(),
//           ],
//         ),
//       ),
//     );
//   }
// }
