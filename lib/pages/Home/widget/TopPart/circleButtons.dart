import 'package:ekub/pages/Home/widget/options.dart';
import 'package:flutter/material.dart';

import '../../../../common/toast.dart';
import '../custom_dialog.dart';

class CircleButtonsWidget extends StatelessWidget {
  const CircleButtonsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        CircleButtons(icon: Icons.wallet, text: "penality", onPressed: () {}),
        CircleButtons(icon: Icons.payment, text: "Withdraw", onPressed: () {}),
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
              CToast.show(false, "Refreshing...");
            }),
      ],
    );
  }
}
