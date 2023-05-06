// ignore_for_file: prefer_const_constructors, unused_local_variable

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../common/Services/basedio.dart';
import '../../common/config/my_config.dart';
import '../../common/riverpod/models/AllrolesModel.dart';
import '../../constants/color_constants.dart';

class RecentOpenPositions extends ConsumerStatefulWidget {
  const RecentOpenPositions({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _RecentOpenPositionsState();
}

class _RecentOpenPositionsState extends ConsumerState<RecentOpenPositions> {
  List<Roles> data = [];
  allRoles() async {
    try {
      var response = await Api().get(MyConfig.allroles);
      print(response.statusCode);
      if (response.statusCode == 200) {
        // Map<String, dynamic> responsedata = json.decode(response.data);
        // print(responsedata);
        // List<dynamic> data = responsedata["roles"];
        // return data.map((e) => Roles.fromJson(e)).toList();
        List<dynamic> jsonResponse = json.decode(response.data)["roles"];
        print(jsonResponse);
        setState(() {
          data = jsonResponse.map((data) => Roles.fromJson(data)).toList();
        });
      }
    } catch (e) {
      print(e.toString());
    }
    List<Roles> b = [];
    return b;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    allRoles();
  }

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
              // cardColor: Color.fromARGB(255, 57, 57, 57),
              inputDecorationTheme: InputDecorationTheme(
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white)),
                labelStyle: TextStyle(
                    // color: Colors.white,
                    fontSize: 24.0),
              ),
              dividerColor: Color.fromARGB(255, 76, 75, 75),
            ),
            child: PaginatedDataTable(
              
              source: MyData(data, setState),
              header: Text(
                'Recent Open Positions',
                // style: TextStyle(color: Colors.white),
              ),
              columns: const [
                DataColumn(
                  label: Text(
                    'ID',
                    // style: TextStyle(color: Colors.white),
                  ),
                ),
                DataColumn(
                    label: Text(
                  'Position',
                  // style: TextStyle(color: Colors.white),
                )),
                // DataColumn(
                //     label: Text(
                //   'Registration_Date',
                //   // style: TextStyle(color: Colors.white),
                // )),
                DataColumn(
                    label: Text(
                  'Status',
                  // style: TextStyle(color: Colors.white),
                )),
                DataColumn(label: Text('Delete')),
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
  final List<Roles> data;
  final Function _setState;
  MyData(this.data, this._setState);

  // // Generate some made-up data
  // final List<Map<String, dynamic>> _data = List.generate(
  //     150,
  //     (index) => {
  //           "id": index,
  //           "position": Random().nextInt(35000),
  //           // "Registration_Date": Random().nextInt(35000),
  //           "Status": Random().nextInt(35000),
  //         });
  void delete(int index) {
    data.removeAt(index);
    notifyListeners();
  }

  void state(int index){
   
  }

  // bool status = false;
  final ValueNotifier<bool> _buttonState = ValueNotifier<bool>(false);

  @override
  bool get isRowCountApproximate => false;
  @override
  int get rowCount => data.length;
  @override
  int get selectedRowCount => 0;
  @override
  DataRow getRow(int index) {
    final Roles result = data[index];
    return DataRow.byIndex(index: index, cells: <DataCell>[
      DataCell(Text('${index + 1}')),
      DataCell(Text(result.name.toString())),
      DataCell(
        ValueListenableBuilder(
          valueListenable: _buttonState,
          builder: (context, bool value, child) {
            return ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: value == true ? Colors.green : Colors.red,
                    shape: StadiumBorder() // Background color
                    ),
                child: Text(value ? 'On' : 'Off'),
                onPressed: () {
                  _buttonState.value = !_buttonState.value;
                  print(_buttonState.value);
                });
          },
        ),
     
      ),
      DataCell(
        IconButton(
          icon: Icon(
            Icons.delete,
            color: Colors.red,
          ),
          onPressed: () => delete(index),
        ),
      )
    ]);
  }
}
