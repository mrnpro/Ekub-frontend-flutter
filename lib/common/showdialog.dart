import 'package:flutter/material.dart';

import 'constants.dart';

class CDialog {
  static show(BuildContext context) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return Center(
            child: Container(
              padding: EdgeInsets.all(55),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: kwhite,
              ),
              child: SizedBox(
                  height: 30, width: 30, child: CircularProgressIndicator()),
            ),
          );
        });
  }
}
