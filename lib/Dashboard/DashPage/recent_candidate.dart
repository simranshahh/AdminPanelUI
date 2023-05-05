// ignore_for_file: prefer_const_constructors, unused_local_variable

import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../common/Services/basedio.dart';
import '../../common/config/my_config.dart';
import '../../common/riverpod/models/AllCustomer_model.dart';
import '../../common/riverpod/repository/AdminRepository.dart';
import '../../constants/color_constants.dart';

class InfoTable extends ConsumerStatefulWidget {
  const InfoTable({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _InfoTableState();
}

class _InfoTableState extends ConsumerState<InfoTable> {
  List<Customer> data = [];
  allcustomer() async {
    try {
      var response = await Api().get(MyConfig.allcustomer);
      print(response.statusCode);
      if (response.statusCode == 200) {
        List<dynamic> jsonResponse = json.decode(response.data)["customers"];

        setState(() {
          data = jsonResponse.map((e) => Customer.fromJson(e)).toList();
        });
      }
    } catch (e) {
      print(e.toString());
    }
    List<Customer> b = [];
    return b;
  }

  @override
  void initState() {
    super.initState();
    allcustomer();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: secondaryColor,
      body: Center(
        child: Theme(
          data: Theme.of(context).copyWith(
            inputDecorationTheme: InputDecorationTheme(
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white)),
              labelStyle: TextStyle(color: Colors.white, fontSize: 24.0),
            ),
            dividerColor: Color.fromARGB(255, 76, 75, 75),
          ),
          child: PaginatedDataTable(
            source: MyData(data),
            header: Text(
              'Recent Candidates',
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
                'Phone',
              )),
            ],
            columnSpacing: 90,
            horizontalMargin: 60,
            rowsPerPage: 8,
          ),
        ),
      ),
    );
  }
}

class MyData extends DataTableSource {
  final List<Customer> data;
  MyData(this.data);

  @override
  bool get isRowCountApproximate => false;
  @override
  int get rowCount => data.length;
  @override
  int get selectedRowCount => 0;
  @override
  DataRow getRow(int index) {
    final Customer result = data[index];

    return DataRow.byIndex(index: index, cells: <DataCell>[
      DataCell(Text('${index + 1}')),
      DataCell(Text(result.fullName.toString())),
      DataCell(Text(result.email.toString())),
      DataCell(Text(result.address.toString())),
      DataCell(Text(result.phone.toString())),
    ]);
  }
}
