import 'package:ekub/common/constants.dart';
import 'package:ekub/components/logo.dart';
import 'package:ekub/pages/Home/home.dart';
import 'package:ekub/pages/login/login.dart';
import 'package:flutter/material.dart';

import '../../Navigator/navigate.dart';

class Register extends StatelessWidget {
  const Register({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kwhite,
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SafeArea(
            child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(width: size.width / 3, child: const Logo()),
              Form(
                  child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: "full name",
                      fillColor: Colors.white,
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: kprimary, width: 1.0),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      border: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: kprimary, width: 1.0),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  kspace,
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: "username",
                      fillColor: Colors.white,
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: kprimary, width: 1.0),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      border: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: kprimary, width: 1.0),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  kspace,
                  TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: "password",
                      fillColor: Colors.white,
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: kprimary, width: 1.0),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      border: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: kprimary, width: 1.0),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  kspace,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                          onPressed: () {
                            Navigate.preferReturn(context, const Login());
                          },
                          child: const Text("Login?")),
                      TextButton(
                          onPressed: () {},
                          child: const Text("Forgot Passwod?"))
                    ],
                  ),
                  kspace,
                  // ignore: deprecated_member_use
                  FlatButton(
                      color: kprimary,
                      onPressed: () {
                        Navigate.neverReturn(context, const Home());
                      },
                      child: const Text(
                        "Register",
                        style: TextStyle(color: kwhite),
                      ))
                ],
              ))
            ],
          ),
        )),
      ),
    );
  }
}
