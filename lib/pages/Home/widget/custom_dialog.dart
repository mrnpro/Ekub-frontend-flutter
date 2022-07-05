import 'package:dio/dio.dart';
import 'package:ekub/Navigator/navigate.dart';
import 'package:ekub/common/constants.dart';
import 'package:ekub/common/toast.dart';
import 'package:ekub/model/data/Request/request.dart';
import 'package:ekub/pages/Home/widget/circluarPayment.dart';
import 'package:ekub/service/http/http.dart';
import 'package:ekub/wrapper/wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:yenepay_flutter/models/enums.dart';
import 'package:yenepay_flutter/models/yenepay_item.dart';
import 'package:yenepay_flutter/models/yenepay_parameters.dart';
import 'package:yenepay_flutter/yenepay_flutter.dart';

class CustomDialog extends StatefulWidget {
  const CustomDialog({
    Key? key,
    required this.data,
  }) : super(key: key);
  final data;
  @override
  State<CustomDialog> createState() => _CustomDialogState();
}

class _CustomDialogState extends State<CustomDialog> {
  @override
  void initState() {
    YenepayFlutter.init(
      onPaymentSuccess: (List<YenepayItem> items) async {
        try {
          final token = await const FlutterSecureStorage().read(key: 'auth');
          Response response = await Http().getRequest(
              urlPath: '/recharge', header: Request(token.toString()).toJson());
          if (response.statusCode == 200) {
            CToast.show(false, response.data['msg']);
          }
        } on DioError catch (e) {
          CToast.show(true, e.response!.data);
        }

        Navigate.neverReturn(context, Wrapper());
      },
      onPaymentCancel: (List<YenepayItem> items) {
        CToast.show(true, "payment canceled");
      },
      onPaymentFailure: (List<YenepayItem> items) {
        CToast.show(true, "payment failure");
      },
      onError: (e) {
        print("onError ${e.toString()}");
      },
    );

    super.initState();
  }

  @override
  void dispose() {
    YenepayFlutter.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text(
        'Choose payment method',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 20,
        ),
      ),
      content: Wrap(
        children: [
          PaymentCircle(
            onTap: () {
              CToast.show(
                  true, "service unavailable please use YenePay instead");
            },
            img: telebirr,
          ),
          PaymentCircle(
            onTap: () {
              YenepayFlutter.startPayment(
                isTestEnv: true,
                yenepayParameters: YenepayParameters(
                  process: YenepayProcess.Express,
                  merchantId: "SB1478",
                  items: [
                    YenepayItem(
                      itemId: '1 day',
                      unitPrice: double.parse(widget.data['package']),
                      quantity: 1,
                      itemName: 'Daily payment',
                    ),
                  ],
                ),
              );
            },
            img: yenepay,
          ),
          PaymentCircle(
            onTap: () {
              CToast.show(
                  true, "service unavailable please use YenePay instead");
            },
            img: amole,
          ),
          PaymentCircle(
            onTap: () {
              CToast.show(
                  true, "service unavailable please use YenePay instead");
            },
            img: cbe,
          )
        ],
      ),
      actions: [
        Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
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
    );
  }
}
