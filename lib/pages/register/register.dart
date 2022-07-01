import 'package:dio/dio.dart';
import 'package:ekub/common/constants.dart';
import 'package:ekub/components/logo.dart';
import 'package:ekub/pages/Home/home.dart';
import 'package:ekub/pages/login/login.dart';
import 'package:ekub/service/auth/auth.dart';
import 'package:flutter/material.dart';

import '../../Navigator/navigate.dart';
import '../../common/toast.dart';
import '../../model/data/user/user.dart';

class Register extends StatelessWidget {
  Register({Key? key}) : super(key: key);
  TextEditingController fullname = TextEditingController();

  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
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
                    controller: fullname,
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
                            Navigate.neverReturn(context, Login());
                          },
                          child: const Text("Login?")),
                      TextButton(onPressed: () {}, child: const Text(""))
                    ],
                  ),
                  kspace,
                  // ignore: deprecated_member_use
                  FlatButton(
                      color: kprimary,
                      onPressed: () {
                        register(context);
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

  void register(BuildContext context) async {
    Auth auth = Auth();
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
          .signup(User(
              fullname.text.trim(), username.text.trim(), password.text.trim()))
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
