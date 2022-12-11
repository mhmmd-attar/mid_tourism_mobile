import 'package:flutter/material.dart';
import 'package:mid_tourism_mobile/drawer.dart';
import 'package:mid_tourism_mobile/pages/homepage/aboutpage.dart';

class MyAboutPage extends StatefulWidget {
  const MyAboutPage({super.key});

  @override
  State<MyAboutPage> createState() => _MyAboutPage();
}

class _MyAboutPage extends State<MyAboutPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            backgroundColor: const Color(0xff3f8dcd),
            appBar: AppBar(
              title: Text("About Us"),
            ),
            drawer: const AppDrawer(),
            body: SingleChildScrollView(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                        child: const FittedBox(
                            fit: BoxFit.fitWidth,
                            child: Padding(
                              padding: EdgeInsets.only(
                                  left: 150, top: 50, right: 150, bottom: 20),
                              child: Image(
                                image: AssetImage("Saly-44.png"),
                                fit: BoxFit.contain,
                              ),
                            ))),
                    Container(
                      child: Text(
                        'About Us',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 45,
                            fontFamily: 'Quicksand',
                            color: const Color(0xffFFFFFF)),
                      ),
                    ),
                    Container(
                      child: Text(
                        'MID Tourism is a one stop web app for those who want to take a break and enjoy travelling, yet struggle with the technicalities of obtaining your daily needs when arriving at your location of leisure. We aim to make your trip the easiest it has ever been, while still maintaining the authenticity of the experience you are seeking.',
                        textAlign: TextAlign.center,
                        maxLines: null,
                        style: TextStyle(
                            fontSize: 15,
                            fontFamily: 'Quicksand',
                            color: const Color(0xffFFFFFF).withOpacity(0.5)),
                      ),
                    ),
                    Container(
                        child: const FittedBox(
                            fit: BoxFit.fitWidth,
                            child: Padding(
                              padding: EdgeInsets.only(
                                  left: 20, top: 100, right: 20, bottom: 20),
                              child: Text(
                                'What do we offer?',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 30,
                                    fontFamily: 'Quicksand',
                                    color: Color(0xffFFFFFF)),
                              ),
                            ))),
                    Container(
                      child: Text(
                        'The Essentials',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 30,
                            fontFamily: 'Quicksand',
                            color: const Color(0xffFFFFFF).withOpacity(0.7)),
                      ),
                    ),
                    Container(
                        child: const FittedBox(
                            fit: BoxFit.fitWidth,
                            child: Padding(
                              padding: EdgeInsets.only(
                                  left: 200, right: 200, bottom: 20),
                              child: Image(
                                image: AssetImage("essential.png"),
                                fit: BoxFit.contain,
                              ),
                            ))),
                    Container(
                        child: const FittedBox(
                            fit: BoxFit.fitWidth,
                            child: Padding(
                              padding: EdgeInsets.only(
                                  left: 20, right: 20, bottom: 50),
                              child: Text(
                                "We'll find you a place to crash and and a way to get there!",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 30,
                                    fontFamily: 'Quicksand',
                                    color: const Color(0xffFFFFFF)),
                              ),
                            ))),
                    Container(
                      child: Text(
                        'The Experience',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 30,
                            fontFamily: 'Quicksand',
                            color: const Color(0xffFFFFFF).withOpacity(0.7)),
                      ),
                    ),
                    Container(
                        child: const FittedBox(
                            fit: BoxFit.fitWidth,
                            child: Padding(
                              padding: EdgeInsets.only(
                                  left: 200, right: 200, bottom: 20),
                              child: Image(
                                image: AssetImage("experience.png"),
                                fit: BoxFit.contain,
                              ),
                            ))),
                    Container(
                        child: const FittedBox(
                            fit: BoxFit.fitWidth,
                            child: Padding(
                              padding: EdgeInsets.only(
                                  left: 20, right: 20, bottom: 50),
                              child: Text(
                                "Connect with a local tourguide to visit the world's wonders!",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 30,
                                    fontFamily: 'Quicksand',
                                    color: const Color(0xffFFFFFF)),
                              ),
                            ))),
                    Container(
                      child: Text(
                        'The Entertainment',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 30,
                            fontFamily: 'Quicksand',
                            color: const Color(0xffFFFFFF).withOpacity(0.7)),
                      ),
                    ),
                    Container(
                        child: const FittedBox(
                            fit: BoxFit.fitWidth,
                            child: Padding(
                              padding: EdgeInsets.only(
                                  left: 200, right: 200, bottom: 20),
                              child: Image(
                                image: AssetImage("entertainment.png"),
                                fit: BoxFit.contain,
                              ),
                            ))),
                    Container(
                        child: const FittedBox(
                            fit: BoxFit.fitWidth,
                            child: Padding(
                              padding: EdgeInsets.only(
                                  left: 20, right: 20, bottom: 50),
                              child: Text(
                                "Sing, dance, and prance around various cultures and cuisines!",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 30,
                                    fontFamily: 'Quicksand',
                                    color: const Color(0xffFFFFFF)),
                              ),
                            ))),
                  ],
                ),
              ),
            )));
  }
}
