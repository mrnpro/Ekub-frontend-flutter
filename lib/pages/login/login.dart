import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:ekub/Navigator/navigate.dart';
import 'package:ekub/common/constants.dart';
import 'package:ekub/common/toast.dart';
import 'package:ekub/components/logo.dart';
import 'package:ekub/model/data/user/user.dart';
import 'package:ekub/pages/Home/home.dart';
import 'package:ekub/pages/register/register.dart';
import 'package:ekub/service/auth/auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class Login extends StatelessWidget {
  Login({Key? key}) : super(key: key);
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  Auth auth = Auth();

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
                    controller: username,
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
                    controller: password,
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
                            Navigate.preferReturn(context, Register());
                          },
                          child: const Text("Register?")),
                      TextButton(
                          onPressed: () {},
                          child: const Text("Forgot Passwod?"))
                    ],
                  ),
                  kspace,
                  FlatButton(
                      color: kprimary,
                      onPressed: () async {
                        login(context);
                      },
                      child: const Text(
                        "Login",
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

  void login(BuildContext context) async {
    showDialog(
        context: context,
        builder: (context) {
          return const Center(
            child: SizedBox(
                height: 30, width: 30, child: CircularProgressIndicator()),
          );
        });
    try {
      await auth
          .signin(User("", username.text.trim(), password.text.trim()))
          .then((response) => {
                if (response.statusCode == 200)
                  {
                    CToast.show(false, response.data['msg']),
                    Navigator.pop(context),
                    Navigate.neverReturn(context, const Home())
                  }
              });
    } on DioError catch (e) {
      Navigator.pop(context);
      CToast.show(true, e.response?.data);
    }
  }
}
