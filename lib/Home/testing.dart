import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/basic.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:gestion/themes/colors.dart';
import 'package:image_picker/image_picker.dart';

class Testing extends StatefulWidget {
  Testing({Key key}) : super(key: key);

  @override
  _TestingState createState() => _TestingState();
}

class _TestingState extends State<Testing> {
  File imagefile;
  String imagedata;
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
                  child: FlatButton(
                      onPressed: () async {
                        var pickedimage = await ImagePicker()
                            .getImage(source: ImageSource.gallery);
                        setState(() {
                          imagefile = File(pickedimage.path);
                        });
                        imagedata = base64Encode(imagefile.readAsBytesSync());
                        print(imagedata);
                      },
                      child: Text("data")),
                ),
              )
            ],
          )),
      //),
    );
  }
}
