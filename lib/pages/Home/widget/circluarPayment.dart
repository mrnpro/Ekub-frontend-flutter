import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PaymentCircle extends StatelessWidget {
  const PaymentCircle({Key? key, this.img, required this.onTap})
      : super(key: key);
  final img;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Container(
        margin: const EdgeInsets.all(20),
        child: CircleAvatar(
          radius: 25,
          backgroundImage: AssetImage(img),
        ),
      ),
    );
  }
}
