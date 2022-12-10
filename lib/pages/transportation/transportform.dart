import 'package:flutter/material.dart';
import 'package:mid_tourism_mobile/drawer.dart';
import 'package:mid_tourism_mobile/models/transportModel.dart';
import 'package:mid_tourism_mobile/pages/transportation/transportform.dart';

class TransportForm extends StatefulWidget {
  const TransportForm({super.key});

  @override
  State<TransportForm> createState() => _TransportForm();
}

class _TransportForm extends State<TransportForm> {
  final _formKey = GlobalKey<FormState>();
  String nameCompany = "";
  String nameTransport = "";
  String priceTransport = "";
  String desc = "";
  bool available = true;
  String model = "transport.transport";
  int pk = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Transportation Form'),
      ),
      drawer: const AppDrawer(),
      body: const Center(
        child: Text('this is a form'),
      )
    );
  }
}
