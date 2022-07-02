import 'package:dio/dio.dart';
import 'package:ekub/model/data/Request/request.dart';
import 'package:ekub/service/http.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class BottomList extends StatelessWidget {
  const BottomList({
    Key? key,
  }) : super(key: key);
  Future getDays() async {
    List days = [];
    final token = await const FlutterSecureStorage().read(key: 'auth');

    try {
      Response response = await Http().getRequest(
          urlPath: '/days', header: Request(token.toString()).toJson());
      if (response.statusCode == 200) {
        days = response.data['days'];
      }
      return days;
    } on DioError catch (e) {
      print(e.response);
    }
  }

  @override
  Widget build(BuildContext context) {
    getDays();
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: FutureBuilder(
          future: getDays(),
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
                        snapshot.data[index] == "paid"
                            ? Container(
                                padding: const EdgeInsets.all(11),
                                decoration: BoxDecoration(
                                    color: Colors.green,
                                    borderRadius: BorderRadius.circular(14)),
                                child: Icon(
                                  color: Colors.white,
                                  Icons.done,
                                ),
                              )
                            : Container(
                                padding: const EdgeInsets.all(11),
                                decoration: BoxDecoration(
                                    color: const Color.fromARGB(
                                        255, 141, 141, 141),
                                    borderRadius: BorderRadius.circular(14)),
                                child: Icon(
                                  color: Colors.white,
                                  Icons.circle,
                                ),
                              ),
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
