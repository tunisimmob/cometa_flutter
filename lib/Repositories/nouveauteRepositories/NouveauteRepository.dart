import 'dart:convert';
import 'package:cometa_flutter/Consts/consts.dart';
import 'package:cometa_flutter/Models/NouveautesModel.dart';
import 'package:http/http.dart' as http;

class NouveautesRepository {
  Future<List<NouveauteModel>> nouveautesList() async {
    final response =
        await http.get(Uri.parse(Consts.hostName + Consts.nouveaute));
    print(json.decode(response.body));
    return NouveauteResponse.fromJsonList(json.decode(response.body.toString()))
        .nouveautes;
  }
}
