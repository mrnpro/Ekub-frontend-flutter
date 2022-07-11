// ignore_for_file: deprecated_member_use

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

import '../../common/showdialog.dart';

// ignore: must_be_immutable
class Login extends StatelessWidget {
  Login({Key? key}) : super(key: key);
  TextEditingController username = TextEditingController();
  TextEditingController PIN = TextEditingController();
  Auth auth = Auth();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kwhite,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SafeArea(
            child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(width: size.width / 3, child: const Logo()),
              Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        validator: ((value) {
                          if (value!.isEmpty) {
                            return "please enter your username eg @natnael";
                          }
                        }),
                        controller: username,
                        decoration: InputDecoration(
                          prefixText: "@",
                          hintText: "username",
                          fillColor: Colors.white,
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: kprimary, width: 1.0),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          border: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: kprimary, width: 1.0),
                            borderRadius: BorderRadius.circular(6),
                          ),
                        ),
                      ),
                      kspace,
                      TextFormField(
                        validator: ((value) {
                          if (value!.isEmpty) {
                            return "please enter your PIN";
                          } else if (value.length < 6) {
                            return "PIN should be above 6 characters";
                          }
                        }),
                        keyboardType: TextInputType.number,
                        controller: PIN,
                        obscureText: true,
                        decoration: InputDecoration(
                          suffixIcon: Icon(Icons.remove_red_eye),
                          hintText: "PIN",
                          fillColor: Colors.white,
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: kprimary, width: 1.0),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          border: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: kprimary, width: 1.0),
                            borderRadius: BorderRadius.circular(6),
                          ),
                        ),
                      ),
                      kspace,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextButton(
                              onPressed: () {},
                              child: const Text("Forgot PIN?"))
                        ],
                      ),
                      kspace,
                      FlatButton(
                          height: 50,
                          minWidth: size.width,
                          color: kprimary,
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              login(context);
                            }
                          },
                          child: const Text(
                            "Login",
                            style: TextStyle(color: kwhite, fontSize: 20),
                          )),
                      kspace,
                      Row(
                        children: [
                          Row(
                            children: [
                              Text(
                                "Don't have an account ?",
                                style: TextStyle(fontSize: 13),
                              ),
                              TextButton(
                                  onPressed: () {
                                    Navigate.preferReturn(context, Register());
                                  },
                                  child: const Text("Create New Account")),
                            ],
                          ),
                        ],
                      ),
                    ],
                  )),
              SizedBox(
                height: 30,
              ),
              Text(
                Copyright,
                style: TextStyle(color: Color.fromARGB(255, 110, 110, 110)),
              )
            ],
          ),
        )),
      ),
    );
  }

  void login(BuildContext context) async {
    CDialog.show(context);
    try {
      await auth
          .signin(User("", username.text.trim(), PIN.text.trim()))
          .then((response) => {
                if (response.statusCode == 200)
                  {
                    CToast.show(false, response.data['msg']),
                    Navigator.pop(context),
                    Navigate.neverReturn(context, Home())
                  }
              });
    } on DioError catch (e) {
      Navigator.pop(context);
      CToast.show(true, e.response?.data);
    }
  }
}
