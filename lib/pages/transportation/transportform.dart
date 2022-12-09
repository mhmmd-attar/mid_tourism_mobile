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
          title: const Text('Hotel Form'),
        ),
        drawer: const drawerapp(),
        body: SingleChildScrollView(
            child: Center(
                child: Column(children: <Widget>[
          Container(
              padding: const EdgeInsets.all(5),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // ignore: prefer_const_constructors
                  Container(
                      padding: const EdgeInsets.only(left: 15, right: 15),
                      child: const FittedBox(
                        fit: BoxFit.fitWidth,
                        child: Text("Transportations",
                            style: TextStyle(
                                fontSize: 60,
                                fontFamily: 'Quicksand',
                                color: Colors.black)),
                      )),
                  Center(
                    child: Text("",
                        style: TextStyle(
                            fontSize: 15,
                            fontFamily: 'Quicksand',
                            color: Colors.black.withOpacity(0.5))),
                  ),
                  Center(
                    child: Text("",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 15,
                            fontFamily: 'Quicksand',
                            color: const Color(0xff000000).withOpacity(0.5))),
                  ),
                  Form(
                    key: _formKey,
                    child: Container(
                      padding: const EdgeInsets.all(15.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            // Using padding of 8 pixels
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                              decoration: InputDecoration(
                                hintText: "Enter Company Name",
                                labelText: "Company Name",
                                // Added a circular border to make it neater
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                              ),
                              // Added behavior when name is typed
                              onChanged: (String? value) {
                                setState(() {
                                  companyName = value!;
                                });
                              },
                              // Added behavior when data is saved
                              onSaved: (String? value) {
                                setState(() {
                                  companyName = value!;
                                });
                              },
                              // Validator as form validation
                              validator: (String? value) {
                                if (value == null || value.isEmpty) {
                                  return 'Company Name cannot be empty!';
                                }
                                return null;
                              },
                            ),
                          ),
                          Padding(
                            // Using padding of 8 pixels
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                              decoration: InputDecoration(
                                hintText: "Enter your Vehicle Type",
                                labelText: "Vehicle Type",
                                // Added a circular border to make it neater
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                              ),
                              // Added behavior when name is typed
                              onChanged: (String? value) {
                                setState(() {
                                  transportName = value!;
                                });
                              },
                              // Added behavior when data is saved
                              onSaved: (String? value) {
                                setState(() {
                                  transportName = value!;
                                });
                              },
                              // Validator as form validation
                              validator: (String? value) {
                                if (value == null || value.isEmpty) {
                                  return 'Hotel address cannot be empty!';
                                }
                                return null;
                              },
                            ),
                          ),
                          Padding(
                            // Using padding of 8 pixels
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                              decoration: InputDecoration(
                                hintText: "Enter the price",
                                labelText: "Price",
                                // Added a circular border to make it neater
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                              ),
                              // Added behavior when name is typed
                              onChanged: (String? value) {
                                setState(() {
                                  transportPrice = value!;
                                });
                              },
                              // Added behavior when data is saved
                              onSaved: (String? value) {
                                setState(() {
                                  transportPrice = value!;
                                });
                              },
                              // Validator as form validation
                              validator: (String? value) {
                                if (value == null || value.isEmpty) {
                                  return 'Price cannot be empty!';
                                }
                                return null;
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ))
        ]))));
  }
}
