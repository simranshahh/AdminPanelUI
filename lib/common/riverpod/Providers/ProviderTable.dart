// ignore_for_file: avoid_print, file_names

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pluto_grid/pluto_grid.dart';

import '../../Services/basedio.dart';
import '../../config/my_config.dart';
import '../models/customerprofile.dart';

class ProviderTable extends ConsumerStatefulWidget {
  const ProviderTable({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ProviderTableState();
}

class _ProviderTableState extends ConsumerState<ProviderTable> {
  // final List<PlutoColumn> columns = <PlutoColumn>[
  //   PlutoColumn(
  //     title: ' Id',
  //     field: ' Id',
  //     type: PlutoColumnType.text(),
  //     frozen: PlutoColumnFrozen.start,
  //     renderer: (rendererContext) {
  //       return Row(
  //         children: [
  //           IconButton(
  //             icon: const Icon(
  //               Icons.remove_circle_outlined,
  //             ),
  //             onPressed: () {
  //               rendererContext.stateManager.removeRows([rendererContext.row]);
  //             },
  //             iconSize: 18,
  //             color: Colors.red,
  //             padding: const EdgeInsets.all(0),
  //           ),
  //           Expanded(
  //             child: Text(
  //               rendererContext.row.cells[rendererContext.column.field]!.value
  //                   .toString(),
  //               maxLines: 1,
  //               overflow: TextOverflow.ellipsis,
  //             ),
  //           ),
  //         ],
  //       );
  //     },
  //   ),
  //   PlutoColumn(
  //     title: 'Name',
  //     field: 'name',
  //     type: PlutoColumnType.text(),
  //   ),
  //   PlutoColumn(
  //     title: 'E-mail',
  //     field: 'E-mail',
  //     type: PlutoColumnType.number(),
  //   ),
  //   PlutoColumn(
  //     title: 'Role',
  //     field: 'role',
  //     type: PlutoColumnType.select(<String>[
  //       'Programmer',
  //       'Designer',
  //       'Owner',
  //     ]),
  //   ),
  //   PlutoColumn(
  //     title: 'Joined Date',
  //     field: 'joined Date',
  //     type: PlutoColumnType.date(),
  //   ),
  //   PlutoColumn(
  //     title: 'Working time',
  //     field: 'working_time',
  //     type: PlutoColumnType.time(),
  //   ),
  //   PlutoColumn(
  //     // renderer: ,
  //     title: 'Image',
  //     field: 'Image',
  //     type: PlutoColumnType.text(),
  //     // renderer: (rendererContext) {
  //     //   if (rendererContext.cell.value != '') {
  //     //     Uint8List bytes =
  //     //         (base64Decode(rendererContext.cell.value.toString()));
  //     //     return Image.memory(bytes);
  //     //   } else {
  //     //     return const Text('');
  //     //   }
  //     // }
  //     //    PlutoColumnType.text: (cell) => Image.network(cell.value),,

  //     footerRenderer: (rendererContext) {
  //       return PlutoAggregateColumnFooter(
  //         rendererContext: rendererContext,
  //         formatAsCurrency: true,
  //         type: PlutoAggregateColumnType.sum,
  //         format: '#,###',
  //         alignment: Alignment.center,
  //         titleSpanBuilder: (text) {
  //           return [
  //             const TextSpan(
  //               text: 'Sum',
  //               style: TextStyle(color: Colors.red),
  //             ),
  //             const TextSpan(text: ' : '),
  //             TextSpan(text: text),
  //           ];
  //         },
  //       );
  //     },
  //   ),
  // ];

  // final List<PlutoRow> rows = [
  //   PlutoRow(
  //     cells: {
  //       ' Id': PlutoCell(value: 'user1'),
  //       'name': PlutoCell(value: 'Mike'),
  //       'E-mail': PlutoCell(value: 20),
  //       'role': PlutoCell(value: 'Programmer'),
  //       'joined Date': PlutoCell(value: '2021-01-01'),
  //       'working_time': PlutoCell(value: '09:00'),
  //       'Image': PlutoCell(
  //           value:
  //               'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQdzUoWkAdvq-da_c3oJsLYQnLubACACmn-Cw&usqp=CAU'),
  //     },
  //   ),
  //   PlutoRow(
  //     cells: {
  //       ' Id': PlutoCell(value: 'user2'),
  //       'name': PlutoCell(value: 'Jack'),
  //       'E-mail': PlutoCell(value: 25),
  //       'role': PlutoCell(value: 'Designer'),
  //       'joined Date': PlutoCell(value: '2021-02-01'),
  //       'working_time': PlutoCell(value: '10:00'),
  //       'Image': PlutoCell(
  //           value:
  //               'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQdzUoWkAdvq-da_c3oJsLYQnLubACACmn-Cw&usqp=CAU'),
  //     },
  //   ),
  //   PlutoRow(
  //     cells: {
  //       ' Id': PlutoCell(value: 'user3'),
  //       'name': PlutoCell(value: 'Suzi'),
  //       'E-mail': PlutoCell(value: 40),
  //       'role': PlutoCell(value: 'Owner'),
  //       'joined Date': PlutoCell(value: '2021-03-01'),
  //       'working_time': PlutoCell(value: '11:00'),
  //       'Image': PlutoCell(
  //           value:
  //               'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQdzUoWkAdvq-da_c3oJsLYQnLubACACmn-Cw&usqp=CAU'),
  //     },
  //   ),
  // ];

  // /// columnGroups that can group columns can be omitted.
  // final List<PlutoColumnGroup> columnGroups = [
  //   PlutoColumnGroup(title: ' Id', fields: [' Id'], expandedColumn: true),
  //   PlutoColumnGroup(title: 'User information', fields: ['name', 'E-mail']),
  //   PlutoColumnGroup(title: 'Status', children: [
  //     PlutoColumnGroup(title: 'A', fields: ['role'], expandedColumn: true),
  //     PlutoColumnGroup(title: 'Visitors.', fields: ['Visit Only', 'Orders']),
  //   ]),
  // ];

  /// [PlutoGridStateManager] has many methods and properties to dynamically manipulate the grid.
  /// You can manipulate the grid dynamically at runtime by passing this through the [onLoaded] callback.
  late final PlutoGridStateManager stateManager;
  bool apiValue = false;
  Color? getCellColor(String field) {
    if (field == 'column1' && apiValue == false) {
      return Colors.red;
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return SizedBox(
      height: height * 0.55,
      child: FutureBuilder(
        future: customerinfo(),
        builder: (ctx, snapshot) {
          if (snapshot.hasData) {
            CInfo? data = snapshot.data;
            return PlutoGrid(
              columns: [
                PlutoColumn(
                  title: 'Id',
                  field: 'Id',
                  type: PlutoColumnType.text(),
                  frozen: PlutoColumnFrozen.start,
                  renderer: (rendererContext) {
                    return Row(
                      children: [
                        IconButton(
                          icon: const Icon(
                            Icons.remove_circle_outlined,
                          ),
                          onPressed: () {
                            rendererContext.stateManager
                                .removeRows([rendererContext.row]);
                          },
                          iconSize: 18,
                          color: Colors.red,
                          padding: const EdgeInsets.all(0),
                        ),
                        Expanded(
                          child: Text(
                            rendererContext
                                .row.cells[rendererContext.column.field]!.value
                                .toString(),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    );
                  },
                ),
                PlutoColumn(
                  title: 'Name',
                  field: 'name',
                  type: PlutoColumnType.text(),
                ),
                PlutoColumn(
                  title: 'E-mail',
                  field: 'E-mail',
                  type: PlutoColumnType.text(),
                ),
                PlutoColumn(
                  title: 'Role',
                  field: 'role',
                  type: PlutoColumnType.text(),
                  //   <
                  // String>[
                  //   'Programmer',
                  //   'Designer',
                  //   'Owner',
                  // ]),
                ),
                PlutoColumn(
                  title: 'Joined Date',
                  field: 'joined Date',
                  type: PlutoColumnType.text(),
                ),
                // PlutoColumn(
                //   title: 'Working time',
                //   field: 'working_time',
                //   type: PlutoColumnType.time(),
                // ),
                PlutoColumn(
                  title: 'Image',
                  field: 'Image',
                  type: PlutoColumnType.text(),
                  footerRenderer: (rendererContext) {
                    return PlutoAggregateColumnFooter(
                      rendererContext: rendererContext,
                      formatAsCurrency: true,
                      type: PlutoAggregateColumnType.sum,
                      format: '#,###',
                      alignment: Alignment.center,
                      titleSpanBuilder: (text) {
                        return [
                          const TextSpan(
                            text: 'Sum',
                            style: TextStyle(color: Colors.red),
                          ),
                          const TextSpan(text: ' : '),
                          TextSpan(text: text),
                        ];
                      },
                    );
                  },
                ),
                PlutoColumn(
                  title: 'Approved',
                  field: 'approved',
                  type: PlutoColumnType.text(),
                  frozen: PlutoColumnFrozen.end,
                  renderer: (rendererContext) {
                    return Row(
                      children: [
                        IconButton(
                          icon: const Icon(
                            Icons.task_alt,
                          ),
                          onPressed: () {
                            // rendererContext.stateManager
                            //     .([rendererContext.row]);
                          },
                          iconSize: 18,
                          color: data!.verified == false
                              ? Colors.red
                              : Colors.green,
                          padding: const EdgeInsets.all(0),
                        ),
                        Expanded(
                          child: Text(
                            rendererContext
                                .row.cells[rendererContext.column.field]!.value
                                .toString(),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: data.verified == false
                                  ? Colors.red
                                  : Colors.green,
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ],
              rows: [
                PlutoRow(
                  cells: {
                    'Id': PlutoCell(value: data!.id.toString()),
                    'name': PlutoCell(value: data.fullName.toString()),
                    'E-mail': PlutoCell(value: data.email.toString()),
                    'role': PlutoCell(value: data.role!.name),
                    'joined Date': PlutoCell(value: data.cordinates.toString()),
                    'Image': PlutoCell(value: data.picture.toString()),
                    'approved': PlutoCell(value: data.verified.toString()),
                  },
                ),
              ],
              onLoaded: (PlutoGridOnLoadedEvent event) {
                event.stateManager.setShowColumnFilter(true);
              },
              onChanged: (PlutoGridOnChangedEvent event) {
                print(event);
              },
              configuration: const PlutoGridConfiguration(),
            );
          } else if (snapshot.hasError) {
            return Text(snapshot.hasError.toString());
          }
          // By default, show a loading spinner.
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const <Widget>[
                CircularProgressIndicator(),
                SizedBox(height: 20),
                Text('This may take some time..')
              ],
            ),
          );
        },
      ),
    );
  }

  Future<CInfo?> customerinfo() async {
    try {
      var response = await Api().get(MyConfig.cusinfo);

      var a = json.decode(response.toString());
      print(response.statusCode);
      if (response.statusCode == 200) {
        var responsedata = json.decode(response.data)["user"];
        print(responsedata);
        //  await setString(userId, a['email']["password"].toString());
        print(response.data);
        var data = CInfo.fromJson(responsedata);
        return data;
        // AppNavigatorService.pushNamedAndRemoveUntil("Signin");
      }
    } catch (e) {
      print(e.toString());
    }
    return null;
  }
}
//     Container(
//       height: height,
//       padding: const EdgeInsets.all(15),
//       child: PlutoGrid(
//         columns: columns,
//         rows: rows,
//         columnGroups: columnGroups,
//         onLoaded: (PlutoGridOnLoadedEvent event) {
//           stateManager = event.stateManager;
//           stateManager.setShowColumnFilter(true);
//         },
//         onChanged: (PlutoGridOnChangedEvent event) {
//           print(event);
//         },
//         configuration: const PlutoGridConfiguration(),
//       ),
//     );
//   }
// }