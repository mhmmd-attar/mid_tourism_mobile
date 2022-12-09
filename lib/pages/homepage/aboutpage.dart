import 'package:flutter/material.dart';
import 'package:mid_tourism_mobile/drawer.dart';

class MyAboutApp extends StatelessWidget {
  const MyAboutApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'About',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyAboutPage(title: 'About'),
    );
  }
}

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
            backgroundColor: Colors.blue,
            drawer: const AppDrawer(),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.fromLTRB(0, 50, 0, 0),
                    child: Text("MID Tourism"),
                  ),
                  Container(
                    child: Text(
                        "Go Anywhere, Know Everywhere \n Experience authenticity and accomodation with MID-Tourism"),
                  ),
                  Container(child: Text("Learn more about MID Tourism")),

                  Container(
                    child: TextButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.red),
                        ),
                        onPressed: () {},
                        child: const Text(
                          'Log-in!',
                        )),
                  ),
                  Container(
                    child: TextButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.red),
                        ),
                        onPressed: () {},
                        child: const Text(
                          'Register',
                        )),
                  ),
                  // Added behavior when budget is typed
                ],
              ),
            )));
  }
}
