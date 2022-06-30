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
        itemCount: 90,
        itemBuilder: (context, index) => Container(
          padding: const EdgeInsets.all(7),
          margin: const EdgeInsets.symmetric(vertical: 7),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(20)),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Container(
              padding: const EdgeInsets.all(11),
              child: Icon(
                Icons.done,
                color: Colors.white,
              ),
              decoration: BoxDecoration(
                  color: Colors.green, borderRadius: BorderRadius.circular(14)),
            ),
            const Text(
              "Paid",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14.0),
              child: Text("day $index"),
            ),
          ]),
        ),
      ),
    );
  }
}
