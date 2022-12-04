import 'package:flutter/material.dart';
import 'package:mid_tourism_mobile/drawer.dart';

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
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
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
            backgroundColor: Colors.blue,
            body: Center(
              child: Column(
                children:
                <Widget>[
                  Center(
                    child: Text("MID Tourism"),
                  ),
                  Center(
                    child: Text("Go Anywhere, Know Every place"),
                  ),
                  Center(
                    child: Text("Experience authenticity and accomodation with MID-Tourism"),
                  ),
                  Container(
                    child: Image(
                      image: AssetImage("Saly-44.png"),
                      fit: BoxFit.contain,
                    ),
                  ),

                  Container(
                        child: TextButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(Colors.red),
                            ),
                            onPressed: () {
                            },
                            child: const Text('Log-in!',)
                        ),
                      ),
                  Container(
                        child: TextButton(
                            style: ButtonStyle(
                              backgroundColor:
                              MaterialStateProperty.all(Colors.red),
                            ),
                            onPressed: () {
                            },
                            child: const Text('Register',)
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