import 'package:flutter/material.dart';
import 'package:auto_size_text_field/auto_size_text_field.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';

import 'package:mid_tourism_mobile/drawer.dart';
import 'package:mid_tourism_mobile/pages/tourguide/tourguide_form.dart';
import 'package:mid_tourism_mobile/models/tourguide_model.dart';

class TourguidePage extends StatefulWidget {
  const TourguidePage({super.key});

  @override
  State<TourguidePage> createState() => _Tourguide();
}

class _Tourguide extends State<TourguidePage> {
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
                      image: AssetImage("assets/tourguide.jpg"),
                      fit: BoxFit.cover),
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const FittedBox(
                        fit: BoxFit.fitWidth,
                        child: Text("Tourguides",
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
                                color:
                                    const Color(0xffFFFFFF).withOpacity(0.8))),
                      ),
                    ])),
            Container(
              margin: const EdgeInsets.all(10),
              child: ElevatedButton(
                  onPressed: () async {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const TourguideForm()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff24a0ed),
                      shape: const StadiumBorder(),
                      minimumSize: const Size(260, 50)),
                  child: const Text("Add Tourguide",
                      style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'Quicksand',
                          color: Color(0xffFFFFFF)))),
            ),
            FutureBuilder(
                future: fetchTourguide(),
                builder: (context, AsyncSnapshot snapshot) {
                  if (snapshot.data == null) {
                    return const Center(child: CircularProgressIndicator());
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
                              height: 200,
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
                                              snapshot
                                                  .data![index].fields.company,
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
                                              text: snapshot
                                                  .data![index].fields.date),
                                          decoration: const InputDecoration(
                                            labelText: "Date",
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
                                                  .destination),
                                          decoration: const InputDecoration(
                                            labelText: "Destination",
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
                                              text: snapshot
                                                  .data![index].fields.isBooked
                                                  .toString()),
                                          decoration: const InputDecoration(
                                            labelText: "is Booked",
                                            isDense: true,
                                            contentPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    8, 8, 8, 0),
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
                                                        child: ElevatedButton(
                                                            style:
                                                                ElevatedButton
                                                                    .styleFrom(
                                                              backgroundColor:
                                                                  Colors.blue,
                                                            ),
                                                            onPressed: () {},
                                                            child: const Text(
                                                                "Change Availability",
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .white))))),
                                              ],
                                            ),
                                          ),
                                        ),
                                      )
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
