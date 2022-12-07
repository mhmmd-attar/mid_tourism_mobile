import 'package:flutter/material.dart';
import 'package:mid_tourism_mobile/drawer.dart';
import 'package:mid_tourism_mobile/models/restoModel.dart';

class RestaurantForm extends StatefulWidget {
  const RestaurantForm({super.key, required this.model, required this.pk});
  final String model;
  final int pk;
  @override
  State<RestaurantForm> createState() => _RestaurantForm();
}

class _RestaurantForm extends State<RestaurantForm> {
  final _formKey = GlobalKey<FormState>();
  String resto_name = "";
  String resto_address = "";
  String resto_email = "";
  int resto_phone = 0;
  String resto_photo = "";
  String resto_description = "";
  String resto_delivery = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: const drawerapp(),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(20.0),
            margin: const EdgeInsets.all(8),
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
                      hintText: "Enter your Restaurant Name!",
                      labelText: "Restaurant Name",
                      // Added a circular border to make it neater
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    // Added behavior when name is typed
                    onChanged: (String? value) {
                      setState(() {
                        resto_name = value!;
                      });
                    },
                    // Added behavior when data is saved
                    onSaved: (String? value) {
                      setState(() {
                        resto_name = value!;
                      });
                    },
                    // Validator as form validation
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Restaurant name cannot be empty!';
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
                      hintText: "Enter your Restaurant Address!",
                      labelText: "Restaurant Address",
                      // Added a circular border to make it neater
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    // Added behavior when name is typed
                    onChanged: (String? value) {
                      setState(() {
                        resto_name = value!;
                      });
                    },
                    // Added behavior when data is saved
                    onSaved: (String? value) {
                      setState(() {
                        resto_name = value!;
                      });
                    },
                    // Validator as form validation
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Restaurant address cannot be empty!';
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
                      hintText: "Enter your Restaurant Email!",
                      labelText: "Restaurant Email",
                      // Added a circular border to make it neater
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    // Added behavior when name is typed
                    onChanged: (String? value) {
                      setState(() {
                        resto_name = value!;
                      });
                    },
                    // Added behavior when data is saved
                    onSaved: (String? value) {
                      setState(() {
                        resto_name = value!;
                      });
                    },
                    // Validator as form validation
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Restaurant email cannot be empty!';
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
                      hintText: "Enter your restaurant's phone number!",
                      labelText: "Amount",
                      // Added a circular border to make it neater
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    // Added behavior when name is typed
                    onChanged: (String? value) {
                      setState(() {
                        resto_phone = int.parse(value!);
                      });
                    },
                    // Added behavior when data is saved
                    onSaved: (String? value) {
                      setState(() {
                        resto_phone = int.parse(value!);
                      });
                    },
                    // Validator as form validation
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Phone number cannot be empty!';
                      } else if (double.tryParse(value) == null) {
                        return 'Phone number needs to be a number!';
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
                      hintText: "Enter your Restaurant Description!",
                      labelText: "Restaurant Description",
                      // Added a circular border to make it neater
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    // Added behavior when name is typed
                    onChanged: (String? value) {
                      setState(() {
                        resto_name = value!;
                      });
                    },
                    // Added behavior when data is saved
                    onSaved: (String? value) {
                      setState(() {
                        resto_name = value!;
                      });
                    },
                    // Validator as form validation
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Restaurant description cannot be empty!';
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
                      hintText: "Enter your Restaurant Website!",
                      labelText: "Restaurant Website",
                      // Added a circular border to make it neater
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    // Added behavior when name is typed
                    onChanged: (String? value) {
                      setState(() {
                        resto_name = value!;
                      });
                    },
                    // Added behavior when data is saved
                    onSaved: (String? value) {
                      setState(() {
                        resto_name = value!;
                      });
                    },
                    // Validator as form validation
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Restaurant website cannot be empty!';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Align(
                        alignment: Alignment.bottomCenter,
                        child: TextButton(
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.blue),
                            ),
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                _formKey.currentState!.save();
                                Fields new_fields = Fields(
                                    restoName: resto_name,
                                    restoAddress: resto_address,
                                    restoEmail: resto_email,
                                    restoPhone: resto_phone,
                                    restoDescription: resto_description,
                                    restoPhoto: resto_photo,
                                    restoDelivery: resto_delivery);
                                Map<String, dynamic> jsonFields =
                                    new_fields.toJson();
                                Restaurant new_restaurant = Restaurant(
                                    model: widget.model,
                                    pk: widget.pk + 1,
                                    fields: new_fields);
                                Map<String, dynamic> jsonRestaurant =
                                    new_restaurant.toJson();
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return const AlertDialog(
                                          content: Text('Successfully saved!'));
                                    });
                              }
                            },
                            child: const Text("Save",
                                style: TextStyle(color: Colors.white))))),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
