import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DaysStatus {
  static status(String status) {
    switch (status) {
      case "paid":
        return Container(
          padding: const EdgeInsets.all(11),
          decoration: BoxDecoration(
              color: Colors.green, borderRadius: BorderRadius.circular(14)),
          child: Icon(
            color: Colors.white,
            Icons.done,
          ),
        );
      case "pending":
        return Container(
          padding: const EdgeInsets.all(11),
          decoration: BoxDecoration(
              color: const Color.fromARGB(255, 141, 141, 141),
              borderRadius: BorderRadius.circular(14)),
          child: Icon(
            color: Colors.white,
            Icons.circle,
          ),
        );
      case "penality":
        return Container(
          padding: const EdgeInsets.all(11),
          decoration: BoxDecoration(
              color: Color.fromARGB(255, 255, 0, 0),
              borderRadius: BorderRadius.circular(14)),
          child: Icon(
            color: Colors.white,
            Icons.one_x_mobiledata_rounded,
          ),
        );
    }
  }
}
