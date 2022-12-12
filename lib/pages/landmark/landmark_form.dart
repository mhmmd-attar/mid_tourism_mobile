import 'package:flutter/material.dart';
import 'dart:typed_data';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';

import 'package:mid_tourism_mobile/drawer.dart';
import 'package:mid_tourism_mobile/models/landmark_model.dart';
import 'package:mid_tourism_mobile/pages/landmark/landmark.dart';

class LandmarkForm extends StatefulWidget {
  const LandmarkForm({super.key});

  @override
  State<LandmarkForm> createState() => _LandmarkForm();
}

class _LandmarkForm extends State<LandmarkForm> {
  final _formKey = GlobalKey<FormState>();
  final ImagePicker picker = ImagePicker();

  String _name = "";
  String _location = "";
  XFile? _image;
  String _description = "";
  Uint8List? _imageBytes;

  Future getImage(ImageSource media) async {
    var img = await picker.pickImage(source: media);

    setState(() {
      _image = img;
    });
  }

  void myAlert() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          title: const Text('Please choose media to select'),
          content: Container(
            height: MediaQuery.of(context).size.height / 6,
            child: Column(children: [
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
            ]),
          ),
        );
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();

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
                  Container(
                    padding: const EdgeInsets.only(left: 15, right: 15),
                    child: const FittedBox(
                      fit: BoxFit.fitWidth,
                      child: Text("Landmarks",
                        style: TextStyle(
                          fontSize: 60,
                          fontFamily: 'Quicksand',
                          color: Colors.black)
                      ),
                    )
                  ),
                  Center(
                    child: Text("Wonderful destinations for your journey.",
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: 'Quicksand',
                        color: Colors.black.withOpacity(0.5)
                      )
                    ),
                  ),
                  Center(
                    child: Text(
                      "Experience authenticity and accommodation with MID-Tourism",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: 'Quicksand',
                        color: const Color(0xff000000).withOpacity(0.5)
                      )
                    ),
                  ),
                  Form(
                    key: _formKey,
                    child: Container(
                      padding: const EdgeInsets.all(15.0),
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(5),),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            // Using padding of 8 pixels
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                              decoration: InputDecoration(
                                hintText: "Enter the Landmark's Name!",
                                labelText: "Name",
                                border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
                              ),
                              // Added behavior when name is typed
                              onChanged: (String? value) {
                                setState(() {
                                  _name = value!;
                                });
                              },
                              // Added behavior when data is saved
                              onSaved: (String? value) {
                                setState(() {
                                  _name = value!;
                                });
                              },
                              // Validator as form validation
                              validator: (String? value) {
                                if (value == null || value.isEmpty) {
                                  return 'Landmark name cannot be empty!';
                                }
                                return null;
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                              decoration: InputDecoration(
                                hintText: "Enter the Landmark's Location!",
                                labelText: "Location",
                                // Added a circular border to make it neater
                                border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0),),
                              ),
                              // Added behavior when name is typed
                              onChanged: (String? value) {
                                setState(() {
                                  _location = value!;
                                });
                              },
                              // Added behavior when data is saved
                              onSaved: (String? value) {
                                setState(() {
                                  _location = value!;
                                });
                              },
                              // Validator as form validation
                              validator: (String? value) {
                                if (value == null || value.isEmpty) {
                                  return 'Landmark location cannot be empty!';
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
                                hintText: "Enter the Description!",
                                labelText: "Description",
                                // Added a circular border to make it neater
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                              ),
                              // Added behavior when name is typed
                              onChanged: (String? value) {
                                setState(() {
                                  _description = value!;
                                });
                              },
                              // Added behavior when data is saved
                              onSaved: (String? value) {
                                setState(() {
                                  _description = value!;
                                });
                              },
                              // Validator as form validation
                              validator: (String? value) {
                                if (value == null || value.isEmpty) {
                                  return 'The description cannot be empty!';
                                }
                                return null;
                              },
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              myAlert();
                            },
                            child: const Text('Upload Photo'),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          //if image not null show the image
                          //if image null show text
                          _image != null ? Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.network(
                                //to show image, you type like this.
                                _image!.path,
                                fit: BoxFit.cover,
                                width: MediaQuery.of(context).size.width,
                                height: 300,
                              ),
                            ),
                          ) : const Text(
                            "No Image",
                            style: TextStyle(fontSize: 15),
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
                                  const Color(0xff3f8dcd)
                                ),
                                onPressed: () async {
                                  if (_formKey.currentState!.validate()) {
                                    _formKey.currentState!.save();
                                    try {
                                      Uint8List image_bytes = await _image!.readAsBytes();
                                      final uri = Uri.parse('https://mid-tourism.up.railway.app/landmarks/add_landmark_flutter/');
                                      final request = http.MultipartRequest('POST', uri);
                                      var multipartFile = await http.MultipartFile.fromBytes(
                                        'image',
                                        image_bytes,
                                        filename: 'landmark_$_name',
                                        contentType: MediaType('image', 'jpg')
                                      );
                                      request.files.add(multipartFile);
                                      request.fields["name"] = _name;
                                      request.fields["location"] = _location;
                                      request.fields["description"] = _description;

                                      final response = await request.send();
                                    } catch (e) {
                                      print("$e LOOK 1");
                                    }

                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return const AlertDialog(
                                          content: Text('Successfully saved!')
                                        );
                                      }
                                    );
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(builder: (context) => const LandmarkPage()),
                                    );
                                  }
                                },
                                child: const Text(
                                  "Save",
                                  style: TextStyle(color: Colors.white)
                                )
                              )
                            )
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              )
            )
          ])
        )
      )
    );
  }
}