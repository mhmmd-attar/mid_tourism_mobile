import 'package:flutter/material.dart';
import 'package:mid_tourism_mobile/drawer.dart';

class HotelForm extends StatefulWidget {
  const HotelForm({super.key});

  @override
  State<HotelForm> createState() => _HotelForm();
}

class _HotelForm extends State<HotelForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hotel Form'),
      ),
      drawer: const AppDrawer(),
      body: const Center(
        child: Text('this is a form'),
      ),
    );
  }
}