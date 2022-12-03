import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
        primarySwatch: Colors.yellow,
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
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.fromLTRB(0,50,0,0),
                    child: Text("MID Tourism"),
                  ),
                  Container(
                    child: Text("log-in page"),
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        child: TextButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(Colors.red),
                            ),
                            onPressed: () {
                            },
                            child: const Text('Go Back',)
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
                            child: const Text('About Us?',
                            )
                        ),
                      ),
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(300,10,300,10),
                    child:TextFormField(
                      decoration: InputDecoration(
                        filled:true,
                        fillColor: Colors.white,
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        hintText: "Email",

                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(300,0,300,10),
                    child:TextFormField(
                      decoration: InputDecoration(
                        filled:true,
                        fillColor: Colors.white,
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        hintText: "Password",
                      ),
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
                        child: const Text('Log-in!',)
                    ),
                  )

                  // Added behavior when budget is typed
                ],
              ),
            )
        )
    );
  }
}