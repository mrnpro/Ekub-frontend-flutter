import 'package:dio/dio.dart';
import 'package:ekub/Navigator/navigate.dart';
import 'package:ekub/common/constants.dart';
import 'package:ekub/common/toast.dart';
import 'package:ekub/components/logo.dart';
import 'package:ekub/model/data/account/account.dart';
import 'package:ekub/pages/Home/widget/TopPart/circle_buttons.dart';
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
    required this.data,
  }) : super(key: key);
  final data;
  final Size size;

  @override
  State<topHolder> createState() => _topHolderState();
}

// final account = Account(
//     AccountUser(data['userId'], data['balance'], data['package'],
//         data['packageStartedOn'], data['packageExpireOn']),
//     Days(data['days']['days'], data['days']['currentday']));
// print("returning");
// print(account.days!.currentday);
class _topHolderState extends State<topHolder> {
  @override
  Widget build(BuildContext context) {
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
              const Text(
                "Beta Version 0.0",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: ksecondary,
                    fontSize: 20),
              )
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            padding: const EdgeInsets.all(30),
            width: widget.size.width,
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                offset: const Offset(0, -3),
                blurRadius: 4,
                color: Colors.blue.withOpacity(0.15),
              )
            ], color: Colors.blue, borderRadius: BorderRadius.circular(20)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                        widget.data['package'] != "none"
                            ? "Saved Balance"
                            : "Choose Package",
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white))),
                widget.data['package'] != "none"
                    ? Align(
                        alignment: Alignment.centerLeft,
                        child: Text(widget.data['balance'],
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 30,
                                color: Colors.white)))
                    : const ChoosePackage(),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          CircleButtonsWidget(
            data: widget.data,
          )
        ],
      ),
    );
  }
}
