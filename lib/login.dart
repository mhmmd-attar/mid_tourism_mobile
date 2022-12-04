import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mid_tourism_mobile/drawer.dart';

class MyLoginApp extends StatelessWidget {
  const MyLoginApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'login',
      home: const MyLoginPage(title: 'login'),
    );
  }
}

class MyLoginPage extends StatefulWidget {
  const MyLoginPage({super.key, required this.title});
  final String title;

  @override
  State<MyLoginPage> createState() => _MyLoginPage();
}

class _MyLoginPage extends State<MyLoginPage> {
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
                    child: Text("Log-in Page", style: TextStyle(
                        fontSize: 15, fontFamily: 'Quicksand',
                        color: Color(0xffFFFFFF).withOpacity(0.5))),
                  ),
                  Container(
                    child: Image(
                      image: AssetImage("Saly-44.png"),
                      fit: BoxFit.contain,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.all(10),
                        height: 50.0,
                        child: ElevatedButton(
                            child: Text("Go Back",
                                style: TextStyle(fontSize: 20, fontFamily: 'Quicksand',
                                    color: Color(0xffFFFFFF))),
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0xffd3462c),
                                shape: StadiumBorder()
                            )
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(10),
                        height: 50.0,
                        child: ElevatedButton(
                            child: Text("About Us?",
                                style: TextStyle(fontSize: 20, fontFamily: 'Quicksand',
                                    color: Color(0xff000000))),
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0xffFFFFFF),
                                shape: StadiumBorder()
                            )
                        ),
                      ),
                    ],
                  ),

                  Container(
                    padding: EdgeInsets.fromLTRB(370,3,370,3),
                    child:TextFormField(
                      decoration: InputDecoration(
                        filled:true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        hintText: "Email",

                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(370,0,370,3),
                    child:TextFormField(
                      decoration: InputDecoration(
                        filled:true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        hintText: "Password",
                      ),
                    ),
                  ),

                  Container(
                    margin: EdgeInsets.all(10),
                    height: 50.0,
                    child: ElevatedButton(
                        child: Text("               Log-in!               ",
                            style: TextStyle(fontSize: 20, fontFamily: 'Quicksand',
                                color: Color(0xff000000))),
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xffd3462c),
                            shape: StadiumBorder()
                        )
                    ),
                  ),

                ],
              ),
            )
        )
    );
  }
}