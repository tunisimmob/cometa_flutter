import 'dart:convert';
import 'package:cometa_flutter/Consts/consts.dart';
import 'package:cometa_flutter/Models/VideoModel.dart';
import 'package:http/http.dart' as http;

class VideoRepository {
  Future<List<VideoModel>> videosList() async {
    final response = await http.get(Uri.parse(Consts.hostName + Consts.videos));
    print(json.decode(response.body));
    return VideoResponse.fromJsonList(json.decode(response.body.toString()))
        .videos;
  }
}
