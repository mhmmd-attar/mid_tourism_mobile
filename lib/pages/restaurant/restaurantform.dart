import 'package:flutter/material.dart';
import 'package:mid_tourism_mobile/drawer.dart';
import 'package:mid_tourism_mobile/models/restoModel.dart';
import 'package:mid_tourism_mobile/pages/restaurant/restaurant.dart';

class RestaurantForm extends StatefulWidget {
  const RestaurantForm({super.key});
  @override
  State<RestaurantForm> createState() => _RestaurantForm();
}

class _RestaurantForm extends State<RestaurantForm> {
  final _formKey = GlobalKey<FormState>();
  String resto_name = "";
  String resto_address = "";
  String resto_email = "";
  String resto_phone = "";
  String resto_photo = "blank";
  String resto_description = "";
  String resto_delivery = "";
  String model = "resto.restaurant";
  int pk = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        drawer: const AppDrawer(),
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
                        child: Text("Restaurants",
                            style: TextStyle(
                                fontSize: 60,
                                fontFamily: 'Quicksand',
                                color: Colors.black)),
                      )),
                  Center(
                    child: Text("Delight in cuisine.",
                        style: TextStyle(
                            fontSize: 15,
                            fontFamily: 'Quicksand',
                            color: Colors.black.withOpacity(0.5))),
                  ),
                  Center(
                    child: Text(
                        "Experience authenticity and accomodation with MID-Tourism",
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
                                  resto_address = value!;
                                });
                              },
                              // Added behavior when data is saved
                              onSaved: (String? value) {
                                setState(() {
                                  resto_address = value!;
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
                                  resto_email = value!;
                                });
                              },
                              // Added behavior when data is saved
                              onSaved: (String? value) {
                                setState(() {
                                  resto_email = value!;
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
                                hintText:
                                    "Enter your restaurant's phone number!",
                                labelText: "Amount",
                                // Added a circular border to make it neater
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                              ),
                              // Added behavior when name is typed
                              onChanged: (String? value) {
                                setState(() {
                                  resto_phone = value!;
                                });
                              },
                              // Added behavior when data is saved
                              onSaved: (String? value) {
                                setState(() {
                                  resto_phone = value!;
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
                                  resto_description = value!;
                                });
                              },
                              // Added behavior when data is saved
                              onSaved: (String? value) {
                                setState(() {
                                  resto_description = value!;
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
                                  resto_delivery = value!;
                                });
                              },
                              // Added behavior when data is saved
                              onSaved: (String? value) {
                                setState(() {
                                  resto_delivery = value!;
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
                                          RestaurantFuture().createRestaurant(
                                              resto_name,
                                              resto_address,
                                              resto_email,
                                              resto_phone,
                                              resto_description,
                                              resto_photo,
                                              resto_delivery);

                                          showDialog(
                                              context: context,
                                              builder: (BuildContext context) {
                                                return const AlertDialog(
                                                    content: Text(
                                                        'Successfully saved!'));
                                              });
                                          Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const RestaurantPage()),
                                          );
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
