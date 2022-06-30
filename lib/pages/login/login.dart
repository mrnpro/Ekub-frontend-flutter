import 'package:ekub/common/constants.dart';
import 'package:ekub/components/logo.dart';
import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kwhite,
      body: SafeArea(
          child: Column(
        children: const [Logo()],
      )),
    );
  }
}
