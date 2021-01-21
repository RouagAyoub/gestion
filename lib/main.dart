import 'package:flutter/material.dart';
import 'package:gestion/Helper/changepage.dart';
import 'package:gestion/Helper/databasefetch.dart';
import 'package:gestion/Home/testing.dart';
import 'package:gestion/Model/Productfood.dart';
import 'package:lottie/lottie.dart';

import 'Home/homepage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Testing(),
    );
  }
}

class Getdataclass extends StatefulWidget {
  Getdataclass({Key key}) : super(key: key);

  @override
  _GetdataclassState createState() => _GetdataclassState();
}

List<Productfood> list;

class _GetdataclassState extends State<Getdataclass> {
  getlistdata() async {
    await getdata("SELECT * FROM foodproduct")
        .then((value) => list = value)
        .whenComplete(() async {
      await Future.delayed(Duration(seconds: 2));
      changepagewithreturn(context, Homepage());
    });
  }

  @override
  void initState() {
    getlistdata();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Lottie.asset("assets/pizzadesp.json"),
    );
  }
}
