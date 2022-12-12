import 'dart:convert';
import 'package:http/http.dart' as http;

Future<List<Room>> fetchRoom() async {
  var url = Uri.parse('https://mid-tourism.up.railway.app/hotel/json_room');
  var response = await http.get(
    url,
    headers: {
      "Content-Type": "application/json",
    },
  );
  // decode the response into the json form
  var data = jsonDecode(utf8.decode(response.bodyBytes));
  // convert the json data into Hotel object
  List<Room> listRoom = [];
  for (var d in data) {
    if (d != null) {
      listRoom.add(Room.fromJson(d));
    }
  }
  return listRoom;
}

// Future<int> getLength() async {
//   var url = Uri.parse(
//       'https://mid-tourism.up.railway.app/hotel/json_room');
//   var response = await http.get(
//     url,
//     headers: {
//       "Content-Type": "application/json",
//     },
//   );
//   // decode the response into the json form
//   var data = jsonDecode(utf8.decode(response.bodyBytes));
//   // convert the json data into Hotel object
//   List<Room> listRoom = [];
//   for (var d in data) {
//     if (d != null) {
//       listRoom.add(Room.fromJson(d));
//     }
//   }
//
//   return listRoom.length;
// }

List<Room> roomFromJson(String str) =>
    List<Room>.from(json.decode(str).map((x) => Room.fromJson(x)));

String roomToJson(List<Room> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Room {
  Room({
    required this.model,
    required this.pk,
    required this.fields,
  });

  String model;
  int pk;
  Fields fields;

  factory Room.fromJson(Map<String, dynamic> json) => Room(
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
    required this.roomType,
    required this.roomDescription,
    required this.roomPhoto,
    required this.roomPrice,
    required this.roomHotel,
    required this.isBooked,
  });

  String roomType;
  String roomDescription;
  String roomPhoto;
  int roomPrice;
  int roomHotel;
  bool isBooked;

  factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        roomType: json["room_type"],
        roomDescription: json["room_description"],
        roomPhoto: json["room_photo"],
        roomPrice: json["room_price"],
        roomHotel: json["room_hotel"],
        isBooked: json["is_booked"],
      );

  Map<String, dynamic> toJson() => {
        "room_type": roomType,
        "room_description": roomDescription,
        "room_photo": roomPhoto,
        "room_price": roomPrice,
        "room_hotel": roomHotel,
        "is_booked": isBooked,
      };
}
