import 'package:flutter/material.dart';
import 'package:mid_tourism_mobile/drawer.dart';
import 'package:mid_tourism_mobile/pages/tourguide/tourguideform.dart';
import 'package:mid_tourism_mobile/pages/homepage/login.dart';
import 'package:mid_tourism_mobile/pages/homepage/register.dart';
import 'package:mid_tourism_mobile/models/tourguideModel.dart';

class TourguidePage extends StatefulWidget {
  const TourguidePage({super.key});

  @override
  State<TourguidePage> createState() => _Tourguide();
}

class _Tourguide extends State<TourguidePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tourguide'),
      ),
      drawer: const drawerapp(),
      body: Center(
        child: TextButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => const TourguideForm()),
              );
            },
            child: Center(
              child: Column(
                children: <Widget>[
                  Container(
                      margin: const EdgeInsets.all(20.0),
                      padding: const EdgeInsets.all(20.0),
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("tourguide.jpg"),
                            fit: BoxFit.cover),
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // ignore: prefer_const_constructors
                            FittedBox(
                              fit: BoxFit.fitWidth,
                              child: const Text("Tourguides",
                                  style: TextStyle(
                                      fontSize: 60,
                                      fontFamily: 'Quicksand',
                                      color: Colors.white)),
                            ),
                            Center(
                              child: Text("Discover tourguides.",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontFamily: 'Quicksand',
                                      color: Colors.white.withOpacity(0.8))),
                            ),
                            Center(
                              child: Text(
                                  "Experience authenticity and accommodation with MID-Tourism",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontFamily: 'Quicksand',
                                      color: const Color(0xffFFFFFF)
                                          .withOpacity(0.8))),
                            ),
                          ])),
                  FutureBuilder(
                      future: TourguideFuture().fetchTourguide(),
                      builder: (context, AsyncSnapshot snapshot) {
                        if (snapshot.data == null) {
                          return const Center(
                              child: CircularProgressIndicator());
                        } else {
                          if (!snapshot.hasData) {
                            return Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Text(
                                  "No Tourguides Registered :(",
                                  style: TextStyle(
                                      color: Color(0xff59A5D8), fontSize: 20),
                                ),
                                SizedBox(height: 8),
                              ],
                            );
                          } else {
                            return ListView.builder(
                              shrinkWrap: true,
                                itemCount: snapshot.data!.length,
                                itemBuilder: (_, index) => Container(
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 16, vertical: 12),
                                    padding: const EdgeInsets.all(20.0),
                                    decoration: BoxDecoration(
                                        color: Colors.blue,
                                        borderRadius:
                                        BorderRadius.circular(15.0),
                                        boxShadow: const [
                                          BoxShadow(
                                              color: Colors.black,
                                              blurRadius: 2.0)
                                        ]),
                                    child: Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "${snapshot.data![index].fields.company}\n${snapshot.data![index].fields.date}\n${snapshot.data![index].fields.destination}",
                                            style: const TextStyle(
                                              fontSize: 18.0,
                                              fontWeight: FontWeight.bold,
                                              color: Color(0xffFFFFFF),
                                            ),
                                          ),
                                        ])));
                          }
                        }
                      }),
                  Container(
                    margin: const EdgeInsets.all(10),
                    child: ElevatedButton(
                        onPressed: () async {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                const TourguideForm()),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xff24a0ed),
                            shape: const StadiumBorder(),
                            minimumSize: const Size(260, 50)
                        ),
                        child: const Text("Add Tourguide",
                            style: TextStyle(
                                fontSize: 20,
                                fontFamily: 'Quicksand',
                                color: Color(0xffFFFFFF)))),
                  ),
                ],
              ),
            )
        ),
      ),
    );
  }
}