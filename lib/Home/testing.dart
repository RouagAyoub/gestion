import 'dart:convert';
import 'dart:io';
import 'package:gestion/Model/Productfood.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gestion/Helper/databasefetch.dart';
import 'package:gestion/themes/colors.dart';
import 'package:image_picker/image_picker.dart';
import 'package:gcayoubpackage/gcayoubpackage.dart';

class Testing extends StatefulWidget {
  Testing({Key key}) : super(key: key);

  @override
  _TestingState createState() => _TestingState();
}

class _TestingState extends State<Testing> {
  Authentification auth = Authentification();
  File imagefile;
  String imagedata;
  List<Widget> listw = [];
  Widget widgt = Container(
    child: Text("data"),
  );
  pickimageFromgallery() async {
    auth.number(context, ["06"]);
    var pickedimage = await ImagePicker().getImage(source: ImageSource.gallery);
    setState(() {
      imagefile = File(pickedimage.path);
    });
    imagedata = base64Encode(imagefile.readAsBytesSync());
    return imagedata;
  }

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
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 10, left: 10),
                      child: FlatButton(
                          onPressed: () async {
                            await pickimageFromgallery();
                            await http.post(apiurl, body: {
                              'queryrequest':
                                  "INSERT INTO foodproduct( `foodname`,`foodprice`,`sizetype`,`foodimage`) VALUES('amine','1','1','$imagedata')",
                              'action': 'ADD_CLIENT',
                            });
                            /*setState(() {
                              widgt = Container(
                                child: Image.memory(base64Decode(imagedata)),
                              );
                            });*/
                          },
                          child: Text("set image")),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10, left: 10),
                      child: FlatButton(
                          onPressed: () async {
                            List<Productfood> product =
                                await getdata("SELECT * FROM foodproduct");

                            setState(() {
                              for (Productfood i in product) {
                                print(i.foodimage.length);
                                widgt = Container(
                                  child:
                                      Image.memory(base64Decode(i.foodimage)),
                                );
                                listw.add(widgt);
                              }
                            });
                          },
                          child: Text("get image")),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  child: listw != null
                      ? ListView.separated(
                          itemCount: listw.length,
                          separatorBuilder: (BuildContext context, int index) {
                            return Divider();
                          },
                          itemBuilder: (BuildContext context, int index) {
                            return listw[index];
                          },
                        )
                      : Center(
                          child: CircularProgressIndicator(),
                        ),
                ),
              )
            ],
          )),
      //),
    );
  }
}
