import 'package:dio/dio.dart';

class Http {
  Dio dio = Dio(BaseOptions(
      baseUrl: "https://peaceful-kobuk-valley-48294.herokuapp.com/"));

  Future getRequest({
    required String urlPath,
    Map<String, dynamic> data = const {},
    Map<String, dynamic> header = const {},
  }) async {
    return await dio.get(
      urlPath,
      queryParameters: data,
      options: Options(
        headers: header,
      ),
    );
  }

  Future postRequest({
    required String urlPath,
    Map<String, dynamic> data = const {},
    Map<String, dynamic> header = const {},
  }) async {
    return await dio.post(urlPath,
        data: data, options: Options(headers: header));
  }
}
