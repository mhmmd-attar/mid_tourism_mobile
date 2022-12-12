import 'package:flutter/material.dart';

import 'package:mid_tourism_mobile/main.dart';
import 'package:mid_tourism_mobile/pages/hotel/hotel.dart';
import 'package:mid_tourism_mobile/pages/landmark/landmark.dart';
import 'package:mid_tourism_mobile/pages/restaurant/restaurant.dart';
import 'package:mid_tourism_mobile/pages/tourguide/tourguide.dart';
import 'package:mid_tourism_mobile/pages/transportation/transport.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Ink(
            color: Colors.blue,
            child: const ListTile(
              title: Text(''),
            ),
          ),
          ListTile(
            title: const Text('Homepage'),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const MyHomePage()),
              );
            },
          ),
          ListTile(
            title: const Text('Hotels'),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const HotelPage()),
              );
            },
          ),
          ListTile(
            title: const Text('Landmarks'),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const LandmarkPage()),
              );
            },
          ),
          ListTile(
            title: const Text('Restaurants'),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const RestaurantPage()),
              );
            },
          ),
          ListTile(
            title: const Text('Tourguides'),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const TourguidePage()),
              );
            },
          ),
          ListTile(
            title: const Text('Transportations'),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const TransportPage()),
              );
            },
          ),
        ],
      ),
    );
  }
}