import 'package:ekub/pages/Home/home.dart';
import 'package:ekub/pages/login/login.dart';
import 'package:ekub/service/auth/auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class Wrapper extends StatelessWidget {
  Wrapper({Key? key}) : super(key: key);
  final storage = FlutterSecureStorage();
  final auth = Auth();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: storage.read(key: "auth"),
        builder: (context, AsyncSnapshot snapshot) {
          if (!snapshot.hasData) {
            return Login();
          }

          return Home();
        }

        // body: FutureBuilder(
        //     future: Auth().singinWithToken(),
        //     builder: (context, AsyncSnapshot snapshot) {
        //       if (!snapshot.hasData) {
        //         log("THERE IS NO DATA");
        //       } else {
        //         if (snapshot.data.statusCode == 200) {
        //           log("hastoken");
        //           Navigate.neverReturn(context, Home());
        //         } else {
        //           Navigate.neverReturn(context, Login());
        //         }
        //       }

        //       return Center(child: Text("please wait"));
        //     }),
        );
  }
}
