import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

changepagewithreturn(context, newRouteName) {
  Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(builder: (context) => newRouteName),
    (Route<dynamic> route) => false,
  );
}
