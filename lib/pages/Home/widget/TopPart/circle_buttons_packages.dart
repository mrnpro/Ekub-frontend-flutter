import 'package:dio/dio.dart';
import 'package:ekub/model/data/Request/request.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../../../common/toast.dart';
import '../../../../service/http/http.dart';

class CirclePackageButtons extends StatefulWidget {
  const CirclePackageButtons({
    Key? key,
    required this.pkg,
  }) : super(key: key);
  final String pkg;

  @override
  State<CirclePackageButtons> createState() => _circlePackageButtonsState();
}

class _circlePackageButtonsState extends State<CirclePackageButtons> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        showDialog(
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
              urlPath: 'choosePackage/${widget.pkg}',
              header: Request(token.toString()).toJson());
          Navigator.pop(context);

          CToast.show(false, response.data['msg']);
          setState(() {});
        } on DioError catch (e) {
          print(e.response);
          CToast.show(true, e.response.toString());
          Navigator.pop(context);
        }
      },
      child: Container(
        margin: const EdgeInsets.all(10),
        child: CircleAvatar(
          radius: 25,
          child: Text(widget.pkg),
        ),
      ),
    );
  }
}
