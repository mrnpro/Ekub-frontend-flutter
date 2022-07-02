import 'package:ekub/pages/Home/widget/DaysPart/daysStatus.dart';
import 'package:ekub/service/services.dart';
import 'package:flutter/material.dart';

class BottomList extends StatelessWidget {
  const BottomList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final services = Services();
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: FutureBuilder(
          future: services.getDays(),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: 90,
                itemBuilder: (context, index) => Container(
                  padding: const EdgeInsets.all(7),
                  margin: const EdgeInsets.symmetric(vertical: 7),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20)),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        DaysStatus.status(snapshot.data[index]),
                        Text(
                          snapshot.data[index],
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 14.0),
                          child: Text("day $index"),
                        ),
                      ]),
                ),
              );
            }
            return Text("please wait ...");
          },
        ));
  }
}
