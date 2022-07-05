import 'package:ekub/pages/Home/widget/DaysPart/daysStatus.dart';
import 'package:ekub/service/services.dart';
import 'package:flutter/material.dart';

class BottomList extends StatefulWidget {
  BottomList({
    Key? key,
    required this.data,
  }) : super(key: key);
  var data;

  @override
  State<BottomList> createState() => _BottomListState();
}

class _BottomListState extends State<BottomList> {
  final services = Services();

  Future<void> _pull() async {
    await Services().account();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final currentday = widget.data['days']['currentday'];
    print(currentday);
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: RefreshIndicator(
          onRefresh: _pull,
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: widget.data['days']['days'].length,
            itemBuilder: (context, index) => Container(
              padding: const EdgeInsets.all(7),
              margin: const EdgeInsets.symmetric(vertical: 7),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(20)),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    currentday == index
                        ? widget.data['days']['days'].elementAt(currentday) ==
                                "pending"
                            ? Container(
                                padding: const EdgeInsets.all(11),
                                decoration: BoxDecoration(
                                    color: Colors.orange,
                                    borderRadius: BorderRadius.circular(14)),
                                child: Icon(color: Colors.white, Icons.circle))
                            : DaysStatus.status(
                                widget.data['days']['days'].elementAt(index))
                        : DaysStatus.status(
                            widget.data['days']['days'].elementAt(index)),
                    currentday == index
                        ? widget.data['days']['days'].elementAt(currentday) ==
                                "pending"
                            ? Text(
                                "Current Day",
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
                              )
                            : Text(
                                widget.data['days']['days'].elementAt(index),
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
                              )
                        : Text(
                            widget.data['days']['days'].elementAt(index),
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 14.0),
                      child: Text("day $index"),
                    ),
                  ]),
            ),
          ),
        ));
  }
}
