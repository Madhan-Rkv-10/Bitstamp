import 'package:bitsnap/src/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class DataTableExample extends HookConsumerWidget {
  const DataTableExample({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var columns = ['BID PRICE', 'QTY', 'QTY', 'ASK PRICE'];

    return DataTable(
      horizontalMargin: 8,
      columnSpacing: 25,
      columns: getColumns(columns, context),
      rows: const <DataRow>[
        DataRow(
          cells: <DataCell>[
            DataCell(Text('23769.00')),
            DataCell(Text('0.5788723')),
            DataCell(Text('0.5788723')),
            DataCell(Text('0.5788723')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('23769.00')),
            DataCell(Text('0.5788723')),
            DataCell(Text('0.5788723')),
            DataCell(Text('0.5788723')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('23769.00')),
            DataCell(Text('0.5788723')),
            DataCell(Text('0.5788723')),
            DataCell(Text('0.5788723')),
          ],
        ),
      ],
    );
  }

  List<DataColumn> getColumns(List<String> columns, BuildContext context) =>
      columns
          .map((String column) => DataColumn(
                label: Flexible(
                    child: Text(
                  column,
                  style: context.textThemes.titleSmall,
                )),
              ))
          .toList();
}
