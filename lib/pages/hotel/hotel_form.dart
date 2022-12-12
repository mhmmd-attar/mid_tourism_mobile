import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';

import 'package:mid_tourism_mobile/drawer.dart';
import 'package:mid_tourism_mobile/models/hotel_model.dart';
import 'package:mid_tourism_mobile/pages/hotel/hotel.dart';

class HotelForm extends StatefulWidget {
  const HotelForm({super.key});

  @override
  State<HotelForm> createState() => _HotelForm();
}

class _HotelForm extends State<HotelForm> {
  final _formKey = GlobalKey<FormState>();
  String hotelName = "";
  String hotelAddress = "";
  String hotelEmail = "";
  int hotelStar = 0;
  String hotelDescription = "";
  String hotelPhoto = "";
  String model = "hotel.hotel";
  int pk = 1;

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();

    return Scaffold(
        appBar: AppBar(
          title: const Text('Hotel Form'),
        ),
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
                        child: Text("Hotels",
                            style: TextStyle(
                                fontSize: 60,
                                fontFamily: 'Quicksand',
                                color: Colors.black)),
                      )),
                  Center(
                    child: Text("Discover hotels.",
                        style: TextStyle(
                            fontSize: 15,
                            fontFamily: 'Quicksand',
                            color: Colors.black.withOpacity(0.5))),
                  ),
                  Center(
                    child: Text(
                        "Experience authenticity and accommodation with MID-Tourism",
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
                                hintText: "Enter your Hotel Name!",
                                labelText: "Hotel Name",
                                // Added a circular border to make it neater
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                              ),
                              // Added behavior when name is typed
                              onChanged: (String? value) {
                                setState(() {
                                  hotelName = value!;
                                });
                              },
                              // Added behavior when data is saved
                              onSaved: (String? value) {
                                setState(() {
                                  hotelName = value!;
                                });
                              },
                              // Validator as form validation
                              validator: (String? value) {
                                if (value == null || value.isEmpty) {
                                  return 'Hotel name cannot be empty!';
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
                                hintText: "Enter your Hotel Address!",
                                labelText: "Hotel Address",
                                // Added a circular border to make it neater
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                              ),
                              // Added behavior when name is typed
                              onChanged: (String? value) {
                                setState(() {
                                  hotelAddress = value!;
                                });
                              },
                              // Added behavior when data is saved
                              onSaved: (String? value) {
                                setState(() {
                                  hotelAddress = value!;
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
                                hintText: "Enter your Hotel Email!",
                                labelText: "Hotel Email",
                                // Added a circular border to make it neater
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                              ),
                              // Added behavior when name is typed
                              onChanged: (String? value) {
                                setState(() {
                                  hotelEmail = value!;
                                });
                              },
                              // Added behavior when data is saved
                              onSaved: (String? value) {
                                setState(() {
                                  hotelEmail = value!;
                                });
                              },
                              // Validator as form validation
                              validator: (String? value) {
                                if (value == null || value.isEmpty) {
                                  return 'Hotel email cannot be empty!';
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
                                hintText: "Enter your hotel's star rating!",
                                labelText: "Star Rating",
                                // Added a circular border to make it neater
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                              ),
                              // Added behavior when name is typed
                              onChanged: (String? value) {
                                setState(() {
                                  hotelStar = int.parse(value!);
                                });
                              },
                              // Added behavior when data is saved
                              onSaved: (String? value) {
                                setState(() {
                                  hotelStar = int.parse(value!);
                                });
                              },
                              // Validator as form validation
                              validator: (String? value) {
                                if (value == null || value.isEmpty) {
                                  return 'Hotel star cannot be empty!';
                                } else if (double.tryParse(value) == null) {
                                  return 'Hotel star needs to be a number!';
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
                                hintText: "Enter your Hotel Description!",
                                labelText: "Hotel Description",
                                // Added a circular border to make it neater
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                              ),
                              // Added behavior when name is typed
                              onChanged: (String? value) {
                                setState(() {
                                  hotelDescription = value!;
                                });
                              },
                              // Added behavior when data is saved
                              onSaved: (String? value) {
                                setState(() {
                                  hotelDescription = value!;
                                });
                              },
                              // Validator as form validation
                              validator: (String? value) {
                                if (value == null || value.isEmpty) {
                                  return 'Hotel description cannot be empty!';
                                }
                                return null;
                              },
                            ),
                          ),
                          Padding(
                              padding: const EdgeInsets.only(top: 10.0),
                              child: Align(
                                alignment: Alignment.bottomCenter,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            minimumSize: const Size(120, 50),
                                            shape: const StadiumBorder(),
                                            backgroundColor:
                                            const Color(0xff6c757d)
                                        ),
                                        onPressed: () {
                                          Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => const HotelPage()),
                                          );
                                        },
                                        child: const Text("Back",
                                            style: TextStyle(
                                                color: Colors.white
                                            )
                                        )
                                    ),
                                    ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            minimumSize: const Size(120, 50),
                                            shape: const StadiumBorder(),
                                            backgroundColor:
                                            const Color(0xff3f8dcd)),
                                        onPressed: () {
                                          if (_formKey.currentState!.validate()) {
                                            _formKey.currentState!.save();
                                            Fields newFields = Fields(
                                              hotelName: hotelName,
                                              hotelAddress: hotelAddress,
                                              email: hotelEmail,
                                              star: hotelStar,
                                              description: hotelDescription,
                                              hotelPhoto: hotelPhoto,
                                            );
                                            Map<String, dynamic> jsonFields =
                                            newFields.toJson();
                                            Hotel newHotel = Hotel(
                                                model: model,
                                                pk: pk,
                                                fields: newFields);
                                            Map<String, dynamic> jsonHotel =
                                            newHotel.toJson();
                                            showDialog(
                                                context: context,
                                                builder: (BuildContext context) {
                                                  return const AlertDialog(
                                                      content: Text(
                                                          'Successfully saved!')
                                                  );
                                                });
                                          }
                                        },
                                        child: const Text("Save",
                                            style: TextStyle(
                                                color: Colors.white)
                                        )
                                    ),
                                  ],
                                ),
                              )
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
