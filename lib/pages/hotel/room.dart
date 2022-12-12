import 'package:flutter/material.dart';
import 'package:auto_size_text_field/auto_size_text_field.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:mid_tourism_mobile/drawer.dart';
import 'package:mid_tourism_mobile/pages/hotel/room_form.dart';
import 'package:mid_tourism_mobile/pages/hotel/room.dart';
import 'package:mid_tourism_mobile/pages/hotel/hotel.dart';
import 'package:mid_tourism_mobile/models/room_model.dart';

class RoomPage extends StatefulWidget {
  const RoomPage({super.key, required this.hotelPk});
  final int hotelPk;

  @override
  State<RoomPage> createState() => _Room();
}

class _Room extends State<RoomPage> {
  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Rooms'),
      ),
      drawer: const AppDrawer(),
      body: SingleChildScrollView(
          child: Center(
        child: Column(
          children: <Widget>[
            Container(
                margin: const EdgeInsets.all(20.0),
                padding: const EdgeInsets.all(20.0),
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/hotel.png"), fit: BoxFit.cover),
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const FittedBox(
                        fit: BoxFit.fitWidth,
                        child: Text("Rooms",
                            style: TextStyle(
                              fontSize: 60,
                              fontFamily: 'Quicksand',
                              color: Colors.white,
                            )),
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
                                color:
                                    const Color(0xffFFFFFF).withOpacity(0.8))),
                      ),
                    ])),
            Visibility(
              visible: request.loggedIn,
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => RoomForm(hotelPk: widget.hotelPk)
                        )
                    );
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff24a0ed),
                      shape: const StadiumBorder(),
                      minimumSize: const Size(260, 50)),
                  child: const Text("Create Room",
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'Quicksand',
                        color: Color(0xffFFFFFF),
                      )
                  )
              ),
            ),
            Container(
              margin: const EdgeInsets.all(10),
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const HotelPage()
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff24a0ed),
                      shape: const StadiumBorder(),
                      minimumSize: const Size(260, 50)),
                  child: const Text("Return to Hotel Selection",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'Quicksand',
                        color: Color(0xffFFFFFF),
                      ))),
            ),
            FutureBuilder(
                future: fetchRoom(widget.hotelPk),
                builder: (context, AsyncSnapshot snapshot) {
                  if (snapshot.data == null) {
                    return const Center(child: CircularProgressIndicator());
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
                              height: 220,
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 12),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15.0),
                                boxShadow: const [
                                  BoxShadow(
                                      color: Colors.black, blurRadius: 2.0)
                                ],
                              ),
                              child: Row(children: [
                                Expanded(
                                    flex: 36,
                                    child: Column(children: [
                                      Expanded(
                                          child: ClipRRect(
                                              borderRadius:
                                                  const BorderRadius.only(
                                                      topLeft: Radius.circular(15),
                                                      bottomLeft: Radius.circular(15)),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                  fit: BoxFit.fill,
                                                  image: NetworkImage(
                                                    'https://mid-tourism.up.railway.app/media/${snapshot.data![index].fields.roomPhoto}',
                                                  ),
                                                )),
                                              )))
                                    ])),
                                Expanded(
                                  flex: 64,
                                  child: Container(
                                    padding: const EdgeInsets.all(8),
                                    child: Column(children: [
                                      Column(children: [
                                        Align(
                                          alignment: Alignment.topLeft,
                                          child: FittedBox(
                                            fit: BoxFit.fitWidth,
                                            child: Text(
                                              snapshot.data![index].fields.roomType,
                                              style: const TextStyle(
                                                fontSize: 24,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black,
                                              ),
                                            ),
                                          ),
                                        ),
                                        TextField(
                                          enabled: false,
                                          readOnly: true,
                                          controller: TextEditingController(
                                              text: "${snapshot.data![index].fields.roomPrice}"
                                          ),
                                          decoration: const InputDecoration(
                                            labelText: "Room Price",
                                            isDense: true,
                                            contentPadding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 0),
                                            border: InputBorder.none,
                                          ),
                                        ),
                                        AutoSizeTextField(
                                          enabled: false,
                                          readOnly: true,
                                          controller: TextEditingController(
                                              text: snapshot.data![index].fields.isBooked ? "Booked" : "Available"
                                          ),
                                          decoration: const InputDecoration(
                                            labelText: "Availability",
                                            isDense: true,
                                            contentPadding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 0),
                                            border: InputBorder.none,
                                          ),
                                        ),
                                        AutoSizeTextField(
                                          enabled: false,
                                          readOnly: true,
                                          maxLines: 3,
                                          controller: TextEditingController(
                                              text: snapshot.data![index].fields.roomDescription
                                          ),
                                          decoration: const InputDecoration(
                                            labelText: "Description",
                                            isDense: true,
                                            contentPadding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 0),
                                            border: InputBorder.none,
                                          ),
                                        ),
                                      ]),
                                      Expanded(
                                        child: Align(
                                          alignment: Alignment.bottomRight,
                                          child: FittedBox(
                                            fit: BoxFit.fitWidth,
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.end,
                                              crossAxisAlignment: CrossAxisAlignment.end,
                                              children: [
                                                Container(
                                                    padding:
                                                        const EdgeInsetsDirectional.fromSTEB(0, 0, 6, 10),
                                                    child: FittedBox(
                                                        child: ElevatedButton(
                                                            style: ElevatedButton.styleFrom(
                                                              backgroundColor: Colors.blue,
                                                              maximumSize: const Size(130, 50)
                                                            ),
                                                            onPressed: () async {
                                                              try {
                                                                final response = await request.get(
                                                                    'https://mid-tourism.up.railway.app/hotel/is_booked_flutter/${snapshot.data![index].pk}'
                                                                );
                                                              } catch (e) {
                                                                print("$e LOOK");
                                                              }
                                                              Navigator.pushReplacement(
                                                                context,
                                                                MaterialPageRoute(
                                                                    builder: (context) => RoomPage(hotelPk: widget.hotelPk)
                                                                ),
                                                              );
                                                            },
                                                            child: Text(
                                                                snapshot.data![index].fields.isBooked ? "Cancel Booking" : "Book Now",
                                                                style: TextStyle(
                                                                    color: Colors.white
                                                                )
                                                            )
                                                        )
                                                    )
                                                ),
                                                Visibility(
                                                  visible: request.loggedIn,
                                                    child: Container(
                                                        padding:
                                                        const EdgeInsetsDirectional.fromSTEB(6, 0, 12, 10),
                                                        child: FittedBox(
                                                          child: ElevatedButton(
                                                              style: ElevatedButton.styleFrom(
                                                                  backgroundColor: Colors.red,
                                                                  maximumSize: const Size(74, 50)
                                                              ),
                                                              onPressed: () async {
                                                                try {
                                                                  final response = await request.get(
                                                                      'https://mid-tourism.up.railway.app/hotel/delete_room_flutter/${snapshot.data![index].pk}'
                                                                  );
                                                                } catch (e) {
                                                                  print("$e LOOK");
                                                                }
                                                                Navigator.pushReplacement(
                                                                  context,
                                                                  MaterialPageRoute(
                                                                      builder: (context) => RoomPage(hotelPk: widget.hotelPk)
                                                                  ),
                                                                );
                                                              },
                                                              child: const Text(
                                                                  "Delete",
                                                                  style: TextStyle(
                                                                      color: Colors.white)
                                                              )
                                                          ),
                                                        )
                                                    ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      )
                                    ]),
                                  ),
                                ),
                              ])
                          )
                      );
                    }
                  }
                }),
          ],
        ),
      )),
    );
  }
}
