import 'package:flutter/material.dart';
import 'package:mid_tourism_mobile/drawer.dart';
import 'package:mid_tourism_mobile/pages/tourguide/tourguideform.dart';

class TourguidePage extends StatefulWidget {
  const TourguidePage({super.key});

  @override
  State<TourguidePage> createState() => _Tourguide();
}

class _Tourguide extends State<TourguidePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tour Guide'),
      ),
      drawer: const AppDrawer(),
      body: Center(
        child: TextButton(
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => const TourguideForm()),
            );
          },
          child: const Text('Add Tourguide'),
        ),
      ),
    );
  }
}