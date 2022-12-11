import 'package:flutter/material.dart';
import 'package:mid_tourism_mobile/drawer.dart';

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
            backgroundColor: Colors.blue,
            drawer: const AppDrawer(),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
                    child: const Text("MID Tourism"),
                  ),
                  const Text(
                      "Go Anywhere, Know Everywhere \n Experience authenticity and accomodation with MID-Tourism"),
                  const Text("Learn more about MID Tourism"),

                  TextButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.red),
                      ),
                      onPressed: () {},
                      child: const Text(
                        'Log-in!',
                      )),
                  TextButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.red),
                      ),
                      onPressed: () {},
                      child: const Text(
                        'Register',
                      )),
                  // Added behavior when budget is typed
                ],
              ),
            )));
  }
}
