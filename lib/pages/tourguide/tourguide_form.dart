import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mid_tourism_mobile/pages/tourguide/tourguide.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:http/http.dart' as http;
import 'package:mid_tourism_mobile/drawer.dart';

class TourguideForm extends StatefulWidget {
  const TourguideForm({super.key});

  @override
  State<TourguideForm> createState() => _TourguideForm();
}

class _TourguideForm extends State<TourguideForm> {
  final _formKey = GlobalKey<FormState>();
  String model = "tourguide.tourguide";
  String company = "";
  String date = DateTime.now().toString();
  String destination = "";
  bool isBooked = false;
  int pk = 1;

  TextEditingController _date = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();

    return Scaffold(
        appBar: AppBar(
          title: const Text('Tourguide Form'),
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
                        child: Text("Tourguides",
                            style: TextStyle(
                                fontSize: 60,
                                fontFamily: 'Quicksand',
                                color: Colors.black)),
                      )),
                  Center(
                    child: Text("Discover Tourguides.",
                        style: TextStyle(
                            fontSize: 15,
                            fontFamily: 'Quicksand',
                            color: Colors.black.withOpacity(0.5))),
                  ),
                  Center(
                    child: Text("Sweet cooperation with MID-Tourism",
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
                                hintText: "Enter your Tourguide Name!",
                                labelText: "Tourguide Name",
                                // Added a circular border to make it neater
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                              ),
                              // Added behavior when name is typed
                              onChanged: (String? value) {
                                setState(() {
                                  company = value!;
                                });
                              },
                              // Added behavior when data is saved
                              onSaved: (String? value) {
                                setState(() {
                                  company = value!;
                                });
                              },
                              // Validator as form validation
                              validator: (String? value) {
                                if (value == null || value.isEmpty) {
                                  return 'Tourguide name cannot be empty!';
                                }
                                return null;
                              },
                            ),
                          ),
                          Padding(
                            // Using padding of 8 pixels
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                                controller: _date,
                                decoration: const InputDecoration(
                                  hintText: "Enter the booking date",
                                  labelText: "Booking date",
                                  //border: OutlineInputBorder()
                                ),
                                readOnly:
                                    true, // when true user cannot edit text
                                onTap: () async {
                                  DateTime? pickedDate = await showDatePicker(
                                      context: context,
                                      initialDate:
                                          DateTime.now(), //get today's date
                                      firstDate: DateTime(
                                          2000), //DateTime.now() - not to allow to choose before today.
                                      lastDate: DateTime(2101));
                                  if (pickedDate != null) {
                                    setState(() {
                                      date = DateFormat('yyyy-MM-dd')
                                          .format(pickedDate);
                                      _date.text = date;
                                    });
                                  } else {
                                    print("Date is not selected");
                                  }
                                }),
                          ),
                          Padding(
                            // Using padding of 8 pixels
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                              decoration: InputDecoration(
                                hintText: "Enter your destination",
                                labelText: "Destination",
                                // Added a circular border to make it neater
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                              ),
                              // Added behavior when name is typed
                              onChanged: (String? value) {
                                setState(() {
                                  destination = value!;
                                });
                              },
                              // Added behavior when data is saved
                              onSaved: (String? value) {
                                setState(() {
                                  destination = value!;
                                });
                              },
                              // Validator as form validation
                              validator: (String? value) {
                                if (value == null || value.isEmpty) {
                                  return 'Destination cannot be empty!';
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            minimumSize: const Size(120, 50),
                                            shape: const StadiumBorder(),
                                            backgroundColor:
                                                const Color(0xff6c757d)),
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: const Text("Back",
                                            style: TextStyle(
                                                color: Colors.white))),
                                    ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          minimumSize: const Size(120, 50),
                                          shape: const StadiumBorder(),
                                          backgroundColor:
                                          const Color(0xff3f8dcd)),
                                      onPressed: () async {
                                        if (_formKey.currentState!.validate()) {
                                          _formKey.currentState!.save();
                                          try {
                                            final uri = Uri.parse(
                                                'https://mid-tourism.up.railway.app/tourguide/add_schedule_flutter/');
                                            final request =
                                            http.MultipartRequest(
                                                'POST', uri);
                                            request.fields["date"] = date;
                                            request.fields["company"] = company;
                                            request.fields["destination"] = destination;
                                            final response =
                                            await request.send();
                                          } catch (e) {
                                            print("$e ERROR FOUND");
                                          }
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
                                                const TourguidePage()),
                                          );
                                        }
                                      },
                                      child: const Text("Save",
                                          style: TextStyle(
                                              color: Colors.white)
                                      ),
                                    ),
                                  ],
                                ),
                              )),
                        ],
                      ),
                    ),
                  )
                ],
              ))
        ]))));
  }
}