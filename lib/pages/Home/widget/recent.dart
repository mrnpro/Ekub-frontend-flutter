import 'package:flutter/material.dart';

class Recent extends StatelessWidget {
  const Recent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text("Recent "),
        TextButton(
            onPressed: () {},
            child: const Text("View all",
                style: TextStyle(
                  color: Colors.red,
                )))
      ],
    );
  }
}
