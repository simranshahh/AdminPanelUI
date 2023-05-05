// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:pluto_grid/pluto_grid.dart';

import '../../../common/Services/basedio.dart';
import '../../../common/config/my_config.dart';
import '../../../common/riverpod/models/Allbooking_model.dart';
import '../../../constants/color_constants.dart';

class AllBookingsTable extends StatefulWidget {
  const AllBookingsTable({Key? key}) : super(key: key);

  @override
  State<AllBookingsTable> createState() => _AllBookingsTableState();
}

class _AllBookingsTableState extends State<AllBookingsTable> {
  List<Booking> data = [];
  allBooking() async {
    try {
      var response = await Api().get(MyConfig.allbookings);

      print(response.statusCode);
      if (response.statusCode == 200) {
        List<dynamic> jsonResponse = json.decode(response.data)["bookings"];

        setState(() {
          data = jsonResponse.map((e) => Booking.fromJson(e)).toList();
        });
      }
    } catch (e) {
      print(e.toString());
    }
    List<Booking> b = [];
    return b;
  }

  @override
  void initState() {
    super.initState();
    allBooking();
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
            inputDecorationTheme: const InputDecorationTheme(
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white)),
              labelStyle: TextStyle(color: Colors.white, fontSize: 24.0),
            ),
            dividerColor: const Color.fromARGB(255, 76, 75, 75),
          ),
          child: PaginatedDataTable(
            source: MyData(data),
            header: const Text(
              'Booking Details',
            ),
            columns: const [
              DataColumn(
                label: Text(
                  'ID',
                ),
              ),
              DataColumn(
                label: Text(
                  'Customer Name',
                ),
              ),
              DataColumn(
                  label: Text(
                'Service Provider Name',
              )),
              DataColumn(
                  label: Text(
                'Description',
              )),
              DataColumn(
                  label: Text(
                'Date',
              )),
              DataColumn(
                  label: Text(
                'Time',
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
    );
  }
}

class MyData extends DataTableSource {
  final List<Booking> data;
  MyData(this.data);

  @override
  bool get isRowCountApproximate => false;
  @override
  int get rowCount => data.length;
  @override
  int get selectedRowCount => 0;
  @override
  DataRow getRow(int index) {
    final Booking result = data[index];

    return DataRow.byIndex(index: index, cells: <DataCell>[
      DataCell(Text('${index + 1}')),
      DataCell(Text(result.user.toString())),
      DataCell(Text(result.service.toString())),
      DataCell(Text(result.note.toString())),
      DataCell(Text(result.date.toString())),
      DataCell(Text(result.time.toString())),
      DataCell(Text(result.status.toString())),
    ]);
  }
}
