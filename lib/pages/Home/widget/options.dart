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
            backgroundColor: const Color.fromARGB(255, 163, 206, 241),
            child: IconButton(onPressed: () => onPressed(), icon: Icon(icon)),
          ),
          const SizedBox(
            height: 13,
          ),
          Text(
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 11,
              ),
              text)
        ],
      ),
    );
  }
}
