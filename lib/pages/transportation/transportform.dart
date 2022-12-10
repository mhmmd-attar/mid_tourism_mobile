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
                                  nameCompany = value!;
                                });
                              },
                              // Added behavior when data is saved
                              onSaved: (String? value) {
                                setState(() {
                                  nameCompany = value!;
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
                                  nameTransport = value!;
                                });
                              },
                              // Added behavior when data is saved
                              onSaved: (String? value) {
                                setState(() {
                                  nameTransport = value!;
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
                                  priceTransport = value!;
                                });
                              },
                              // Added behavior when data is saved
                              onSaved: (String? value) {
                                setState(() {
                                  priceTransport = value!;
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
                          Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Align(
                                  alignment: Alignment.bottomCenter,
                                  child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          minimumSize: const Size(280, 50),
                                          shape: const StadiumBorder(),
                                          backgroundColor:
                                              const Color(0xff3f8dcd)),
                                      onPressed: () {
                                        if (_formKey.currentState!.validate()) {
                                          _formKey.currentState!.save();
                                          Fields uwawfields = Fields(
                                            companyName: nameCompany,
                                            transportName: nameTransport,
                                            transportPrice: priceTransport,
                                            description: desc,
                                            availability: available,
                                          );
                                          Map<String, dynamic> jsonFields =
                                              uwawfields.toJson();
                                          Transport uwaw = Transport(
                                              model: model,
                                              pk: pk,
                                              fields: uwawfields);
                                          Map<String, dynamic> jsonRoom =
                                              uwaw.toJson();
                                          showDialog(
                                              context: context,
                                              builder: (BuildContext context) {
                                                return const AlertDialog(
                                                    content: Text(
                                                        'Successfully saved!'));
                                              });
                                        }
                                      },
                                      child: const Text("Save",
                                          style: TextStyle(
                                              color: Colors.white))))),
                        ],
                      ),
                    ),
                  )
                ],
              ))
        ]))));
  }
}
