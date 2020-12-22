import 'package:flutter/material.dart';
import 'package:gestion/themes/colors.dart';
import 'package:lottie/lottie.dart';

class Homepage extends StatefulWidget {
  Homepage({Key key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  List<Widget> list = [
    Container(
      height: 200,
      width: 200,
      color: secondcolor,
      child: Expanded(child: Text("1")),
    ),
    Container(
      height: 200,
      width: 200,
      color: globalcolor,
      child: Text("2"),
    ),
    Container(
      height: 200,
      width: 200,
      color: secondcolor,
      child: Text("3"),
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      // child: SafeArea(
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: globalcolor,
            title: Row(
              children: [
                Text("Choose your food"),
                Spacer(),
                Icon(Icons.notifications)
              ],
            ),
          ),
          body: Column(
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Container(
                  margin: EdgeInsets.only(top: 10, left: 10),
                  child: Row(
                    children: [
                      Column(
                        children: [
                          Container(
                            height: 150,
                            width: 150,
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(20.0),
                                child: Image.asset("assets/all.png")),
                          ),
                          Text("data")
                        ],
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: globalcolor,
                            borderRadius: BorderRadius.circular(50)),
                        height: 150,
                        width: 150,
                        child: Text("data"),
                      ),
                      Container(
                        color: globalcolor,
                        height: 150,
                        width: 150,
                        child: Text("data"),
                      )
                    ],
                  ),
                ),
              )
            ],
          )),
      //),
    );
  }
}
