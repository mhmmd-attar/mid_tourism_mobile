import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:mid_tourism_mobile/main.dart';
import 'package:mid_tourism_mobile/drawer.dart';
import 'package:mid_tourism_mobile/pages/homepage/about.dart';

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
            backgroundColor: const Color(0xff3f8dcd),
            appBar: AppBar(
              title: Text(widget.title),
            ),
            drawer: const AppDrawer(),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.only(left: 15, right: 15),
                    child: const FittedBox(
                      fit: BoxFit.fitWidth,
                      child: Text("MID Tourism",
                          style: TextStyle(
                              fontSize: 60,
                              fontFamily: 'Quicksand',
                              color: Color(0xffFFFFFF))),
                    ),
                  ),
                  Center(
                    child: Text("Register Page",
                        style: TextStyle(
                            fontSize: 15,
                            fontFamily: 'Quicksand',
                            color: const Color(0xffFFFFFF).withOpacity(0.5))),
                  ),
                  Container(
                    constraints: const BoxConstraints(maxHeight: 300),
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: const FittedBox(
                      fit: BoxFit.fitWidth,
                      child: Image(
                        image: AssetImage("assets/Saly-44.png"),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                          margin: const EdgeInsets.only(bottom: 10, top: 10),
                          padding: const EdgeInsets.only(left: 7.5, right: 7.5),
                          child: FittedBox(
                            fit: BoxFit.fitWidth,
                            child: ElevatedButton(
                                onPressed: () {
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(builder: (context) => const MyHomePage()
                                      )
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xffd3462c),
                                    shape: const StadiumBorder()),
                                child: const Text("Go Back",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontFamily: 'Quicksand',
                                        color: Color(0xffFFFFFF)))),
                          )
                      ),
                      Container(
                          margin: const EdgeInsets.only(bottom: 10, top: 10),
                          padding: const EdgeInsets.only(left: 7.5, right: 7.5),
                          child: FittedBox(
                            fit: BoxFit.fitHeight,
                            child: ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                        const MyAboutPage()),
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xffFFFFFF),
                                    shape: const StadiumBorder()),
                                child: const Text("About Us?",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontFamily: 'Quicksand',
                                        color: Color(0xff000000)
                                    )
                                )
                            ),
                          )
                      ),
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 7.5, right: 7.5),
                    width: 280,
                    height: 40,
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
                  Container(
                    padding: const EdgeInsets.only(left: 7.5, right: 7.5),
                    width: 280,
                    height: 40,
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
                    margin: const EdgeInsets.all(10),
                    child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xffd3462c),
                            shape: const StadiumBorder(),
                            minimumSize: const Size(280, 50)
                        ),
                        child: const Text("Register Now!",
                            style: TextStyle(
                                fontSize: 20,
                                fontFamily: 'Quicksand',
                                color: Color(0xff000000)))),
                  ),
                ],
              ),
            )));
  }
}
