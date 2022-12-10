import 'package:flutter/material.dart';
import 'package:mid_tourism_mobile/drawer.dart';
import 'package:mid_tourism_mobile/pages/landmark/landmark_form.dart';
import 'package:mid_tourism_mobile/models/landmark_model.dart';

class LandmarkPage extends StatefulWidget {
  const LandmarkPage({super.key});

  @override
  State<LandmarkPage> createState() => _Landmark();
}

class _Landmark extends State<LandmarkPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff2f2f2),
      appBar: AppBar(),
      drawer: const AppDrawer(),
      body: Center(
        child: Column(
          children: <Widget>[
            Container(
              margin: const EdgeInsets.all(20.0),
              padding: const EdgeInsets.all(20.0),
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("restaurant.png"), //TODO
                  fit: BoxFit.cover
                ),
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const FittedBox(
                    fit: BoxFit.fitWidth,
                    child: Text("Landmarks",
                      style: TextStyle(
                        fontSize: 60,
                        fontFamily: 'Quicksand',
                        color: Colors.white
                      )
                    ),
                  ),
                  Center(
                    child: Text(
                      "Beautiful places across the islands!",
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: 'Quicksand',
                        color: Colors.white.withOpacity(0.8)
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
                        color: const Color(0xffFFFFFF).withOpacity(0.8)
                      )
                    ),
                  ),
                ]
              )
            ),
            Container(
              margin: const EdgeInsets.all(10),
              height: 50.0,
              child: ElevatedButton(
                  onPressed: () {
                    int pk = getLandmarksLength() as int;
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LandmarkForm()
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff24a0ed),
                      shape: const StadiumBorder()),
                  child: const Text(
                      "Register a Landmark",
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'Quicksand',
                        color: Color(0xffFFFFFF),
                      )
                  )
              ),
            ),
            FutureBuilder(
              future: fetchLandmarks(),
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
                          "No Landmarks Registered",
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
                        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                        padding: const EdgeInsets.all(20.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                          BorderRadius.circular(15.0),
                          boxShadow: const [
                            BoxShadow(
                                color: Colors.black,
                                blurRadius: 2.0)
                          ]
                        ),
                        child: Row(
                          mainAxisAlignment:
                          MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "${snapshot.data![index].fields.name}",
                              style: const TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ]
                        )
                      )
                    );
                  }
                }
              }
            ),
          ],
        ),
      ),
    );
  }
}