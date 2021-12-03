import 'dart:convert';
import 'package:cometa_flutter/Consts/consts.dart';
import 'package:cometa_flutter/Models/PresentationsModel.dart';
import 'package:http/http.dart' as http;

class PresentationsRepository {
  Future<List<PresentationModel>> presentationsList() async {
    final response =
        await http.get(Uri.parse(Consts.hostName + Consts.presentation));
    print(json.decode(response.body));
    return PresentationResponse.fromJsonList(
            json.decode(response.body.toString()))
        .presentations;
  }
}

// class PresentationsRepository {
//   Future<List<PresentationModel>> presentationsList() async {
//     final response =
//         await http.get(Uri.parse(Consts.hostName + Consts.presentation));
//     print(json.decode(response.body));
//     return PresentationResponse.fromJsonList(
//             json.decode(response.body.toString()))
//         .presentations;
//   }
// }
