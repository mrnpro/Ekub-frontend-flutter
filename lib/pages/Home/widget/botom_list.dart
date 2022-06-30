import 'package:flutter/material.dart';

class BottomList extends StatelessWidget {
  const BottomList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: 10,
        itemBuilder: (context, index) => Container(
          padding: EdgeInsets.all(7),
          margin: EdgeInsets.symmetric(vertical: 7),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(20)),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Container(
              padding: EdgeInsets.all(11),
              child: Icon(
                Icons.outbond,
                color: Colors.white,
              ),
              decoration: BoxDecoration(
                  color: Colors.green, borderRadius: BorderRadius.circular(14)),
            ),
            Text(
              "Paid",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text("day 0")
          ]),
        ),
      ),
    );
  }
}
