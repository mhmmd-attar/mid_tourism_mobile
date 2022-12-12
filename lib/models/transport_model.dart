// To parse this JSON data, do
//
//     final transport = transportFromJson(jsonString);

import 'dart:convert';

import 'package:mid_tourism_mobile/models/resto_model.dart';
import 'package:http/http.dart' as http;

List<Transport> transportFromJson(String str) =>
    List<Transport>.from(json.decode(str).map((x) => Transport.fromJson(x)));

String transportToJson(List<Transport> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

Future<List<Transport>> fetchTransport() async {
  var url =
      Uri.parse('https://mid-tourism.up.railway.app/rental_transport/json');
  var response = await http.get(
    url,
    headers: {
      "Content-Type": "application/json",
    },
  );
  // decode the response into the json form
  var data = jsonDecode(utf8.decode(response.bodyBytes));
  // convert the json data into Transport object
  List<Transport> listTransport = [];
  for (var d in data) {
    if (d != null) {
      listTransport.add(Transport.fromJson(d));
    }
  }
  return listTransport;
}
//
// Future<int> getLength() async {
//   var url = Uri.parse('https://mid-tourism.up.railway.app/Transport/json');
//   var response = await http.get(
//     url,
//     headers: {
//       "Content-Type": "application/json",
//     },
//   );
//   // decode the response into the json form
//   var data = jsonDecode(utf8.decode(response.bodyBytes));
//   // convert the json data into Transport object
//   List<Transport> listTransport = [];
//   for (var d in data) {
//     if (d != null) {
//       listTransport.add(Transport.fromJson(d));
//     }
//   }
//
//   return listTransport.length;
// }

class Transport {
  Transport({
    required this.model,
    required this.pk,
    required this.fields,
  });

  String model;
  int pk;
  Fields fields;

  factory Transport.fromJson(Map<String, dynamic> json) => Transport(
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
    required this.companyName,
    required this.transportName,
    required this.transportPrice,
    required this.description,
    required this.availability,
  });

  String companyName;
  String transportName;
  String transportPrice;
  String description;
  bool availability;

  factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        companyName: json["company_name"],
        transportName: json["transport_name"],
        transportPrice: json["transport_price"],
        description: json["description"],
        availability: json["availability"],
      );

  Map<String, dynamic> toJson() => {
        "company_name": companyName,
        "transport_name": transportName,
        "transport_price": transportPrice,
        "description": description,
        "availability": availability,
      };
}
