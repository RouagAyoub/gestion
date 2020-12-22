import 'package:flutter/material.dart';
import 'package:gestion/Inscription/inscription.dart';

class Login extends StatefulWidget {
  Login({Key key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formkey = GlobalKey<FormState>();
  TextEditingController _phonenumbercontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
      body: Container(
        child: Column(
          children: [
            Container(
              height: 150,
              margin: EdgeInsets.only(bottom: 50),
              child: Center(
                child: Image.asset("assets/logo.png"),
              ),
            ),
            Center(
              child: Text(
                "LOGIN",
                style: TextStyle(
                    fontSize: 27,
                    fontWeight: FontWeight.w900,
                    fontStyle: FontStyle.italic),
              ),
            ),
            Form(
                key: _formkey,
                child: Container(
                  //height: 50,
                  margin:
                      EdgeInsets.only(left: 30, right: 30, top: 30, bottom: 30),
                  padding: EdgeInsets.only(left: 20),
                  decoration: BoxDecoration(
                    color: Colors.black12,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextFormField(
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Phone number...",
                        hintStyle: TextStyle(fontSize: 20)),
                    controller: _phonenumbercontroller,
                    autofocus: true,
                    cursorColor: Colors.purpleAccent[700],
                    enableSuggestions: true,
                    keyboardType: TextInputType.number,
                    maxLength: 10,
                    //textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20),
                  ),
                )),
            FlatButton(
              padding: EdgeInsets.only(left: 30, right: 30),
              onPressed: () {},
              child: Container(
                  height: 50,
                  width: size.width,
                  decoration: BoxDecoration(
                    color: Colors.deepOrangeAccent[700],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                      child: Text(
                    "Login",
                    style: TextStyle(
                        fontSize: 25,
                        color: Colors.white,
                        fontWeight: FontWeight.w800),
                  ))),
            ),
            Container(
              padding: EdgeInsets.only(left: 20, top: 10),
              alignment: Alignment.centerLeft,
              width: size.width,
              child: FlatButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (BuildContext context) => Signup(),
                    ),
                  );
                },
                child: Text(
                  "Inscreption",
                  style: TextStyle(fontSize: 18),
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }
}

String reverss(String initial) {
  return initial.split('').reversed.join();
}
