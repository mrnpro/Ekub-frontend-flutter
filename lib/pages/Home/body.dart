import 'package:ekub/Navigator/navigate.dart';
import 'package:ekub/common/constants.dart';
import 'package:ekub/pages/Home/widget/DaysPart/botom_list.dart';
import 'package:ekub/pages/Home/widget/DaysPart/days.dart';

import 'package:ekub/pages/Home/widget/TopPart/top_holder.dart';
import 'package:ekub/wrapper/wrapper.dart';
import 'package:flutter/material.dart';

import '../../service/services.dart';

class Body extends StatefulWidget {
  Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return FutureBuilder(
        future: Services().account(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return Column(
              children: [
                topHolder(
                  size: size,
                  data: snapshot.data['result'],
                ),
                Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 2),
                    child: Days(
                      currentday: snapshot.data['days']['currentday'],
                    )),
                Expanded(
                    child: BottomList(
                  data: snapshot.data,
                )),
              ],
            );
          }

          // final account = Account(
          //     AccountUser(data['userId'], data['balance'], data['package'],
          //         data['packageStartedOn'], data['packageExpireOn']),
          //     Days(data['days']['days'], data['days']['currentday']));
          // print("returning");
          // print(account.days!.currentday);
          if (snapshot.connectionState == ConnectionState.done) {
            return Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.cloud_off),
                    kspace,
                    Text("No Connection "),
                    kspace,
                    TextButton(
                        onPressed: () {
                          Navigate.neverReturn(context, Wrapper());
                        },
                        child: Text("Retry"))
                  ]),
            );
          }
          return Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(),
              kspace,
              Text("Please Wait ...")
            ],
          ));
        });
  }
}
