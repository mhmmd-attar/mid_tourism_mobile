import 'package:flutter/material.dart';
import 'package:mid_tourism_mobile/drawer.dart';

class RestaurantForm extends StatefulWidget {
  const RestaurantForm({super.key});

  @override
  State<RestaurantForm> createState() => _RestaurantForm();
}

class _RestaurantForm extends State<RestaurantForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Restaurant Form'),
      ),
      drawer: const drawerapp(),
      body: const Center(
        child: Text('this is a form'),
      ),
    );
  }
}
