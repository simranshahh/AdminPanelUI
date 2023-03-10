// ignore_for_file: prefer_const_constructors, unused_local_variable

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../constants/color_constants.dart';

class RecentOpenPositions extends ConsumerStatefulWidget {
  const RecentOpenPositions({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _RecentOpenPositionsState();
}

class _RecentOpenPositionsState extends ConsumerState<RecentOpenPositions> {
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
              DataColumn(label: Text('Position')),
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
            "Position": "Position $index",
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
        color: MaterialStateColor.resolveWith((states) => Colors.blue),
        cells: [
          DataCell(Text(_data[index]["Position"])),
          DataCell(Text(_data[index]["Registration_Date"].toString())),
          DataCell(Text(_data[index]["Status"].toString())),
        ]);
  }
}
