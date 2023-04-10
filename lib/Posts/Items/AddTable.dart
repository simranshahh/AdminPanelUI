// ignore_for_file: prefer_const_constructors, unused_local_variable, file_names

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../constants/color_constants.dart';

class AddTable extends ConsumerStatefulWidget {
  const AddTable({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AddTableState();
}

class _AddTableState extends ConsumerState<AddTable> {
  final DataTableSource _data = MyData();

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: secondaryColor,
      body: SizedBox(
        child: Center(
          child: Theme(
            data: Theme.of(context).copyWith(
              cardColor: Color.fromARGB(255, 57, 57, 57),
              inputDecorationTheme: InputDecorationTheme(
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white)),
                labelStyle: TextStyle(color: Colors.white, fontSize: 24.0),
              ),
              dividerColor: Color.fromARGB(255, 76, 75, 75),
            ),
            child: PaginatedDataTable(
              source: _data,
              header: Text(
                'Image',
                style: TextStyle(color: Colors.white),
              ),
              columns: const [
                DataColumn(
                  label: Text(
                    'Details',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                DataColumn(
                    label: Text(
                  'Date',
                  style: TextStyle(color: Colors.white),
                )),
                DataColumn(
                    label: Text(
                  ' Modified_By',
                  style: TextStyle(color: Colors.white),
                )),
              ],
              columnSpacing: 200,
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
  // Generate some made-up data
  final List<Map<String, dynamic>> _data = List.generate(
      150,
      (index) => {
            "Image": index,
            "Details": Random().nextInt(35000),
            "Date": Random().nextInt(35000),
            "Modified_By": Random().nextInt(35000),
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
            _data[index]['Image'].toString(),
            style: TextStyle(color: Colors.white),
          )),
          DataCell(Text(
            _data[index]["Details"].toString(),
            style: TextStyle(color: Colors.white),
          )),
          DataCell(Text(
            _data[index]["Date"].toString(),
            style: TextStyle(color: Colors.white),
          )),
          DataCell(Text(
            _data[index]["Modified_By"].toString(),
            style: TextStyle(color: Colors.white),
          )),
        ]);
  }
}
