import 'package:flutter/material.dart';
import 'dart:typed_data';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:mid_tourism_mobile/drawer.dart';
import 'package:mid_tourism_mobile/pages/hotel/room.dart';

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
  String roomPrice = "";
  XFile? roomPhoto;
  Uint8List? roomPhotoByte;
  bool booking = false;

  final ImagePicker picker = ImagePicker();

  Future getImage(ImageSource media) async {
    var img = await picker.pickImage(source: media);

    setState(() {
      roomPhoto = img;
    });
  }

  void myAlert() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            title: const Text('Please choose media to select'),
            content: SizedBox(
              height: MediaQuery.of(context).size.height / 6,
              child: Column(
                children: [
                  ElevatedButton(
                    //if user click this button, user can upload image from gallery
                    onPressed: () {
                      Navigator.pop(context);
                      getImage(ImageSource.gallery);
                    },
                    child: Row(
                      children: const [
                        Icon(Icons.image),
                        Text('From Gallery'),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                    //if user click this button. user can upload image from camera
                    onPressed: () {
                      Navigator.pop(context);
                      getImage(ImageSource.camera);
                    },
                    child: Row(
                      children: const [
                        Icon(Icons.camera),
                        Text('From Camera'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();

    return Scaffold(
        appBar: AppBar(
          title: const Text('Room Form'),
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
                        child: Text("Rooms",
                            style: TextStyle(
                                fontSize: 60,
                                fontFamily: 'Quicksand',
                                color: Colors.black)),
                      )),
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
                                hintText: "Enter your Room Description!",
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
                                hintText: "Enter your room price!",
                                labelText: "Room Price",
                                // Added a circular border to make it neater
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                              ),
                              // Added behavior when name is typed
                              onChanged: (String? value) {
                                setState(() {
                                  roomPrice = value!;
                                });
                              },
                              // Added behavior when data is saved
                              onSaved: (String? value) {
                                setState(() {
                                  roomPrice = value!;
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
                          Center(
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: ElevatedButton(
                                onPressed: () {
                                  myAlert();
                                },
                                child: const Text('Upload Photo'),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          //if image not null show the image
                          //if image null show text
                          roomPhoto != null ? Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.network(
                                //to show image, you type like this.
                                roomPhoto!.path,
                                fit: BoxFit.cover,
                                width: MediaQuery.of(context).size.width,
                                height: 300,
                              ),
                            ),
                          ) :
                          const Center(
                              child: Padding(
                                padding: EdgeInsets.only(bottom: 10),
                                child: Text(
                                  "No Image",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 15),
                                ),
                              )
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
                                      onPressed: () async {
                                        if (_formKey.currentState!.validate()) {
                                          _formKey.currentState!.save();
                                          try {
                                            Uint8List hotelPhotoByte =  await roomPhoto!.readAsBytes();
                                            final uri = Uri.parse('https://mid-tourism.up.railway.app/hotel/add_room_flutter/');
                                            final request = http.MultipartRequest('POST', uri);
                                            var multipartFile = await http.MultipartFile.fromBytes(
                                                'room_photo', hotelPhotoByte,
                                                filename: 'room_photo_$roomType',
                                                contentType: MediaType('image', 'jpg')
                                            );

                                            request.files.add(multipartFile);
                                            request.fields["room_type"] = roomType;
                                            request.fields["room_price"] = roomPrice;
                                            request.fields["room_description"] = roomDescription;
                                            request.fields["room_hotel"] = widget.hotelPk.toString();

                                            final response = await request.send();
                                          } catch (e) {
                                            print("$e LOOK 1");
                                          }
                                          Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => RoomPage(hotelPk: widget.hotelPk)
                                            ),
                                          );
                                          showDialog(
                                              context: context,
                                              builder: (BuildContext context) {
                                                return const AlertDialog(
                                                    content: Text(
                                                        'Successfully saved!'
                                                    )
                                                );
                                              });
                                        }
                                      },
                                      child: const Text(
                                          "Save",
                                          style: TextStyle(
                                              color: Colors.white
                                          )
                                      )
                                  )
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
