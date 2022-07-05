import 'package:dio/dio.dart';
import 'package:ekub/model/data/account/account_user.dart';
import 'package:ekub/model/data/account/days.dart';
import 'package:ekub/service/http/http.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../model/data/Request/request.dart';
import '../model/data/account/account.dart';

class Services extends ChangeNotifier {
  final http = Http();
  Future account() async {
    final token = await const FlutterSecureStorage().read(key: 'auth');
    print(token);
    try {
      Response response = await http.getRequest(
          urlPath: '/account', header: Request(token.toString()).toJson());

      if (response.statusCode == 200) {
        print(response.data);

        // final account = Account(
        //     AccountUser(data['userId'], data['balance'], data['package'],
        //         data['packageStartedOn'], data['packageExpireOn']),
        //     Days(data['days']['days'], data['days']['currentday']));
        // print("returning");
        // print(account.days!.currentday);

        return response.data;
      }
    } on DioError catch (e) {
      print(e.response);
    }
  }

  getter() {
    notifyListeners();
    return account();
  }
}
