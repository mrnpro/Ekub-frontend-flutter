import 'package:flutter/material.dart';

class Days extends StatelessWidget {
  const Days({
    Key? key,
  }) : super(key: key);

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
            child: const Text("3/90",
                style: TextStyle(
                  color: Colors.red,
                )))
      ],
    );
  }
}
