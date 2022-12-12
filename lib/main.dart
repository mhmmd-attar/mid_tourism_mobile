import 'package:flutter/material.dart';
import 'package:mid_tourism_mobile/drawer.dart';
import 'package:mid_tourism_mobile/pages/homepage/login.dart';
import 'package:mid_tourism_mobile/pages/homepage/register.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) {
        CookieRequest request = CookieRequest();
        return request;
      },
      child: MaterialApp(
        title: 'MID-Tourism',
        home: const MyHomePage(),
        routes: {
          "/login": (BuildContext context) => const MyLoginPage(),
        },
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  final String title = "Homepage";

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            backgroundColor: const Color(0xff3f8dcd),
            appBar: AppBar(title: Text(widget.title)),
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
                    child: Text("Go Anywhere, Know Every place",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 15,
                            fontFamily: 'Quicksand',
                            color: const Color(0xffFFFFFF).withOpacity(0.5))),
                  ),
                  Center(
                    child: Text(
                        "Experience authenticity and accommodation with MID-Tourism",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 15,
                            fontFamily: 'Quicksand',
                            color: const Color(0xffFFFFFF).withOpacity(0.5))),
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 7.5, right: 7.5),
                    child: const FittedBox(
                      fit: BoxFit.fitWidth,
                      child: Image(
                        image: AssetImage("assets/Saly-44.png"),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  Visibility(
                      visible: !request.loggedIn,
                      child: Container(
                        margin: const EdgeInsets.all(10),
                        height: 50.0,
                        child: ElevatedButton(
                            onPressed: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                    const MyLoginPage()),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xffFFFFFF),
                                shape: const StadiumBorder(),
                                minimumSize: const Size(280, 50)),
                            child: const Text("Login",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontFamily: 'Quicksand',
                                    color: Color(0xff000000)))),
                  )),
                  Visibility(
                      visible: !request.loggedIn,
                      child: Container(
                        margin: const EdgeInsets.all(10),
                        child: ElevatedButton(
                            onPressed: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                    const MyRegisterPage(title: 'Register')),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xffd3462c),
                                shape: const StadiumBorder(),
                                minimumSize: const Size(280, 50)),
                            child: const Text("Register",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontFamily: 'Quicksand',
                                    color: Color(0xffFFFFFF)))),
                  )),
                  Visibility(
                    visible: request.loggedIn,
                    child: Container(
                      margin: const EdgeInsets.all(10),
                      child: ElevatedButton(
                        onPressed: () {
                          request.logout,
                          Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                          builder: (context) =>
                          const MyHomePage()),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xffd3462c),
                            shape: const StadiumBorder(),
                            minimumSize: const Size(280, 50)),
                        child: const Text("Log Out",
                            style: TextStyle(
                                fontSize: 20,
                                fontFamily: 'Quicksand',
                                color: Color(0xffFFFFFF)))),
                  ),)


                  // Added behavior when budget is typed
                ],
              ),
            )));
  }
}
