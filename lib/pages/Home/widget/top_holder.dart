import 'package:ekub/pages/Home/widget/options.dart';
import 'package:flutter/material.dart';

class topHolder extends StatelessWidget {
  const topHolder({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height / 2,
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, -15),
            blurRadius: 40,
            color: Colors.blue.withOpacity(0.15),
          )
        ],
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("E-ቁብ ",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30)),
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
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                offset: const Offset(0, -3),
                blurRadius: 15,
                color: Colors.blue,
              )
            ], color: Colors.blue, borderRadius: BorderRadius.circular(20)),
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
              Options(icon: Icons.charging_station_rounded, text: "Recharge"),
              Options(icon: Icons.dynamic_feed, text: "Days")
            ],
          ),
        ],
      ),
    );
  }
}
