import 'package:dio/dio.dart';
import 'package:ekub/Navigator/navigate.dart';
import 'package:ekub/common/constants.dart';
import 'package:ekub/common/toast.dart';
import 'package:ekub/components/logo.dart';
import 'package:ekub/model/data/account/account.dart';
import 'package:ekub/pages/Home/widget/TopPart/circleButtons.dart';
import 'package:ekub/pages/Home/widget/custom_dialog.dart';
import 'package:ekub/pages/Home/widget/options.dart';
import 'package:ekub/service/services.dart';

import 'package:ekub/wrapper/wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../../../model/data/Request/request.dart';
import '../../../../service/http/http.dart';
import 'choosePackage/choose_package.dart';
import 'circle_buttons_packages.dart';

class topHolder extends StatefulWidget {
  const topHolder({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  State<topHolder> createState() => _topHolderState();
}

class _topHolderState extends State<topHolder> {
  @override
  Widget build(BuildContext context) {
    final service = Services();
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, -15),
            blurRadius: 40,
            color: Colors.blue.withOpacity(0.15),
          )
        ],
        borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(width: widget.size.width / 7, child: const Logo()),
              CircleAvatar(
                backgroundColor: const Color.fromARGB(255, 163, 206, 241),
                child: IconButton(
                    onPressed: () {
                      const FlutterSecureStorage().delete(key: "auth");
                      Navigate.neverReturn(context, Wrapper());
                    },
                    icon: const Icon(Icons.logout_outlined)),
              )
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            padding: const EdgeInsets.all(30),
            width: widget.size.width,
            height: widget.size.height / 5,
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                offset: const Offset(0, -3),
                blurRadius: 4,
                color: Colors.blue.withOpacity(0.15),
              )
            ], color: Colors.blue, borderRadius: BorderRadius.circular(20)),
            child: FutureBuilder(
              future: service.account(),
              builder: (context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  Account account = snapshot.data;

                  if (account.package == "none") {
                    return const ChoosePackage();
                  }
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Align(
                          alignment: Alignment.centerLeft,
                          child: Text("Saved Balance",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white))),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Text(account.balance.toString(),
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30,
                                  color: Colors.white))),
                    ],
                  );
                }
                return const Center(
                  child: CircularProgressIndicator(
                    color: kwhite,
                  ),
                );
              },
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const CircleButtonsWidget()
        ],
      ),
    );
  }
}
