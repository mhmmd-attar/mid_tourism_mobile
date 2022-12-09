import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mid_tourism_mobile/drawer.dart';
import 'package:mid_tourism_mobile/pages/homepage/aboutpage.dart';

class MyRegisterApp extends StatelessWidget {
  const MyRegisterApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Register',
      home: const MyRegisterPage(title: 'Register'),
    );
  }
}

class MyRegisterPage extends StatefulWidget {
  const MyRegisterPage({super.key, required this.title});
  final String title;

  @override
  State<MyRegisterPage> createState() => _MyRegisterPage();
}

class _MyRegisterPage extends State<MyRegisterPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            backgroundColor: Color(0xff3f8dcd),
            appBar: AppBar(
              title: Text(widget.title),
            ),
            drawer: const AppDrawer(),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Center(
                    child: Text("MID Tourism",
                        style: TextStyle(
                            fontSize: 60,
                            fontFamily: 'Quicksand',
                            color: Color(0xffFFFFFF))),
                  ),
                  Center(
                    child: Text("Register Page",
                        style: TextStyle(
                            fontSize: 15,
                            fontFamily: 'Quicksand',
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
                                style: TextStyle(
                                    fontSize: 20,
                                    fontFamily: 'Quicksand',
                                    color: Color(0xffFFFFFF))),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0xffd3462c),
                                shape: StadiumBorder())),
                      ),
                      Container(
                        margin: EdgeInsets.all(10),
                        height: 50.0,
                        child: ElevatedButton(
                            child: Text("About Us?",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontFamily: 'Quicksand',
                                    color: Color(0xff000000))),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const MyAboutPage(title: 'About')),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0xffFFFFFF),
                                shape: StadiumBorder())),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 280,
                    child: TextFormField(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        hintText: "Email",
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 280,
                    child: TextFormField(
                      decoration: InputDecoration(
                        filled: true,
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
                        child: Text("           Register Now!           ",
                            style: TextStyle(
                                fontSize: 20,
                                fontFamily: 'Quicksand',
                                color: Color(0xff000000))),
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xffd3462c),
                            shape: StadiumBorder())),
                  ),
                ],
              ),
            )));
  }
}
