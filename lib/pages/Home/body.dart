import 'package:ekub/pages/Home/widget/botom_list.dart';
import 'package:ekub/pages/Home/widget/options.dart';
import 'package:ekub/pages/Home/widget/recent.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(15),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20)),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("E-ቁብ ",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 30)),
                  CircleAvatar(
                    child: IconButton(
                        onPressed: () {}, icon: Icon(Icons.logout_outlined)),
                    backgroundColor: Color.fromARGB(255, 163, 206, 241),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                padding: EdgeInsets.all(30),
                width: size.width,
                height: size.height / 5,
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(20)),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Text("Saved Balance",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white))),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Text("2000ETB",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30,
                                  color: Colors.white)))
                    ]),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Options(icon: Icons.wallet, text: "penality"),
                  Options(icon: Icons.payment, text: "Withdraw"),
                  Options(
                      icon: Icons.charging_station_rounded, text: "Recharge"),
                  Options(icon: Icons.dynamic_feed, text: "Days")
                ],
              ),
            ],
          ),
        ),
        Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: const [
                Recent(),
                BottomList()

                // )
              ],
            ))
      ],
    );
  }
}
