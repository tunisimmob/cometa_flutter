import 'dart:convert';
import 'package:cometa_flutter/Consts/consts.dart';
import 'package:cometa_flutter/Models/produitModels/ProduitModel.dart';
import 'package:http/http.dart' as http;

class ProduitsRepository {
  Future<List<ProduitModel>> produitsList() async {
    final response =
        await http.get(Uri.parse(Consts.hostName + Consts.produits));
    print(json.decode(response.body));
    return ProduitResponse.fromJsonList(json.decode(response.body.toString()))
        .produits;
  }
}
