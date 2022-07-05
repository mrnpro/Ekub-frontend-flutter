import 'package:dio/dio.dart';
import 'package:ekub/Navigator/navigate.dart';
import 'package:ekub/model/data/Request/request.dart';
import 'package:ekub/service/services.dart';
import 'package:ekub/wrapper/wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../../../common/toast.dart';
import '../../../../service/http/http.dart';

class CirclePackageButtons extends StatelessWidget {
  const CirclePackageButtons({
    Key? key,
    required this.pkg,
  }) : super(key: key);
  final String pkg;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        showDialog(
            barrierDismissible: false,
            context: context,
            builder: (context) {
              return const Center(
                child: SizedBox(
                    height: 30, width: 30, child: CircularProgressIndicator()),
              );
            });
        final token = await const FlutterSecureStorage().read(key: 'auth');
        try {
          Response response = await Http().postRequest(
              urlPath: 'choosePackage/${pkg}',
              header: Request(token.toString()).toJson());
          Navigate.neverReturn(context, Wrapper());

          CToast.show(false, response.data['msg']);

          Services().getter();
        } on DioError catch (e) {
          print(e.response);
          CToast.show(true, e.response.toString());
          Navigate.neverReturn(context, Wrapper());
        }
      },
      child: Container(
        margin: const EdgeInsets.all(10),
        child: CircleAvatar(
          radius: 25,
          child: Text(pkg),
        ),
      ),
    );
  }
}
