// ignore_for_file: no_leading_underscores_for_local_identifiers

class ImageModel {
  final int id;
  final String portraitPath;
  bool isFavorite;
  final String url;

  ImageModel(
      {required this.id,
      required this.portraitPath,
      this.isFavorite = false,
      required this.url});

  factory ImageModel.fromJson(Map<String, dynamic> json) {
    return ImageModel(
      id: json["id"],
      portraitPath: json["src"]["portrait"],
      isFavorite: json["liked"],
      url: json["alt"],
    );
  }

  ImageModel.emptyConstructor({
    this.url = "",
    this.id = 0,
    this.isFavorite = false,
    this.portraitPath = "",
  });

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> _data = <String, dynamic>{};
  //   _data["id"] = id;
  //   _data["scr"] = portraitPath;
  //   _data["liked"] = isFavorite;
  //   _data["alt"] = url;
  //   return _data;
  // }

  
}

// class Src {
//   String? original;
//   String? large2X;
//   String? large;
//   String? medium;
//   String? small;
//   String? portrait;
//   String? landscape;
//   String? tiny;

//   Src(
//       {this.original,
//       this.large2X,
//       this.large,
//       this.medium,
//       this.small,
//       this.portrait,
//       this.landscape,
//       this.tiny});

//   Src.fromJson(Map<String, dynamic> json) {
//     original = json["original"];
//     large2X = json["large2x"];
//     large = json["large"];
//     medium = json["medium"];
//     small = json["small"];
//     portrait = json["portrait"];
//     landscape = json["landscape"];
//     tiny = json["tiny"];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> _data = <String, dynamic>{};
//     _data["original"] = original;
//     _data["large2x"] = large2X;
//     _data["large"] = large;
//     _data["medium"] = medium;
//     _data["small"] = small;
//     _data["portrait"] = portrait;
//     _data["landscape"] = landscape;
//     _data["tiny"] = tiny;
//     return _data;
//   }
// }
