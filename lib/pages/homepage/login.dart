import 'package:flutter/material.dart';
import 'package:mid_tourism_mobile/drawer.dart';
import 'package:mid_tourism_mobile/pages/homepage/aboutpage.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';

class MyLoginPage extends StatefulWidget {
  const MyLoginPage({super.key});

  @override
  State<MyLoginPage> createState() => _MyLoginPage();
}

class _MyLoginPage extends State<MyLoginPage> {
  final _loginFormKey = GlobalKey<FormState>();
  bool isPasswordVisible = false;
  void togglePasswordView() {
    setState(() {
      isPasswordVisible = !isPasswordVisible;
    });
  }

  String _username = "";
  String _password = "";

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return MaterialApp(
        home: Scaffold(
            backgroundColor: const Color(0xff3f8dcd),
            appBar: AppBar(title: const Text("Log in Page")),
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
                    child: Text("Log-in Page",
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
                        image: AssetImage("Saly-44.png"),
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
                                  Navigator.pop(context);
                                },
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xffd3462c),
                                    shape: const StadiumBorder()),
                                child: const Text("Go Back",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontFamily: 'Quicksand',
                                        color: Color(0xffFFFFFF)))),
                          )),
                      Container(
                          margin: const EdgeInsets.only(bottom: 10, top: 10),
                          padding: const EdgeInsets.only(left: 7.5, right: 7.5),
                          child: FittedBox(
                            fit: BoxFit.fitHeight,
                            child: ElevatedButton(
                                onPressed: () {
                                  Navigator.pushReplacement(
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
                                        color: Color(0xff000000)))),
                          )),
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
                      onChanged: (String? value) {
                        _username = value!;
                      },
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 7.5, right: 7.5),
                    width: 280,
                    height: 40,
                    child: TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        hintText: "Password",
                      ),
                      onChanged: (String? value) {
                        _password = value!;
                      },
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(10),
                    child: ElevatedButton(
                        onPressed: () async {
                          print(_username + _password);
                          final response = await request.login(
                              "https://mid-tourism.up.railway.app/homepage/login_flutter/",
                              {
                                'username': _username,
                                'password': _password,
                              });
                          if (request.loggedIn) {
                            // Code here will run if the login succeeded.
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return const AlertDialog(
                                      content: Text(
                                          "You've successfully logged in!"));
                                });

                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const MyAboutPage(),
                                ));
                          } else {
                            // Code here will run if the login failed (wrong username/password).
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return const AlertDialog(
                                      content: Text('Wrong Credentials!'));
                                });
                          }
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xffd3462c),
                            shape: const StadiumBorder(),
                            minimumSize: const Size(280, 50)),
                        child: const Text("Log-in!",
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
