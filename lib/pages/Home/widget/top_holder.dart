import 'package:dio/dio.dart';
import 'package:ekub/Navigator/navigate.dart';
import 'package:ekub/common/constants.dart';
import 'package:ekub/common/toast.dart';
import 'package:ekub/components/logo.dart';
import 'package:ekub/model/data/account/account.dart';
import 'package:ekub/pages/Home/widget/custom_dialog.dart';
import 'package:ekub/pages/Home/widget/options.dart';

import 'package:ekub/wrapper/wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../../model/data/Request/request.dart';
import '../../../service/http.dart';

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
  Future account() async {
    final token = await const FlutterSecureStorage().read(key: 'auth');

    try {
      Response response = await Http().getRequest(
          urlPath: '/account', header: Request(token.toString()).toJson());
      if (response.statusCode == 200) {
        print(response.data['account']);

        return Account.fromJson(response.data['account']);
      }
    } on DioError catch (e) {
      print(e);
    }
  }

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
              future: account(),
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
                return Center(
                  child: const CircularProgressIndicator(
                    color: kwhite,
                  ),
                );
              },
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CircleButtons(
                  icon: Icons.wallet, text: "penality", onPressed: () {}),
              CircleButtons(
                  icon: Icons.payment, text: "Withdraw", onPressed: () {}),
              CircleButtons(
                  icon: Icons.charging_station_rounded,
                  text: "Recharge",
                  onPressed: () {
                    showDialog(
                        context: context, builder: (context) => CustomDialog());
                  }),
              CircleButtons(
                  icon: Icons.refresh,
                  text: "Refresh",
                  onPressed: () {
                    setState(() {
                      CToast.show(false, "Refreshing...");
                    });
                  }),
            ],
          ),
        ],
      ),
    );
  }
}

class ChoosePackage extends StatefulWidget {
  const ChoosePackage({
    Key? key,
  }) : super(key: key);

  @override
  State<ChoosePackage> createState() => _ChoosePackageState();
}

class _ChoosePackageState extends State<ChoosePackage> {
  @override
  Widget build(BuildContext context) {
    return Row(children: const [
      circlePackageButtons(
        pkg: "50",
      ),
      circlePackageButtons(
        pkg: "100",
      ),
      circlePackageButtons(
        pkg: "200",
      ),
      circlePackageButtons(
        pkg: "500",
      ),
    ]);
  }
}

class circlePackageButtons extends StatefulWidget {
  const circlePackageButtons({
    Key? key,
    required this.pkg,
  }) : super(key: key);
  final String pkg;

  @override
  State<circlePackageButtons> createState() => _circlePackageButtonsState();
}

class _circlePackageButtonsState extends State<circlePackageButtons> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        showDialog(
            context: context,
            builder: (context) {
              return const Center(
                child: SizedBox(
                    height: 30, width: 30, child: CircularProgressIndicator()),
              );
            });
        final token = await const FlutterSecureStorage().read(key: 'auth');
        try {
          Response response = await Http().postRequest(
              urlPath: 'choosePackage/${widget.pkg}',
              header: Request(token.toString()).toJson());
          Navigator.pop(context);

          CToast.show(false, response.data['msg']);
          setState(() {});
        } on DioError catch (e) {
          print(e.response);
          CToast.show(true, e.response.toString());
          Navigator.pop(context);
        }
      },
      child: Container(
        margin: const EdgeInsets.all(10),
        child: CircleAvatar(
          radius: 25,
          child: Text(widget.pkg),
        ),
      ),
    );
  }
}
