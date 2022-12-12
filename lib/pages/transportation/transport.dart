import 'package:flutter/material.dart';
import 'package:auto_size_text_field/auto_size_text_field.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';

import 'package:mid_tourism_mobile/drawer.dart';
import 'package:mid_tourism_mobile/pages/transportation/transport_form.dart';
import 'package:mid_tourism_mobile/models/transport_model.dart';

class TransportPage extends StatefulWidget {
  const TransportPage({super.key});

  @override
  State<TransportPage> createState() => _Transport();
}

class _Transport extends State<TransportPage> {
  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();

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
                      image: AssetImage("assets/transportation.png"),
                      fit: BoxFit.cover),
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const FittedBox(
                        fit: BoxFit.fitWidth,
                        child: Text("Rental Vehicles",
                            style: TextStyle(
                              fontSize: 60,
                              fontFamily: 'Quicksand',
                              color: Colors.white,
                            )),
                      ),
                      Center(
                        child: Text("Vehicles you can rent!",
                            style: TextStyle(
                              fontSize: 15,
                              fontFamily: 'Quicksand',
                              color: Colors.white.withOpacity(0.8),
                            )),
                      ),
                      Center(
                        child: Text(
                            "Experience authenticity and accommodation with MID-Tourism",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 15,
                              fontFamily: 'Quicksand',
                              color: const Color(0xffFFFFFF).withOpacity(0.8),
                            )),
                      ),
                    ])),
            Visibility(
              visible: request.loggedIn,
              child: Container(
                margin: const EdgeInsets.all(10),
                child: ElevatedButton(
                    onPressed: () async {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const TransportForm()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xff24a0ed),
                        shape: const StadiumBorder(),
                        minimumSize: const Size(260, 50)),
                    child: const Text("Add Vehicle",
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'Quicksand',
                          color: Color(0xffFFFFFF),
                        ))),
              ),
            ),
            FutureBuilder(
                future: fetchTransport(),
                builder: (context, AsyncSnapshot snapshot) {
                  if (snapshot.data == null) {
                    return const Center(child: CircularProgressIndicator());
                  } else {
                    if (!snapshot.hasData) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            "No Vehicles available :(",
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
                              height: 240,
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
                                              snapshot.data![index].fields
                                                  .companyName,
                                              style: const TextStyle(
                                                fontSize: 24,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black,
                                              ),
                                            ),
                                          ),
                                        ),
                                        AutoSizeTextField(
                                          enabled: false,
                                          readOnly: true,
                                          controller: TextEditingController(
                                              text: snapshot.data![index].fields
                                                  .transportName),
                                          decoration: const InputDecoration(
                                            labelText: "Vehicle type",
                                            isDense: true,
                                            contentPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    8, 8, 8, 0),
                                            border: InputBorder.none,
                                          ),
                                        ),
                                        AutoSizeTextField(
                                          enabled: false,
                                          readOnly: true,
                                          controller: TextEditingController(
                                              text: snapshot.data![index].fields
                                                  .transportPrice),
                                          decoration: const InputDecoration(
                                            labelText: "Price",
                                            isDense: true,
                                            contentPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    8, 8, 8, 0),
                                            border: InputBorder.none,
                                          ),
                                        ),
                                        TextField(
                                          enabled: false,
                                          readOnly: true,
                                          controller: TextEditingController(
                                              text:
                                                  "${snapshot.data![index].fields.description}"),
                                          decoration: const InputDecoration(
                                            labelText: "Description",
                                            isDense: true,
                                            contentPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    8, 8, 8, 0),
                                            border: InputBorder.none,
                                          ),
                                        ),
                                        AutoSizeTextField(
                                          enabled: false,
                                          readOnly: true,
                                          maxLines: 2,
                                          controller: TextEditingController(
                                              text:
                                                  '${(snapshot.data![index].fields.availability) ? "AVAILABLE" : "UNAVAILABLE"}'),
                                          decoration: const InputDecoration(
                                            labelText: "Availability",
                                            isDense: true,
                                            contentPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    8, 8, 8, 0),
                                            border: InputBorder.none,
                                          ),
                                        ),
                                      ]),
                                      Visibility(
                                          visible: request.loggedIn,
                                          child: Expanded(
                                            child: Align(
                                              alignment: Alignment.bottomRight,
                                              child: FittedBox(
                                                fit: BoxFit.fitWidth,
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.end,
                                                  children: [
                                                    Container(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                0, 0, 6, 10),
                                                        child: FittedBox(
                                                            child:
                                                                ElevatedButton(
                                                                    style: ElevatedButton
                                                                        .styleFrom(
                                                                      backgroundColor:
                                                                          Colors
                                                                              .blue,
                                                                    ),
                                                                    onPressed:
                                                                        () async {
                                                                      try {
                                                                        final response =
                                                                            await request.get('https://mid-tourism.up.railway.app/rental_transport/change_availability_flutter/${snapshot.data![index].pk}');
                                                                      } catch (e) {
                                                                        print(
                                                                            "$e HUHHHH??!!!!");
                                                                      }
                                                                      Navigator
                                                                          .pushReplacement(
                                                                        context,
                                                                        MaterialPageRoute(
                                                                            builder: (context) =>
                                                                                const TransportPage()),
                                                                      );
                                                                    },
                                                                    child: const Text(
                                                                        "Change Availability",
                                                                        style: TextStyle(
                                                                            color:
                                                                                Colors.white))))),
                                                    Container(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                6, 0, 12, 10),
                                                        child: FittedBox(
                                                          child: ElevatedButton(
                                                              style: ElevatedButton.styleFrom(
                                                                  backgroundColor:
                                                                      Colors
                                                                          .red,
                                                                  maximumSize:
                                                                      const Size(
                                                                          74, 36)),
                                                              onPressed:
                                                                  () async {
                                                                try {
                                                                  final response =
                                                                      await request
                                                                          .get(
                                                                              'https://mid-tourism.up.railway.app/rental_transport/remove_transport_flutter/${snapshot.data![index].pk}');
                                                                } catch (e) {
                                                                  print(
                                                                      "$e HUHHHH??!!!!");
                                                                }
                                                                Navigator
                                                                    .pushReplacement(
                                                                  context,
                                                                  MaterialPageRoute(
                                                                      builder:
                                                                          (context) =>
                                                                              const TransportPage()),
                                                                );
                                                              },
                                                              child: const Text(
                                                                  "Delete",
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .white))),
                                                        )),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ))
                                    ]),
                                  ),
                                ),
                              ])));
                    }
                  }
                }),
          ],
        ),
      )),
    );
  }
}
