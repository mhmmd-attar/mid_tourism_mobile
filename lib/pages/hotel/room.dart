import 'package:flutter/material.dart';
import 'package:mid_tourism_mobile/drawer.dart';
import 'package:mid_tourism_mobile/pages/hotel/roomform.dart';
import 'package:mid_tourism_mobile/models/roomModel.dart';

class RoomPage extends StatefulWidget {
  const RoomPage({super.key, required this.hotelPk});
  final int hotelPk;

  @override
  State<RoomPage> createState() => _Room();
}

class _Room extends State<RoomPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rooms'),
      ),
      drawer: const drawerapp(),
      body: Center(
        child: TextButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => RoomForm(hotelPk: widget.hotelPk)),
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
                            image: AssetImage("hotel.png"),
                            fit: BoxFit.cover),
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // ignore: prefer_const_constructors
                            FittedBox(
                              fit: BoxFit.fitWidth,
                              child: const Text("Rooms",
                                  style: TextStyle(
                                      fontSize: 60,
                                      fontFamily: 'Quicksand',
                                      color: Colors.white)),
                            ),
                            Center(
                              child: Text("Select your room.",
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
                      future: RoomFuture().fetchRoom(),
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
                                  "No Rooms Registered :(",
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
                                    child: Column(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Room Type :    ${snapshot.data![index].fields.roomType}",
                                            style: const TextStyle(
                                              fontSize: 18.0,
                                              fontWeight: FontWeight.bold,
                                              color: Color(0xffFFFFFF)
                                            ),
                                          ),
                                          Text(
                                            "Room Price :    ${snapshot.data![index].fields.roomPrice}",
                                            style: const TextStyle(
                                              fontSize: 18.0,
                                              fontWeight: FontWeight.bold,
                                              color: Color(0xffFFFFFF)
                                            ),
                                          ),
                                          Container(
                                            padding: const EdgeInsets.only(top: 10),
                                            child: Text(
                                              "${snapshot.data![index].fields.roomDescription}",
                                              style: const TextStyle(
                                                fontSize: 18.0,
                                                color: Color(0xffFFFFFF)
                                              ),
                                            ),
                                          ),
                                          Container(
                                              padding: const EdgeInsets.all(10),
                                              child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.end,
                                                  children: [
                                                    ElevatedButton(
                                                        style: ElevatedButton.styleFrom(
                                                            backgroundColor: const Color(0xffFFFFFF),
                                                            minimumSize: const Size(120, 45)
                                                        ),
                                                        onPressed: () {
                                                          Navigator.pushReplacement(
                                                              context,
                                                              MaterialPageRoute(
                                                                  builder: (context) => RoomPage(hotelPk: snapshot.data![index].pk)
                                                              )
                                                          );
                                                        },
                                                        child: const Text(
                                                            "Book",
                                                            style: TextStyle(
                                                                color: Colors.black
                                                            )
                                                        )
                                                    ),
                                                    Container(
                                                      padding: const EdgeInsets.only(left: 15),
                                                      child: ElevatedButton(
                                                          style: ElevatedButton.styleFrom(
                                                              backgroundColor: const Color(0xffa64452),
                                                              minimumSize: const Size(120, 45)
                                                          ),
                                                          onPressed: () {
                                                            Navigator.pushReplacement(
                                                                context,
                                                                MaterialPageRoute(
                                                                    builder: (context) => RoomPage(hotelPk: snapshot.data![index].pk)
                                                                )
                                                            );
                                                          },
                                                          child: const Text(
                                                              "Delete",
                                                              style: TextStyle(
                                                                  color: Colors.white
                                                              )
                                                          )
                                                      ),
                                                    )
                                                  ]
                                              )
                                            )
                                          ]
                                    )
                                )
                            );
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
                                RoomForm(hotelPk: widget.hotelPk,)),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xff24a0ed),
                            shape: const StadiumBorder(),
                            minimumSize: const Size(260, 50)
                        ),
                        child: const Text("Create Room",
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