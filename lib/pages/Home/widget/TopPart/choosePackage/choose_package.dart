import 'package:ekub/pages/Home/widget/TopPart/circle_buttons_packages.dart';
import 'package:flutter/cupertino.dart';

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
      CirclePackageButtons(
        pkg: "50",
      ),
      CirclePackageButtons(
        pkg: "100",
      ),
      CirclePackageButtons(
        pkg: "200",
      ),
      CirclePackageButtons(
        pkg: "500",
      ),
    ]);
  }
}
