import 'package:flutter/material.dart';
import 'package:mid_tourism_mobile/drawer.dart';

class TransportForm extends StatefulWidget {
  const TransportForm({super.key});

  @override
  State<TransportForm> createState() => _TransportForm();
}

class _TransportForm extends State<TransportForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Transportation Form'),
      ),
      drawer: const drawerapp(),
      body: const Center(
        child: Text('this is a form'),
      )
    );
  }
}