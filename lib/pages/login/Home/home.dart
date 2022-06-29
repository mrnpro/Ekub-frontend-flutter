import 'package:ekub/pages/login/Home/widget/options.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 233, 233, 233),
      body: SafeArea(
          child: Column(
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
                  children: const [Text("Username"), CircleAvatar()],
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  padding: EdgeInsets.all(30),
                  width: size.width,
                  height: size.height / 4.5,
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(20)),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Align(
                            alignment: Alignment.centerLeft,
                            child: Text("Saved Balance")),
                        Align(
                            alignment: Alignment.centerLeft,
                            child: Text("200ETB"))
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
                    Options(icon: Icons.dynamic_feed, text: "Days")
                  ],
                ),
              ],
            ),
          ),
          Container(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text("Recent Transaction"),
                      Text("View all")
                    ],
                  ),
                  // Expanded(
                  //   child: ListView.builder(
                  //       itemBuilder: (BuildContext context, index) {
                  //     return Container();
                  //   }),
                  // )
                ],
              )),
        ],
      )),
    );
  }
}
