// ignore_for_file: prefer_const_constructors, unused_local_variable

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../constants/color_constants.dart';

class InfoTable extends ConsumerStatefulWidget {
  const InfoTable({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _InfoTableState();
}

class _InfoTableState extends ConsumerState<InfoTable> {
  final DataTableSource _data = MyData();

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: secondaryColor,
      body: Center(
        child: Theme(
          data: Theme.of(context).copyWith(
            cardColor: Color.fromARGB(255, 230, 228, 228),
            dividerColor: Color.fromARGB(255, 76, 75, 75),
          ),
          child: PaginatedDataTable(
            source: _data,
            header: const Center(child: Text('Recent Candidates')),
            columns: const [
              DataColumn(
                label: Text(
                  'ID',
                ),
              ),
              DataColumn(label: Text('Name')),
              DataColumn(label: Text('Position')),
              DataColumn(label: Text('PAN_No.')),
              DataColumn(label: Text('Email')),
              DataColumn(label: Text('Registration_Date')),
              DataColumn(label: Text('Status')),
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
  // Generate some made-up data
  final List<Map<String, dynamic>> _data = List.generate(
      150,
      (index) => {
            "id": index,
            "title": "Item $index",
            "price": Random().nextInt(35000),
            "PAN_No": Random().nextInt(35000),
            "Email": Random().nextInt(35000),
            "Registration_Date": Random().nextInt(35000),
            "Status": Random().nextInt(35000),
          });

  @override
  bool get isRowCountApproximate => false;
  @override
  int get rowCount => _data.length;
  @override
  int get selectedRowCount => 0;
  @override
  DataRow getRow(int index) {
    return DataRow(
        // color: MaterialStateColor.resolveWith((states) => Colors.blue),
        cells: [
          DataCell(Text(
            _data[index]['id'].toString(),
            // style: TextStyle(color: Colors.white),
          )),
          DataCell(Text(_data[index]["title"])),
          DataCell(Text(_data[index]["price"].toString())),
          DataCell(Text(_data[index]["PAN_No"].toString())),
          DataCell(Text(_data[index]["Email"].toString())),
          DataCell(Text(_data[index]["Registration_Date"].toString())),
          DataCell(Text(_data[index]["Status"].toString())),
        ]);
  }
}
