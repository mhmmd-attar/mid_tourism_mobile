import 'package:flutter/material.dart';
import 'package:mid_tourism_mobile/drawer.dart';
import 'package:mid_tourism_mobile/models/hotelModel.dart';
import 'package:mid_tourism_mobile/pages/transportation/transportform.dart';

enum booleanEnum { yes, no }

class TransportForm extends StatefulWidget {
  const TransportForm({super.key});

  @override
  State<TransportForm> createState() => _TransportForm();
}

class _TransportForm extends State<TransportForm> {
  final _formKey = GlobalKey<FormState>();
  String companyName = "";
  String transportName = "";
  String transportPrice = "";
  String description = "";
  bool availability = false;
  int pk = 1;
  booleanEnum? _booleanEnum;

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
