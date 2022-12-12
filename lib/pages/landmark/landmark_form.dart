import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';

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
    final request = context.watch<CookieRequest>();

    return Scaffold(
      appBar: AppBar(),
      drawer: const AppDrawer(),
      body: const Center(
        child: Text('this is a form'),
      ),
    );
  }
}