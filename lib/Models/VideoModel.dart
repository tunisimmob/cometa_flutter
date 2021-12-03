class VideoResponse {
  VideoModel video;
  List<VideoModel> videos;

  VideoResponse.fromJson(Map<String, dynamic> json) {
    if (json != null) {
      video = new VideoModel.fromJson(json);
    }
  }
  VideoResponse.fromJsonList(dynamic json) {
    if (json != null) {
      videos = [];
      List<dynamic> videosList = json;
      videosList
          .forEach((video) => {videos.add(new VideoModel.fromJson(video))});
    }
  }
}

class VideoModel {
  String titre;
  String video;

  VideoModel({
    this.titre,
    this.video,
  });
  VideoModel.fromJson(Map<String, dynamic> json) {
    titre = json["titre"] != null
        ? json["titre"]
        : "l'titre est inconnue pour le moment";
    video = json["video"] != null ? json["video"] : "";
  }
  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = new Map();
    map["titre"] = titre;
    map["video"] = video;

    return map;
  }
}
