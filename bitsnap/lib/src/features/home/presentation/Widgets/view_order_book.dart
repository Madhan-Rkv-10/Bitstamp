import 'package:bitsnap/src/constants/string_constants.dart';
import 'package:bitsnap/src/features/home/domainModels/bitsnap_order_book_model.dart';
import 'package:bitsnap/src/features/home/domainModels/order_book_detail.dart';
import 'package:bitsnap/src/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../providers/home_providers.dart';

class ViewBook extends HookConsumerWidget {
  const ViewBook({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(fetchBitstampOrder);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          StringConstants.orderBook.tr(context).toUpperCase(),
          style: context.textThemes.titleSmall?.copyWith(color: Colors.grey),
        ),
        data.when(
            data: (data) {
              var columns = [
                'BIDS QTY ',
                'BIDS PRICE',
                'ASKS QTY',
                'ASK PRICE'
              ];

              return SizedBox(
                width: context.screenWidth * 0.95,
                child: Card(
                  color: Theme.of(context).cardColor,
                  elevation: 5,
                  child: DataTable(
                      horizontalMargin: 8,
                      columnSpacing: 8,
                      columns: getColumns(columns, context),
                      rows: getRows(data, context)),
                ),
              );
            },
            error: (error, t) {
              return const Text("data");
            },
            loading: () => const CircularProgressIndicator()),
      ],
    );
  }

  List<DataRow> getRows(BitstampBook users, BuildContext context) {
    List<String> test = [];

    final List<List<String>> test3 = [];

    final int length = users.asks!.length > users.bids!.length
        ? users.bids!.length
        : users.asks!.length;
    for (int i = 0; i < length; i++) {
      test.addAll(users.asks![i]);
      test.addAll(users.bids![i]);
      test3.add(test);
      test = [];
    }

    final datas = OrderDetailBookList.fromJson(test3);
    print(test3);
    return datas.orderList.map((OrderDetailBook order) {
      final cells = [
        order.bidPrice,
        order.bidQty,
        order.askPrice,
        order.askQty
      ];
      return DataRow(cells: getCells(cells, context));
    }).toList();
  }

  List<DataCell> getCells(List<dynamic> cells, BuildContext context) => cells
      .map((data) => DataCell(Text(
            '$data',
            style: context.textThemes.titleSmall?.copyWith(color: Colors.grey),
          )))
      .toList();

  List<DataColumn> getColumns(List<String> columns, BuildContext context) =>
      columns
          .map((String column) => DataColumn(
                label: Text(
                  column,
                  style: context.textThemes.titleSmall?.copyWith(
                      fontSize: 14, color: Colors.black.withOpacity(0.8)),
                ),
              ))
          .toList();
}
