import 'package:flutter/material.dart';

class Navigate {
  static preferReturn(BuildContext context, Widget to) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => to));
  }

  static neverReturn(BuildContext context, Widget to) {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => to),
      (route) => false,
    );
  }
}
