import 'package:dio/dio.dart';
import 'package:ekub/service/http/http.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../model/data/Request/request.dart';
import '../model/data/account/account.dart';

class Services extends Http {
  Future account() async {
    print("called");
    final token = await const FlutterSecureStorage().read(key: 'auth');

    try {
      Response response = await getRequest(
          urlPath: '/account', header: Request(token.toString()).toJson());
      print("again here");
      if (response.statusCode == 200) {
        print(response.data['account']);

        return Account.fromJson(response.data['account']);
      }
    } on DioError catch (e) {
      print("error");
      print(e);
    }
  }

  Future getDays() async {
    List days = [];
    final token = await const FlutterSecureStorage().read(key: 'auth');

    try {
      Response response = await getRequest(
          urlPath: '/days', header: Request(token.toString()).toJson());
      if (response.statusCode == 200) {
        days = response.data['days'];
      }
      return days;
    } on DioError catch (e) {
      print(e.response);
    }
  }
}
