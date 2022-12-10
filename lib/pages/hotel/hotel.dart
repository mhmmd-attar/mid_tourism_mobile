import 'package:flutter/material.dart';
import 'package:mid_tourism_mobile/drawer.dart';
import 'package:mid_tourism_mobile/pages/hotel/hotelform.dart';
import 'package:mid_tourism_mobile/pages/hotel/room.dart';
import 'package:mid_tourism_mobile/pages/homepage/login.dart';
import 'package:mid_tourism_mobile/pages/homepage/register.dart';
import 'package:mid_tourism_mobile/models/hotelModel.dart';

class HotelPage extends StatefulWidget {
  const HotelPage({super.key});

  @override
  State<HotelPage> createState() => _Hotel();
}

class _Hotel extends State<HotelPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: const AppDrawer(),
      body: Center(
        child: TextButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const HotelForm()),
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
                            image: AssetImage("hotel.png"), fit: BoxFit.cover),
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // ignore: prefer_const_constructors
                            FittedBox(
                              fit: BoxFit.fitWidth,
                              child: const Text("Hotels",
                                  style: TextStyle(
                                      fontSize: 60,
                                      fontFamily: 'Quicksand',
                                      color: Colors.white)),
                            ),
                            Center(
                              child: Text("Discover hotels.",
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
                  Container(
                    margin: const EdgeInsets.all(10),
                    child: ElevatedButton(
                        onPressed: () async {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const HotelForm()),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xff24a0ed),
                            shape: const StadiumBorder(),
                            minimumSize: const Size(260, 50)),
                        child: const Text("Create Hotel",
                            style: TextStyle(
                                fontSize: 20,
                                fontFamily: 'Quicksand',
                                color: Color(0xffFFFFFF)))),
                  ),
                  FutureBuilder(
                      future: HotelFuture().fetchHotel(),
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
                                  "No Hotels Registered :(",
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
                                      children: [
                                        Expanded(
                                          child: Image.network(
                                            'https://mid-tourism.up.railway.app/media/${snapshot.data![index].fields.hotelPhoto}',
                                            fit: BoxFit.contain,
                                          ),
                                        ),
                                        Expanded(
                                            child: Column(children: [
                                          Text(
                                            snapshot
                                                .data![index].fields.hotelName,
                                            style: const TextStyle(
                                                fontSize: 18.0,
                                                fontWeight: FontWeight.bold,
                                                color: Color(0xffFFFFFF)),
                                          ),
                                          Table(
                                            columnWidths: const {
                                              0: FixedColumnWidth(64),
                                              1: FlexColumnWidth(),
                                            },
                                            children: [
                                              TableRow(children: [
                                                const TableCell(
                                                    child: Text(
                                                  "Hotel Address",
                                                  style: TextStyle(
                                                    fontSize: 18.0,
                                                    color: Colors.white,
                                                  ),
                                                )),
                                                TableCell(
                                                    child: Text(
                                                  ": ${snapshot.data![index].fields.hotelAddress}",
                                                  style: const TextStyle(
                                                    fontSize: 18.0,
                                                    color: Colors.white,
                                                  ),
                                                )),
                                              ]),
                                              TableRow(children: [
                                                const TableCell(
                                                    child: Text(
                                                  "Email",
                                                  style: TextStyle(
                                                    fontSize: 18.0,
                                                    color: Colors.white,
                                                  ),
                                                )),
                                                TableCell(
                                                    child: Text(
                                                  ": ${snapshot.data![index].fields.email}",
                                                  style: const TextStyle(
                                                    fontSize: 18.0,
                                                    color: Colors.white,
                                                  ),
                                                )),
                                              ]),
                                              TableRow(children: [
                                                const TableCell(
                                                    child: Text(
                                                  "Rating",
                                                  style: TextStyle(
                                                    fontSize: 18.0,
                                                    color: Colors.white,
                                                  ),
                                                )),
                                                TableCell(
                                                    child: Text(
                                                  ": ${snapshot.data![index].fields.star}",
                                                  style: const TextStyle(
                                                    fontSize: 18.0,
                                                    color: Colors.white,
                                                  ),
                                                )),
                                              ]),
                                              TableRow(children: [
                                                const TableCell(
                                                    child: Text(
                                                  "Description",
                                                  style: TextStyle(
                                                    fontSize: 18.0,
                                                    color: Colors.white,
                                                  ),
                                                )),
                                                TableCell(
                                                    child: Text(
                                                  ": ${snapshot.data![index].fields.description}",
                                                  style: const TextStyle(
                                                    fontSize: 18.0,
                                                    color: Colors.white,
                                                  ),
                                                )),
                                              ]),
                                            ],
                                          ),
                                        ])),
                                        Expanded(
                                            child: Row(
                                          children: [
                                            ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                    backgroundColor:
                                                        const Color(0xffd3462c),
                                                    minimumSize:
                                                        const Size(120, 45)),
                                                onPressed: () {
                                                  Navigator.pushReplacement(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              RoomPage(
                                                                  hotelPk: snapshot
                                                                      .data![
                                                                          index]
                                                                      .pk)));
                                                },
                                                child: const Text(
                                                    "Check Availability",
                                                    style: TextStyle(
                                                        color: Colors.white))),
                                            ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                    backgroundColor:
                                                        const Color(0xffa64452),
                                                    minimumSize:
                                                        const Size(120, 45)),
                                                onPressed: () {
                                                  Navigator.pushReplacement(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              RoomPage(
                                                                  hotelPk: snapshot
                                                                      .data![
                                                                          index]
                                                                      .pk)));
                                                },
                                                child: const Text("Delete",
                                                    style: TextStyle(
                                                        color: Colors.white))),
                                          ],
                                        )),
                                      ],
                                    )));
                          }
                        }
                      }),
                ],
              ),
            )),
      ),
    );
  }
}
