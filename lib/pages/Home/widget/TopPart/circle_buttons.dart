import 'package:dio/dio.dart';
import 'package:ekub/model/data/Request/request.dart';
import 'package:ekub/pages/Home/widget/options.dart';
import 'package:ekub/service/http/http.dart';
import 'package:ekub/service/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../../../Navigator/navigate.dart';
import '../../../../common/showdialog.dart';
import '../../../../common/toast.dart';
import '../../../../wrapper/wrapper.dart';
import '../custom_dialog.dart';

class CircleButtonsWidget extends StatelessWidget {
  const CircleButtonsWidget({Key? key, required this.data}) : super(key: key);
  final data;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        CircleButtons(
            icon: Icons.wallet,
            text: "penalty",
            onPressed: () async {
              try {
                CDialog.show(context);
                final token =
                    await const FlutterSecureStorage().read(key: 'auth');
                Response response = await Http().getRequest(
                    urlPath: 'penality',
                    header: Request(token.toString()).toJson());
                Navigator.pop(context);

                showDialog(
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                          actions: [
                            Center(
                              child: Column(
                                children: [
                                  Text(
                                      "Total Unpaid plan: ${response.data['msg']['total unpaid plan Bill']}"),
                                  Text(
                                      "Total penalty : ${response.data['msg']['total penalty Bill']}"),
                                  Text(
                                      "Total amount  : ${response.data['msg']['total']}"),
                                ],
                              ),
                            ),
                            Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  TextButton(
                                      onPressed: () async {
                                        Navigator.pop(context);
                                        CDialog.show(context);

                                        try {
                                          response = await Http().postRequest(
                                              urlPath: 'penality',
                                              header: Request(token.toString())
                                                  .toJson());
                                          CToast.show(
                                              false, response.data['msg']);
                                          Navigator.pop(context);
                                        } on DioError catch (e) {
                                          Navigator.pop(context);
                                          CToast.show(
                                              true, e.response!.data['msg']);
                                        }
                                      },
                                      child: const Text(
                                        "PAY",
                                        style: TextStyle(color: Colors.black),
                                      )),
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: const Text(
                                      "cancel",
                                      style: TextStyle(color: Colors.black),
                                    ),
                                  ),
                                ]),
                          ],
                        ));
              } on DioError catch (e) {
                Navigator.pop(context);
                CToast.show(true, e.response!.data['msg']);
              }
            }),
        CircleButtons(
            icon: Icons.payment,
            text: "Withdraw",
            onPressed: () {
              CToast.show(false, "comming soon...");
            }),
        CircleButtons(
            icon: Icons.charging_station_rounded,
            text: "Recharge",
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (context) => CustomDialog(
                        data: data,
                      ));
            }),
        CircleButtons(
            icon: Icons.outbond,
            text: "Logout",
            onPressed: () {
              Services().account();

              CToast.show(false, "Logging out...");
              const FlutterSecureStorage().delete(key: "auth");
              Navigate.neverReturn(context, Wrapper());
            }),
      ],
    );
  }
}
