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
  TextEditingController PIN = TextEditingController();
  final _formKey = GlobalKey<FormState>();
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
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        validator: ((value) {
                          if (value!.isEmpty) {
                            return "please enter  Full Name eg: Natnael Fikadu";
                          }
                        }),
                        controller: fullname,
                        decoration: InputDecoration(
                          hintText: "Full Name",
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
                          Text(
                            "Already have an account ?",
                            style: TextStyle(fontSize: 13),
                          ),
                          TextButton(
                              onPressed: () {
                                Navigate.neverReturn(context, Login());
                              },
                              child: const Text("Login")),
                          TextButton(onPressed: () {}, child: const Text(""))
                        ],
                      ),
                      kspace,
                      // ignore: deprecated_member_use
                      FlatButton(
                          height: 50,
                          minWidth: size.width,
                          color: kprimary,
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              register(context);
                            }
                          },
                          child: const Text(
                            "Register",
                            style: TextStyle(color: kwhite),
                          )),
                      SizedBox(
                        height: 30,
                      ),
                      Text(
                        Copyright,
                        style: TextStyle(
                            color: Color.fromARGB(255, 110, 110, 110)),
                      )
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
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return Center(
            child: Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: kwhite,
              ),
              child: SizedBox(
                  height: 30, width: 30, child: CircularProgressIndicator()),
            ),
          );
        });
    try {
      await auth
          .signup(
              User(fullname.text.trim(), username.text.trim(), PIN.text.trim()))
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
