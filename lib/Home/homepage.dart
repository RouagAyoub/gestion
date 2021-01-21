import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:gestion/main.dart';
import 'package:gestion/themes/colors.dart';

class Homepage extends StatefulWidget {
  Homepage({Key key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  List<String> typefood = [];
  typefoodlist() {
    for (var item1 in list) {
      if (!typefood.contains(item1.producttype))
        typefood.add(item1.producttype);
    }
  }

  @override
  void initState() {
    typefoodlist();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      child: SafeArea(
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: globalcolor,
              title: Row(
                children: [
                  Icon(
                    Icons.local_pizza,
                    color: Colors.amber,
                  ),
                  Text("PIZZA"),
                  Spacer(),
                  Icon(Icons.shopping_cart)
                ],
              ),
            ),
            body: Column(
              children: [
                Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: globalcolor,
                        borderRadius: new BorderRadius.only(
                            bottomLeft: Radius.elliptical(300, 100),
                            bottomRight: Radius.elliptical(300, 100)),
                      ),
                      height: size.height * 0.4,
                    ),
                    Container(
                      height: 50,
                      child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) => Container(
                                padding: EdgeInsets.only(left: 10, right: 10),
                                child: FlatButton(
                                    onPressed: () {},
                                    child: Text(
                                      typefood[index].toString(),
                                      style: TextStyle(
                                          color: Colors.grey[50],
                                          fontWeight: FontWeight.w600),
                                    )),
                              ),
                          separatorBuilder: (context, index) => Divider(),
                          itemCount: typefood.length),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 60),
                      child: CarouselSlider(
                        options: CarouselOptions(),
                        items: list
                            .map((item) => InkWell(
                                  onTap: () {
                                    print(item.foodid);
                                  },
                                  child: Container(
                                    child: Image.memory(
                                        base64Decode(item.foodimage)),
                                  ),
                                ))
                            .toList(),
                      ),
                    ),
                  ],
                ),
              ],
            )),
      ),
    );
  }
}
