// To parse this JSON data, do
//
//     final photoResponse = photoResponseFromJson(jsonString);

import 'dart:convert';

PhotoResponse photoResponseFromJson(String str) =>
    PhotoResponse.fromJson(json.decode(str));

String photoResponseToJson(PhotoResponse data) => json.encode(data.toJson());

class PhotoResponse {
  List<Photo>? photos;

  PhotoResponse({
    this.photos,
  });

  factory PhotoResponse.fromJson(Map<String, dynamic> json) => PhotoResponse(
        photos: json["photos"] == null
            ? []
            : List<Photo>.from(json["photos"]!.map((x) => Photo.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "photos": photos == null
            ? []
            : List<dynamic>.from(photos!.map((x) => x.toJson())),
      };
}

class Photo {
  Src? src;

  Photo({
    this.src,
  });

  factory Photo.fromJson(Map<String, dynamic> json) => Photo(
        src: json["src"] == null ? null : Src.fromJson(json["src"]),
      );

  Map<String, dynamic> toJson() => {
        "src": src?.toJson(),
      };
}

class Src {
  String? original;

  Src({
    this.original,
  });

  factory Src.fromJson(Map<String, dynamic> json) => Src(
        original: json["original"],
      );

  Map<String, dynamic> toJson() => {
        "original": original,
      };
}
