import 'package:ekub/common/constants.dart';
import 'package:flutter/material.dart';

class CircleButtons extends StatelessWidget {
  const CircleButtons(
      {Key? key,
      required this.icon,
      required this.text,
      required this.onPressed})
      : super(key: key);
  final IconData icon;
  final String text;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 50,
      child: Column(
        children: [
          CircleAvatar(
            radius: 23,
            backgroundColor: ksecondary,
            child: IconButton(onPressed: () => onPressed(), icon: Icon(icon)),
          ),
          const SizedBox(
            height: 13,
          ),
          Text(
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: MediaQuery.of(context).size.width / 40,
              ),
              text)
        ],
      ),
    );
  }
}
