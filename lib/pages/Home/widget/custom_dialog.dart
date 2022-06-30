import 'package:ekub/common/constants.dart';
import 'package:ekub/pages/Home/widget/circluarPayment.dart';
import 'package:flutter/material.dart';

class CustomDialog extends StatelessWidget {
  const CustomDialog({
    Key? key,
  }) : super(key: key);

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
            onTap: () {},
            img: telebirr,
          ),
          PaymentCircle(
            onTap: () {},
            img: yenepay,
          ),
          PaymentCircle(
            onTap: () {},
            img: amole,
          ),
          PaymentCircle(
            onTap: () {},
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
