import 'package:flutter/material.dart';

class Signup extends StatefulWidget {
  Signup({Key key}) : super(key: key);

  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final _formkey = GlobalKey<FormState>();
  TextEditingController _phonenumbercontroller = TextEditingController();
  TextEditingController _usernamecontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
      body: Container(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 40),
              child: Center(
                child: Text(
                  "Sign up",
                  style: TextStyle(
                      fontSize: 27,
                      fontWeight: FontWeight.w900,
                      fontStyle: FontStyle.italic),
                ),
              ),
            ),
            Form(
              key: _formkey,
              child: Column(
                children: [
                  Container(
                    //height: 50,
                    margin: EdgeInsets.only(
                        left: 30, right: 30, top: 30, bottom: 30),
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
                      cursorColor: Colors.deepOrangeAccent[700],
                      enableSuggestions: true,
                      keyboardType: TextInputType.number,
                      maxLength: 10,
                      //textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  Container(
                    //height: 50,
                    margin: EdgeInsets.only(left: 30, right: 30, bottom: 30),
                    padding: EdgeInsets.only(left: 20, bottom: 20),
                    decoration: BoxDecoration(
                      color: Colors.black12,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextFormField(
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "User name",
                          hintStyle: TextStyle(fontSize: 20)),
                      controller: _usernamecontroller,
                      autofocus: true,
                      cursorColor: Colors.deepOrangeAccent[700],
                      enableSuggestions: true,
                      keyboardType: TextInputType.number,
                      //textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ],
              ),
            ),
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
                    "Sign up",
                    style: TextStyle(
                        fontSize: 25,
                        color: Colors.white,
                        fontWeight: FontWeight.w800),
                  ))),
            ),
          ],
        ),
      ),
    ));
  }
}
