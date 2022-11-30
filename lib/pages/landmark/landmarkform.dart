import 'package:flutter/material.dart';
import 'package:mid_tourism_mobile/drawer.dart';

class LandmarkForm extends StatefulWidget {
  const LandmarkForm({super.key});

  @override
  State<LandmarkForm> createState() => _LandmarkForm();
}

class _LandmarkForm extends State<LandmarkForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Landmark Form'),
      ),
      drawer: const drawerapp(),
      body: const Center(
        child: Text('this is a form'),
      ),
    );
  }
}