import 'dart:developer';

import 'package:ekub/Navigator/navigate.dart';
import 'package:ekub/common/constants.dart';
import 'package:ekub/components/logo.dart';
import 'package:ekub/pages/login/login.dart';
import 'package:ekub/pages/splash.dart';
import 'package:ekub/service/services.dart';
import 'package:ekub/wrapper/wrapper.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'pages/Home/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Services(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Ekub Daily Save',
        theme: ThemeData(
          fontFamily: GoogleFonts.poppins().fontFamily,
          primarySwatch: Colors.blue,
        ),
        home: Splash(),
      ),
    );
  }
}

class Splash extends StatelessWidget {
  Future timer() async {
    await Future.delayed(Duration(seconds: 5));

    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kwhite,
        body: FutureBuilder(
            future: timer(),
            builder: (context, AsyncSnapshot snapshot) {
              if (!snapshot.hasData) {
                return Center(
                    child: SizedBox(
                        height: MediaQuery.of(context).size.height / 4,
                        child: Logo()));
              } else {
                return Wrapper();
              }
            }));
  }
}
