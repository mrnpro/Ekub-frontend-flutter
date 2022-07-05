import 'package:flutter/material.dart';

class Days extends StatelessWidget {
  const Days({
    required this.currentday,
    Key? key,
  }) : super(key: key);
  final currentday;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          "Days",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        TextButton(
            onPressed: () {},
            child: Text("$currentday/90",
                style: TextStyle(
                  color: Colors.red,
                )))
      ],
    );
  }
}
