import 'dart:convert';
import 'package:http/http.dart' as http;

Future<List<Landmark>> fetchLandmarks() async {
  var url = Uri.parse(
      'https://mid-tourism.up.railway.app/landmarks/json');
  var response = await http.get(
    url,
    headers: {
      "Content-Type": "application/json",
    },
  );
  // decode the response into the json form
  var data = jsonDecode(utf8.decode(response.bodyBytes));
  // convert the json data into Hotel object
  List<Landmark> listLandmarks = [];
  for (var d in data) {
    if (d != null) {
      listLandmarks.add(Landmark.fromJson(d));
    }
  }
  return listLandmarks;
}

// Future<int> getLandmarksLength() async {
//   var url = Uri.parse(
//       'https://mid-tourism.up.railway.app/landmarks/json');
//   var response = await http.get(
//     url,
//     headers: {
//       "Content-Type": "application/json",
//     },
//   );
//   // decode the response into the json form
//   var data = jsonDecode(utf8.decode(response.bodyBytes));
//   // convert the json data into Hotel object
//   List<Landmark> listLandmarks = [];
//   for (var d in data) {
//     if (d != null) {
//       listLandmarks.add(Landmark.fromJson(d));
//     }
//   }
//
//   return listLandmarks.length;
// }

List<Landmark> landmarkFromJson(String str) => List<Landmark>.from(json.decode(str).map((x) => Landmark.fromJson(x)));

String landmarkToJson(List<Landmark> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Landmark {
  Landmark({
    required this.model,
    required this.pk,
    required this.fields,
  });

  String model;
  int pk;
  Fields fields;

  factory Landmark.fromJson(Map<String, dynamic> json) => Landmark(
    model: json["model"],
    pk: json["pk"],
    fields: Fields.fromJson(json["fields"]),
  );

  Map<String, dynamic> toJson() => {
    "model": model,
    "pk": pk,
    "fields": fields.toJson(),
  };
}

class Fields {
  Fields({
    required this.name,
    required this.location,
    required this.description,
    required this.image,
  });

  String name;
  String location;
  String description;
  String image;

  factory Fields.fromJson(Map<String, dynamic> json) => Fields(
    name: json["name"],
    location: json["location"],
    description: json["description"],
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "location": location,
    "description": description,
    "image": image,
  };
}
