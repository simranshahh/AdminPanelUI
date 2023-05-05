// ignore_for_file: file_names, avoid_print

import 'dart:convert';

import 'package:adminpannel/common/riverpod/models/Allbooking_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../Services/basedio.dart';
import '../../config/my_config.dart';
import '../models/AllCustomer_model.dart';
import '../models/AllServiceProvider_model.dart';
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

  // Future<List<Customer>> allcustomer() async {
  //   try {
  //     var response = await Api().get(MyConfig.allcustomer);
  //     print(response.statusCode);
  //     if (response.statusCode == 200) {
  //       Map<String, dynamic> responsedata = json.decode(response.data);
  //       List<dynamic> data = responsedata["customers"];
  //       return data.map((e) => Customer.fromJson(e)).toList();
  //     }
  //   } catch (e) {
  //     print(e.toString());
  //   }
  //   List<Customer> b = [];
  //   return b;
  // }

  // Future<List<Booking>> allbookings() async {
  //   try {
  //     var response = await Api().get(MyConfig.allbookings);
  //     print(response.statusCode);
  //     if (response.statusCode == 200) {
  //       Map<String, dynamic> responsedata = json.decode(response.data);
  //       List<dynamic> data = responsedata["bookings"];
  //       return data.map((e) => Booking.fromJson(e)).toList();
  //     }
  //   } catch (e) {
  //     print(e.toString());
  //   }
  //   List<Booking> b = [];
  //   return b;
  // }
}
//   Future<List<SProvider>> allserviceprovider() async {
//     try {
//       var response = await Api().get(MyConfig.allserviceprovider);
//       print(response.statusCode);
//       if (response.statusCode == 200) {
//         Map<String, dynamic> responsedata = json.decode(response.data);
//         List<dynamic> data = responsedata["providers"];
//         return data.map((e) => SProvider.fromJson(e)).toList();
//       }
//     } catch (e) {
//       print(e.toString());
//     }
//     List<SProvider> b = [];
//     return b;
//   }
// }

final customerRepositoryProvider =
    Provider<AdminRepository>((ref) => AdminRepository());

final allrolesprovider = FutureProvider.autoDispose<List<Roles>>(
  (ref) async {
    return ref.read(customerRepositoryProvider).allRoles();
  },
);
// final allcustomerprovider = FutureProvider.autoDispose<List<Customer>>(
//   (ref) async {
//     return ref.read(customerRepositoryProvider).allcustomer();
//   },
// );
// final allbookingprovider = FutureProvider.autoDispose<List<Booking>>(
//   (ref) async {
//     return ref.read(customerRepositoryProvider).allbookings();
//   },
// );
// final allserviceprovider = FutureProvider.autoDispose<List<SProvider>>(
//   (ref) async {
//     return ref.read(customerRepositoryProvider).allserviceprovider();
//   },
// );
