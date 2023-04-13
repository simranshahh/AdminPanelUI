// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:pluto_grid/pluto_grid.dart';

class AllBookingsTable extends StatefulWidget {
  const AllBookingsTable({Key? key}) : super(key: key);

  @override
  State<AllBookingsTable> createState() => _AllBookingsTableState();
}

class _AllBookingsTableState extends State<AllBookingsTable> {
  final List<PlutoColumn> columns = <PlutoColumn>[
    PlutoColumn(
      title: 'Booking Id',
      field: 'Booking Id',
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
                rendererContext.stateManager.removeRows([rendererContext.row]);
              },
              iconSize: 18,
              color: Colors.red,
              padding: const EdgeInsets.all(0),
            ),
            Expanded(
              child: Text(
                rendererContext.row.cells[rendererContext.column.field]!.value
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
      title: 'Booking Category',
      field: 'Booking Category',
      type: PlutoColumnType.text(),
    ),
    PlutoColumn(
      title: 'Category Type',
      field: 'Category Type',
      type: PlutoColumnType.text(),
    ),
    PlutoColumn(
      title: 'User',
      field: 'User',
      type: PlutoColumnType.select(<String>[
        'Programmer',
        'Designer',
        'Owner',
      ]),
    ),
    PlutoColumn(
      title: 'Date',
      field: 'Date',
      type: PlutoColumnType.date(),
    ),
    PlutoColumn(
      title: 'Time',
      field: 'Time',
      type: PlutoColumnType.time(),
    ),
    PlutoColumn(
      title: 'Provider',
      field: 'Provider',
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
  ];

  final List<PlutoRow> rows = [
    PlutoRow(
      cells: {
        'Booking Id': PlutoCell(value: 'user1'),
        'Booking Category': PlutoCell(value: 'Plumber'),
        'Category Type': PlutoCell(value: 'Fit washroom taps'),
        'User': PlutoCell(value: 'Hari'),
        'Date': PlutoCell(value: '2021-01-01'),
        'Time': PlutoCell(value: '09:00'),
        'Provider': PlutoCell(value: 'Manoj'),
      },
    ),
    PlutoRow(
      cells: {
        'Booking Id': PlutoCell(value: 'user2'),
        'Booking Category': PlutoCell(value: 'Carpenter'),
        'Category Type': PlutoCell(value: 'Mend Chair and Desk'),
        'User': PlutoCell(value: 'Daya'),
        'Date': PlutoCell(value: '2021-02-01'),
        'Time': PlutoCell(value: '10:00'),
        'Provider': PlutoCell(value: 'sita'),
      },
    ),
    PlutoRow(
      cells: {
        'Booking Id': PlutoCell(value: 'user3'),
        'Booking Category': PlutoCell(value: 'Electrician'),
        'Category Type': PlutoCell(value: 'Fit the bulb Cable'),
        'User': PlutoCell(value: 'Sana'),
        'Date': PlutoCell(value: '2021-03-01'),
        'Time': PlutoCell(value: '11:00'),
        'Provider': PlutoCell(value: 'Kartik'),
      },
    ),
  ];

  /// columnGroups that can group columns can be omitted.
  final List<PlutoColumnGroup> columnGroups = [
    PlutoColumnGroup(
        title: 'Booking Id', fields: ['Booking Id'], expandedColumn: true),
    PlutoColumnGroup(
        title: 'Category', fields: ['Booking Category', 'Category Type']),
    PlutoColumnGroup(title: 'Detail Information', children: [
      PlutoColumnGroup(title: 'User', fields: ['User'], expandedColumn: true),
      PlutoColumnGroup(title: 'Order Details.', fields: ['Date', 'Time']),
    ]),
  ];

  /// [PlutoGridStateManager] has many methods and properties to dynamically manipulate the grid.
  /// You can manipulate the grid dynamically at runtime by passing this through the [onLoaded] callback.
  late final PlutoGridStateManager stateManager;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(15),
        child: PlutoGrid(
          columns: columns,
          rows: rows,
          columnGroups: columnGroups,
          onLoaded: (PlutoGridOnLoadedEvent event) {
            stateManager = event.stateManager;
            stateManager.setShowColumnFilter(true);
          },
          onChanged: (PlutoGridOnChangedEvent event) {
            print(event);
          },
          configuration: const PlutoGridConfiguration(),
        ),
      ),
    );
  }
}
