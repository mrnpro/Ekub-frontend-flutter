import 'package:ekub/pages/Home/widget/botom_list.dart';

import 'package:ekub/pages/Home/widget/days.dart';
import 'package:ekub/pages/Home/widget/top_holder.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      children: [
        topHolder(size: size),
        Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 2),
            child: const Days()),
        const Expanded(child: BottomList()),
      ],
    );
  }
}
