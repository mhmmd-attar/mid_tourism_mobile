import 'package:flutter/material.dart';
import 'package:mid_tourism_mobile/drawer.dart';
import 'package:mid_tourism_mobile/pages/hotel/hotelform.dart';
import 'package:mid_tourism_mobile/pages/hotel/room.dart';
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
      body: SingleChildScrollView(
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
                    const FittedBox(
                      fit: BoxFit.fitWidth,
                      child: Text("Hotels",
                        style: TextStyle(
                          fontSize: 60,
                          fontFamily: 'Quicksand',
                          color: Colors.white,
                        )
                      ),
                    ),
                    Center(
                      child: Text("Discover hotels.",
                        style: TextStyle(
                          fontSize: 15,
                          fontFamily: 'Quicksand',
                          color: Colors.white.withOpacity(0.8),
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
                          color: const Color(0xffFFFFFF).withOpacity(0.8),
                        )
                      ),
                    ),
                  ]
                )
              ),
              Container(
                margin: const EdgeInsets.all(10),
                child: ElevatedButton(
                  onPressed: () async {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HotelForm()
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff24a0ed),
                    shape: const StadiumBorder(),
                    minimumSize: const Size(260, 50)
                  ),
                  child: const Text(
                    "Create Hotel",
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'Quicksand',
                      color: Color(0xffFFFFFF),
                    )
                  )
                ),
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
                              color: Color(0xff59A5D8),
                              fontSize: 20,
                            ),
                          ),
                          SizedBox(height: 8),
                        ],
                      );
                    } else {
                      return ListView.builder(
                        shrinkWrap: true,
                        itemCount: snapshot.data!.length,
                        itemBuilder: (_, index) => Container(
                          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                          height: 225,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15.0),
                            boxShadow: const [BoxShadow(
                              color: Colors.black,
                              blurRadius: 2.0)
                            ],
                          ),
                          child: Row(children: [
                            Expanded(
                              flex: 36,
                              child: Column(children: [
                                Expanded(child: ClipRRect(
                                  borderRadius: const BorderRadius.only(topLeft: Radius.circular(15), bottomLeft: Radius.circular(15)),
                                  child: Image.network(
                                    'https://mid-tourism.up.railway.app/media/${snapshot.data![index].fields.hotelPhoto}',
                                    fit: BoxFit.fill,
                                  ),
                                ))
                              ])
                            ),
                            Expanded(
                              flex: 64,
                              child: Container(
                                padding: const EdgeInsets.all(8),
                                child: Column(children: [
                                  Container(
                                    child: Column(children: [
                                      Align(
                                        alignment: Alignment.topLeft,
                                        child: Text(
                                          snapshot.data![index].fields.hotelName,
                                          style: const TextStyle(
                                            fontSize: 24,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                      TextField(
                                        enabled: false,
                                        readOnly: true,
                                        controller: TextEditingController(text: snapshot.data![index].fields.hotelAddress),
                                        decoration: const InputDecoration(
                                          labelText: "Hotel Address",
                                          isDense: true,
                                          contentPadding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 0),
                                          border: InputBorder.none,
                                        ),
                                      ),
                                      TextField(
                                        enabled: false,
                                        readOnly: true,
                                        controller: TextEditingController(text: snapshot.data![index].fields.email),
                                        decoration: const InputDecoration(
                                          labelText: "Email",
                                          isDense: true,
                                          contentPadding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 0),
                                          border: InputBorder.none,
                                        ),
                                      ),
                                      TextField(
                                        enabled: false,
                                        readOnly: true,
                                        controller: TextEditingController(text: "${snapshot.data![index].fields.star}/5"),
                                        decoration: const InputDecoration(
                                          labelText: "Rating",
                                          isDense: true,
                                          contentPadding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 0),
                                          border: InputBorder.none,
                                        ),
                                      ),
                                      TextField(
                                        enabled: false,
                                        readOnly: true,
                                        controller: TextEditingController(text: snapshot.data![index].fields.description),
                                        decoration: const InputDecoration(
                                          labelText: "Description",
                                          isDense: true,
                                          contentPadding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 0),
                                          border: InputBorder.none,
                                        ),
                                      ),
                                    ])
                                  ),
                                  Align(
                                    alignment: Alignment.bottomRight,
                                    child: FittedBox(
                                      fit: BoxFit.fitWidth,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        crossAxisAlignment: CrossAxisAlignment.end,
                                        children: [
                                          Container(
                                              padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 6, 12),
                                              child: FittedBox(
                                                  child: ElevatedButton(
                                                      style: ElevatedButton.styleFrom(
                                                        backgroundColor: Colors.blue,
                                                      ),
                                                      onPressed: () {
                                                        Navigator.pushReplacement(
                                                            context,
                                                            MaterialPageRoute( builder: (context) => RoomPage(
                                                                hotelPk: snapshot.data![index].pk
                                                            ))
                                                        );
                                                      },
                                                      child: const Text(
                                                          "Check Availability",
                                                          style: TextStyle(color: Colors.white)
                                                      )
                                                  )
                                              )
                                          ),
                                          Container(
                                            padding: const EdgeInsetsDirectional.fromSTEB(6, 0, 12, 12),
                                            height: 36,
                                            width: 72,
                                            child: FittedBox(
                                              child: ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                  backgroundColor: Colors.red,
                                                ),
                                                onPressed: () {
                                                  Navigator.pushReplacement(
                                                    context,
                                                    MaterialPageRoute( builder: (context) => RoomPage(
                                                      hotelPk: snapshot.data![index].pk
                                                    ))
                                                  );
                                                },
                                                child: const Text(
                                                  "Delete",
                                                  style: TextStyle(color: Colors.white)
                                                )
                                              ),
                                            )
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ]),
                              ),
                            ),
                          ])
                        )
                      );
                    }
                  }
                }
              ),
            ],
          ),
        )
      ),
    );
  }
}
