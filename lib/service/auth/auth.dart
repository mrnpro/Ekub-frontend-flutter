import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:ekub/model/data/Request/request.dart';

import 'package:ekub/model/data/user/user.dart';
import 'package:ekub/service/http.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class Auth extends http {
  final storage = FlutterSecureStorage();
  Future signin(User user) async {
    Response response =
        await postRequest(urlPath: 'auth/login', data: user.toJson());
    if (response.statusCode == 200) {
      log(response.data['token']);
      storeJwt(response.data['token']);
    }
    return response;
  }

  Future signup(User user) async {
    Response response =
        await postRequest(urlPath: 'auth/register', data: user.toJson());
    log(response.data['token']);
    storeJwt(response.data['token']);
    return response;
  }

  storeJwt(String token) async {
    log("signing");
    await storage.write(key: "auth", value: token);
    print(await storage.read(key: "auth"));
  }

  Future singinWithToken() async {
    final token = await storage.read(key: "auth");

    Response response = await postRequest(
        urlPath: 'auth/login', header: Request(token.toString()).toJson());

    return response;
  }
}
