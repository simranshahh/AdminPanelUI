// ignore_for_file: avoid_print, file_names

import 'dart:convert';

import 'package:adminpannel/common/helper/constants.dart';
import 'package:adminpannel/common/riverpod/Providers/verifyprovider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../constants/color_constants.dart';
import '../../Services/basedio.dart';
import '../../config/my_config.dart';
import '../models/AllServiceProvider_model.dart';

class ProviderTable extends ConsumerStatefulWidget {
  const ProviderTable({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ProviderTableState();
}

class _ProviderTableState extends ConsumerState<ProviderTable> {
  List<SProvider> data = [];
  allSProvider() async {
    try {
      var response = await Api().get(MyConfig.allserviceprovider);

      print(response.statusCode);
      if (response.statusCode == 200) {
        List<dynamic> jsonResponse = json.decode(response.data)["providers"];

        setState(() {
          data = jsonResponse.map((e) => SProvider.fromJson(e)).toList();
        });
      }
    } catch (e) {
      print(e.toString());
    }
    List<SProvider> b = [];
    return b;
  }

  @override
  void initState() {
    super.initState();
    allSProvider();
  }

  final _verifyKey = GlobalKey<FormState>();
  // String id = getStringAsync(pId);
  // String i = '';
  // Future<void> verify(String i) async {
  //   // if (_verifyKey.currentState!.validate()) {
  //   ref.read(verifyNotifierProvider.notifier).Verify(i, context);
  //   // }
  // }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: secondaryColor,
      body: Center(
        child: Theme(
          data: Theme.of(context).copyWith(
            inputDecorationTheme: const InputDecorationTheme(
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white)),
              labelStyle: TextStyle(color: Colors.white, fontSize: 24.0),
            ),
            dividerColor: const Color.fromARGB(255, 76, 75, 75),
          ),
          child: Form(
            key: _verifyKey,
            child: PaginatedDataTable(
              source: MyData(
                  data,
                  ((id) => ref
                      .read(verifyNotifierProvider.notifier)
                      .Verify(id, context))),
              header: const Text(
                'Service Providers',
              ),
              columns: const [
                DataColumn(
                  label: Text(
                    'ID',
                  ),
                ),
                DataColumn(
                  label: Text(
                    'Name',
                  ),
                ),
                DataColumn(
                    label: Text(
                  'Email',
                )),
                DataColumn(
                    label: Text(
                  'Address',
                )),
                DataColumn(
                    label: Text(
                  'Role',
                )),
                DataColumn(
                    label: Text(
                  'Price',
                )),
                DataColumn(
                    label: Text(
                  'Phone',
                )),
                DataColumn(
                    label: Text(
                  'Status',
                )),
              ],
              columnSpacing: 90,
              horizontalMargin: 60,
              rowsPerPage: 8,
            ),
          ),
        ),
      ),
    );
  }
}

class MyData extends DataTableSource {
  final List<SProvider> data;
  final Function(String id) myfunction;
  MyData(this.data, this.myfunction);

  // final ValueNotifier<bool> _buttonState = ValueNotifier<bool>(false);

  @override
  bool get isRowCountApproximate => false;
  @override
  int get rowCount => data.length;
  @override
  int get selectedRowCount => 0;
  @override
  DataRow getRow(int index) {
    final SProvider result = data[index];
    final ValueNotifier<bool> buttonState =
        ValueNotifier<bool>(result.verified!);
    String idvalue;
    // String i = '';
    // Future<void> verify() async {
    //   // if (_verifyKey.currentState!.validate()) {
    //   ref.read(verifyNotifierProvider.notifier).Verify(i, context);
    //   // }
    // }

    return DataRow.byIndex(index: index, cells: <DataCell>[
      DataCell(Text('${index + 1}')),
      DataCell(Text(result.fullName.toString())),
      DataCell(Text(result.email.toString())),
      DataCell(Text(result.address.toString())),
      DataCell(Text(result.role.toString())),
      DataCell(Text(result.price.toString())),
      DataCell(Text(result.phone.toString())),
      DataCell(
        ValueListenableBuilder(
          valueListenable: buttonState,
          builder: (context, bool value, child) {
            return ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: value == true ? Colors.green : Colors.red,
                    shape: const StadiumBorder() // Background color
                    ),
                child: Text(value == false ? 'Verify' : 'Approved'),
                onPressed: () {
                  buttonState.value = !buttonState.value;
                  idvalue = result.id!;
                  // setValue(pId, idvalue);
                  // print(pId);
                  print(idvalue);
                  print(result.id);
                  myfunction(idvalue);
                  print(myfunction);

                  print(buttonState.value);
                });
          },
        ),
      )
    ]);
  }
}
