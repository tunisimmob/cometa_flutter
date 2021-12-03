import 'dart:convert';
import 'package:cometa_flutter/Consts/consts.dart';
import 'package:cometa_flutter/Models/ContactsModel.dart';
import 'package:http/http.dart' as http;

Future<ContactModel> fetchContact() async {
  final response = await http.get(Uri.parse(Consts.hostName + Consts.contact));
  if (response.statusCode == 200) {
    print(json.decode(response.body));
    // return ContactModel.fromJson(jsonDecode(response.body)["data"]);
    return ContactModel.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load contact');
  }
}
