import 'dart:convert';
import 'package:cometa_flutter/Consts/consts.dart';
import 'package:cometa_flutter/Models/PartenairesModel.dart';
import 'package:http/http.dart' as http;

class PartenairesRepository {
  Future<List<PartenaireModel>> partenairesList({String projetId}) async {
    final response =
        await http.get(Uri.parse(Consts.hostName + Consts.partenaires));
    // await ApiBaseHelper.shared.get(Endpoints.GET_STOPS, needsAuth: false);
    print(json.decode(response.body));
    return PartenaireResponse.fromJsonList(
            json.decode(response.body.toString()))
        .partenaires;
  }
}
