import 'package:flutter/material.dart';
import 'package:mid_tourism_mobile/drawer.dart';

class TourguideForm extends StatefulWidget {
  const TourguideForm({super.key});

  @override
  State<TourguideForm> createState() => _TourguideForm();
}

class _TourguideForm extends State<TourguideForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tour Guide Form'),
      ),
      drawer: const drawerapp(),
      body: const Center(
        child: Text('this is a form'),
      ),
    );
  }
}