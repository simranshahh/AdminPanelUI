// ignore_for_file: file_names, avoid_print

import 'package:flutter/material.dart';

import '../../Services/app_navigator_service.dart';
import '../../Services/basedio.dart';
import '../../config/my_config.dart';
import '../interface/verifyinterface.dart';
import '../models/Varifymodel.dart';

class VerifyRepository implements IVerifyRepository {
  @override
  Future<Verify?> verify(String id, BuildContext context) async {
    var data = {
      "id": id,
    };

    try {
      var response = await Api().post(MyConfig.verify, data: data);

      if (response.statusCode == 200) {
        print(response.data);
        // AppNavigatorService.pushNamedAndRemoveUntil("homepage");
      }
    } catch (e) {
      print(e.toString());
    }
    return null;
  }
}
