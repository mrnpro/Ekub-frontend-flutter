import 'package:ekub/pages/Home/widget/options.dart';
import 'package:ekub/pages/login/body.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 221, 240, 252),
      body: SafeArea(child: SizedBox(height: size.height, child: const Body())),
    );
  }
}
