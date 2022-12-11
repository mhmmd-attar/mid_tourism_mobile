import 'package:flutter/material.dart';
import 'package:mid_tourism_mobile/drawer.dart';
import 'package:mid_tourism_mobile/pages/homepage/aboutpage.dart';

class MyAboutPage extends StatefulWidget {
  const MyAboutPage({super.key, required this.title});
  final String title;

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
              title: Text(widget.title),
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
                                  left: 50, top: 50, right: 50, bottom: 20),
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
                            fontSize: 30,
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
                                  left: 50, top: 50, right: 50, bottom: 20),
                              child: Image(
                                image: AssetImage("essential.png"),
                                fit: BoxFit.contain,
                              ),
                            ))),
                  ],
                ),
              ),
            )));
  }
}
