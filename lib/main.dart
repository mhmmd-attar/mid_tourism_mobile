import 'package:flutter/material.dart';
import 'package:mid_tourism_mobile/drawer.dart';
import 'package:mid_tourism_mobile/login.dart';
import 'package:mid_tourism_mobile/register.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Homepage',
      home: const MyHomePage(title: 'Homepage'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
        home: Scaffold(
            backgroundColor: Color(0xff3f8dcd),
            body: Center(
              child: Column(
                children:
                <Widget>[
                  Center(
                    child: Text("MID Tourism", style: TextStyle(
                        fontSize: 60, fontFamily: 'Quicksand',
                        color: Color(0xffFFFFFF))),
                  ),
                  Center(
                    child: Text("Go Anywhere, Know Every place", style: TextStyle(
                        fontSize: 15, fontFamily: 'Quicksand',
                        color: Color(0xffFFFFFF).withOpacity(0.5))),
                  ),
                  Center(
                    child: Text("Experience authenticity and accomodation with MID-Tourism", style: TextStyle(
                        fontSize: 15, fontFamily: 'Quicksand',
                        color: Color(0xffFFFFFF).withOpacity(0.5))),
                  ),
                  Container(
                    child: Image(
                      image: AssetImage("Saly-44.png"),
                      fit: BoxFit.contain,
                    ),
                  ),

                  Container(
                    margin: EdgeInsets.all(10),
                    height: 50.0,
                    child: ElevatedButton(
                      child: Text("           Login           ",
                          style: TextStyle(fontSize: 20, fontFamily: 'Quicksand',
                              color: Color(0xff000000))),
                      onPressed: () {
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) => const MyLoginPage(title:'login')),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xffFFFFFF),
                          shape: StadiumBorder()
                      )
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(10),
                    height: 50.0,
                    child: ElevatedButton(
                        child: Text("         Register         ",
                            style: TextStyle(fontSize: 20, fontFamily: 'Quicksand',
                                color: Color(0xffFFFFFF))),
                        onPressed: () {
                          Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) => const MyRegisterPage(title:'register')),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xffd3462c),
                            shape: StadiumBorder()
                        )
                    ),
                  ),


                  // Added behavior when budget is typed
                ],
              ),
            )
        )
    );
  }
}