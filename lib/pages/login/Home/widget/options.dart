import 'package:flutter/material.dart';

class Options extends StatelessWidget {
  const Options({Key? key, required this.icon, required this.text})
      : super(key: key);
  final IconData icon;
  final String text;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 50,
      child: Column(
        children: [
          CircleAvatar(
            radius: 23,
            backgroundColor: Color.fromARGB(255, 163, 206, 241),
            child: IconButton(onPressed: () {}, icon: Icon(icon)),
          ),
          SizedBox(
            height: 13,
          ),
          Text(
              style: TextStyle(
                fontSize: 11,
              ),
              text)
        ],
      ),
    );
  }
}
