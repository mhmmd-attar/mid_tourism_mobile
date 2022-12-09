import 'package:flutter/material.dart';
import 'package:mid_tourism_mobile/drawer.dart';
import 'package:mid_tourism_mobile/models/roomModel.dart';

class RoomForm extends StatefulWidget {
  const RoomForm({super.key, required this.hotelPk});
  final int hotelPk;

  @override
  State<RoomForm> createState() => _RoomForm();
}

class _RoomForm extends State<RoomForm> {
  final _formKey = GlobalKey<FormState>();
  String roomType = "";
  String roomDescription = "";
  int roomPrice = 0;
  String roomPhoto = "";
  bool booking = false;
  String model = "room.room";
  int pk = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Room Form'),
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
                              child: Text("Rooms",
                                  style: TextStyle(
                                      fontSize: 60,
                                      fontFamily: 'Quicksand',
                                      color: Colors.black)),
                            )
                        ),
                        Center(
                          child: Text("Select your room.",
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
                                      hintText: "Enter your Room Type!",
                                      labelText: "Room Type",
                                      // Added a circular border to make it neater
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(5.0),
                                      ),
                                    ),
                                    // Added behavior when name is typed
                                    onChanged: (String? value) {
                                      setState(() {
                                        roomType = value!;
                                      });
                                    },
                                    // Added behavior when data is saved
                                    onSaved: (String? value) {
                                      setState(() {
                                        roomType = value!;
                                      });
                                    },
                                    // Validator as form validation
                                    validator: (String? value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Room type cannot be empty!';
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
                                      "Enter your Room Description!",
                                      labelText: "Room Description",
                                      // Added a circular border to make it neater
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(5.0),
                                      ),
                                    ),
                                    // Added behavior when name is typed
                                    onChanged: (String? value) {
                                      setState(() {
                                        roomDescription = value!;
                                      });
                                    },
                                    // Added behavior when data is saved
                                    onSaved: (String? value) {
                                      setState(() {
                                        roomDescription = value!;
                                      });
                                    },
                                    // Validator as form validation
                                    validator: (String? value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Room description cannot be empty!';
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
                                      "Enter your room price!",
                                      labelText: "Room Price",
                                      // Added a circular border to make it neater
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(5.0),
                                      ),
                                    ),
                                    // Added behavior when name is typed
                                    onChanged: (String? value) {
                                      setState(() {
                                        roomPrice = int.parse(value!);
                                      });
                                    },
                                    // Added behavior when data is saved
                                    onSaved: (String? value) {
                                      setState(() {
                                        roomPrice = int.parse(value!);
                                      });
                                    },
                                    // Validator as form validation
                                    validator: (String? value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Room price cannot be empty!';
                                      } else if (double.tryParse(value) == null) {
                                        return 'Room price needs to be a number!';
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
                                                backgroundColor: const Color(0xff3f8dcd)
                                            ),
                                            onPressed: () {
                                              if (_formKey.currentState!
                                                  .validate()) {
                                                _formKey.currentState!.save();
                                                Fields newFields = Fields(
                                                  roomType: roomType,
                                                  roomDescription: roomDescription,
                                                  roomPrice: roomPrice,
                                                  roomPhoto: roomPhoto,
                                                  roomHotel: widget.hotelPk,
                                                  isBooked: booking
                                                );
                                                Map<String, dynamic> jsonFields =
                                                newFields.toJson();
                                                Room newRoom =
                                                Room(
                                                    model: model,
                                                    pk: pk,
                                                    fields: newFields);
                                                Map<String, dynamic>
                                                jsonRoom =
                                                newRoom.toJson();
                                                showDialog(
                                                    context: context,
                                                    builder:
                                                        (BuildContext context) {
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
              ]))
      )
    );
  }
}