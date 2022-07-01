import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CToast {
  static show(bool error, String msg) {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        //gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: error ? Colors.red : Colors.green,
        textColor: Colors.white,
        fontSize: 16.0);
  }
}
