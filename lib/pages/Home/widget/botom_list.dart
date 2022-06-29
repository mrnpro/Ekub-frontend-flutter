import 'package:flutter/material.dart';

class BottomList extends StatelessWidget {
  const BottomList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 230,
      child: Expanded(
        child: ListView.builder(
          physics: BouncingScrollPhysics(),
          itemCount: 4,
          itemBuilder: (context, index) => Container(
            padding: EdgeInsets.all(7),
            margin: EdgeInsets.symmetric(vertical: 7),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(20)),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: EdgeInsets.all(11),
                    child: Icon(
                      Icons.outbond,
                      color: Colors.white,
                    ),
                    decoration: BoxDecoration(
                        color: Colors.orange,
                        borderRadius: BorderRadius.circular(14)),
                  ),
                  Text(
                    "daily plan",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text("100")
                ]),
          ),
        ),
      ),
    );
  }
}
