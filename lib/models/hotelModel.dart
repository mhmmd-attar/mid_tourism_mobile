import 'dart:convert';
import 'package:http/http.dart' as http;

class HotelFuture {
  Future<List<Hotel>> fetchHotel() async {
    var url = Uri.parse(
        'https://mid-tourism.up.railway.app/hotel/json');
    var response = await http.get(
      url,
      headers: {
        "Content-Type": "application/json",
      },
    );
    // decode the response into the json form
    var data = jsonDecode(utf8.decode(response.bodyBytes));
    // convert the json data into Hotel object
    List<Hotel> listHotel = [];
    for (var d in data) {
      if (d != null) {
        listHotel.add(Hotel.fromJson(d));
      }
    }
    return listHotel;
  }

  Future<int> getLength() async {
    var url = Uri.parse(
        'https://mid-tourism.up.railway.app/hotel/json');
    var response = await http.get(
      url,
      headers: {
        "Content-Type": "application/json",
      },
    );
    // decode the response into the json form
    var data = jsonDecode(utf8.decode(response.bodyBytes));
    // convert the json data into Hotel object
    List<Hotel> listHotel = [];
    for (var d in data) {
      if (d != null) {
        listHotel.add(Hotel.fromJson(d));
      }
    }

    return listHotel.length;
  }
}

List<Hotel> hotelFromJson(String str) => List<Hotel>.from(json.decode(str).map((x) => Hotel.fromJson(x)));

String hotelToJson(List<Hotel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Hotel {
  Hotel({
    required this.model,
    required this.pk,
    required this.fields,
  });

  String model;
  int pk;
  Fields fields;

  factory Hotel.fromJson(Map<String, dynamic> json) => Hotel(
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
    required this.hotelName,
    required this.hotelAddress,
    required this.hotelPhoto,
    required this.email,
    required this.star,
    required this.description,
  });

  String hotelName;
  String hotelAddress;
  String hotelPhoto;
  String email;
  int star;
  String description;

  factory Fields.fromJson(Map<String, dynamic> json) => Fields(
    hotelName: json["hotel_name"],
    hotelAddress: json["hotel_address"],
    hotelPhoto: json["hotel_photo"],
    email: json["email"],
    star: json["star"],
    description: json["description"],
  );

  Map<String, dynamic> toJson() => {
    "hotel_name": hotelName,
    "hotel_address": hotelAddress,
    "hotel_photo": hotelPhoto,
    "email": email,
    "star": star,
    "description": description,
  };
}
