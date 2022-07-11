import 'package:ekub/pages/Home/body.dart';

import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 221, 240, 252),
      body: Body(),
    );
  }
}
