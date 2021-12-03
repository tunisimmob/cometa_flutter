import 'dart:convert';
import 'package:cometa_flutter/Models/imageModel.dart';
import 'package:http/http.dart' as http;
import 'package:cometa_flutter/Consts/consts.dart';

class ImageRepository {
  Future<List<ImageModel>> imagesList() async {
    final response = await http.get(Uri.parse(Consts.hostName + Consts.images));
    print(json.decode(response.body));
    return ImageResponse.fromJsonList(json.decode(response.body.toString()))
        .images;
  }
}
