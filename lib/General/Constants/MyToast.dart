import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';

class MyToast {
  void showToast(String msg, Color bgColor) {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: bgColor,
        textColor: Colors.white,
        fontSize: 16.0);
  }
}
