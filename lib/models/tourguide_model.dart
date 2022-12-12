// To parse this JSON data, do
//
//     final tourguide = tourguideFromJson(jsonString);

import 'dart:convert';

import 'package:http/http.dart' as http;

Future<List<Tourguide>> fetchTourguide() async {
  var url = Uri.parse(
      'https://mid-tourism.up.railway.app/tourguide/json');
  var response = await http.get(
    url,
    headers: {
      "Content-Type": "application/json",
    },
  );
  var data = jsonDecode(utf8.decode(response.bodyBytes));
  List<Tourguide> listTourguide = [];
  for (var d in data) {
    if (d != null) {
      listTourguide.add(Tourguide.fromJson(d));
    }
  }
  return listTourguide;
}

List<Tourguide> tourguideFromJson(String str) => List<Tourguide>.from(json.decode(str).map((x) => Tourguide.fromJson(x)));

String tourguideToJson(List<Tourguide> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Tourguide {
  Tourguide({
    required this.model,
    required this.pk,
    required this.fields,
  });

  String model;
  int pk;
  Fields fields;

  factory Tourguide.fromJson(Map<String, dynamic> json) => Tourguide(
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
    required this.company,
    required this.date,
    required this.destination,
    required this.isBooked,
  });

  String company;
  String date;
  String destination;
  bool isBooked;

  factory Fields.fromJson(Map<String, dynamic> json) => Fields(
    company: json["company"],
    date: json["date"],
    destination: json["destination"],
    isBooked: json["is_booked"],
  );

  Map<String, dynamic> toJson() => {
    "company": company,
    "date": date,
    "destination": destination,
    "is_booked": isBooked,
  };
}
