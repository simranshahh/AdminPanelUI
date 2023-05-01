// ignore_for_file: file_names, avoid_print

import 'dart:convert';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../Services/basedio.dart';
import '../../config/my_config.dart';
import '../models/AllrolesModel.dart';

class AdminRepository {
  Future<List<Roles>> allRoles() async {
    try {
      var response = await Api().get(MyConfig.allroles);
      print(response.statusCode);
      if (response.statusCode == 200) {
        Map<String, dynamic> responsedata = json.decode(response.data);
        List<dynamic> data = responsedata["roles"];
        return data.map((e) => Roles.fromJson(e)).toList();
      }
    } catch (e) {
      print(e.toString());
    }
    List<Roles> b = [];
    return b;
  }
}

final customerRepositoryProvider =
    Provider<AdminRepository>((ref) => AdminRepository());

final allrolesprovider = FutureProvider.autoDispose<List<Roles>>(
  (ref) async {
    return ref.read(customerRepositoryProvider).allRoles();
  },
);
