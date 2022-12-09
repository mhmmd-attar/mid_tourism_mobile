import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:mid_tourism_mobile/drawer.dart';
import 'package:mid_tourism_mobile/pages/restaurant/restaurantform.dart';
import 'package:mid_tourism_mobile/pages/homepage/login.dart';
import 'package:mid_tourism_mobile/pages/homepage/register.dart';
import 'dart:convert';

class RestaurantFuture {
  Future<List<Restaurant>> fetchRestaurant() async {
    var url = Uri.parse(
        'https://mid-tourism.up.railway.app/resto/show_restaurant_json');
    var response = await http.get(
      url,
      headers: {
        "Content-Type": "application/json",
      },
    );
    // decode the response into the json form
    var data = jsonDecode(utf8.decode(response.bodyBytes));
    print(data);
    // convert the json data into Watchlist object
    List<Restaurant> listWatchlist = [];
    for (var d in data) {
      print(d);
      if (d != null) {
        listWatchlist.add(Restaurant.fromJson(d));
        print(listWatchlist);
      }
    }
    print(listWatchlist);
    return listWatchlist;
  }

  Future<int> getLength() async {
    var url = Uri.parse(
        'https://mid-tourism.up.railway.app/resto/show_restaurant_json');
    var response = await http.get(
      url,
      headers: {
        "Content-Type": "application/json",
      },
    );
    // decode the response into the json form
    var data = jsonDecode(utf8.decode(response.bodyBytes));
    print(data);
    // convert the json data into Watchlist object
    List<Restaurant> listWatchlist = [];
    for (var d in data) {
      if (d != null) {
        listWatchlist.add(Restaurant.fromJson(d));
        print(listWatchlist);
      }
    }

    return listWatchlist.length;
  }
}

List<Restaurant> restaurantFromJson(String str) =>
    List<Restaurant>.from(json.decode(str).map((x) => Restaurant.fromJson(x)));

String restaurantToJson(List<Restaurant> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Restaurant {
  Restaurant({
    required this.model,
    required this.pk,
    required this.fields,
  });

  String model;
  int pk;
  Fields fields;

  factory Restaurant.fromJson(Map<String, dynamic> json) => Restaurant(
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
    required this.restoName,
    required this.restoAddress,
    required this.restoEmail,
    required this.restoPhone,
    required this.restoDescription,
    required this.restoPhoto,
    required this.restoDelivery,
  });

  String restoName;
  String restoAddress;
  String restoEmail;
  int restoPhone;
  String restoDescription;
  String restoPhoto;
  String restoDelivery;

  factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        restoName: json["resto_name"],
        restoAddress: json["resto_address"],
        restoEmail: json["resto_email"],
        restoPhone: json["resto_phone"],
        restoDescription: json["resto_description"],
        restoPhoto: json["resto_photo"],
        restoDelivery: json["resto_delivery"],
      );

  Map<String, dynamic> toJson() => {
        "resto_name": restoName,
        "resto_address": restoAddress,
        "resto_email": restoEmail,
        "resto_phone": restoPhone,
        "resto_description": restoDescription,
        "resto_photo": restoPhoto,
        "resto_delivery": restoDelivery,
      };
}
