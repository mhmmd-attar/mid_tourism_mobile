import 'package:flutter/material.dart';
import 'package:mid_tourism_mobile/drawer.dart';

class RoomForm extends StatefulWidget {
  const RoomForm({super.key});

  @override
  State<RoomForm> createState() => _RoomForm();
}

class _RoomForm extends State<RoomForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Room Form'),
      ),
      drawer: const AppDrawer(),
      body: const Center(
        child: Text('this is a form'),
      ),
    );
  }
}