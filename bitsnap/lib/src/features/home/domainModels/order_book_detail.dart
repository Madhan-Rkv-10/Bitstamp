// ignore_for_file: public_member_api_docs, sort_constructors_first

class OrderDetailBookList {
  List<OrderDetailBook> orderList;
  OrderDetailBookList({
    required this.orderList,
  });
  factory OrderDetailBookList.fromJson(List<dynamic> data) {
    final List datas = List.from(data);

    final listed = datas.map((e) => OrderDetailBook.fromJson(e)).toList();
    return OrderDetailBookList(orderList: listed);
  }
}

class OrderDetailBook {
  final String bidPrice;
  final String bidQty;
  final String askPrice;
  final String askQty;
  OrderDetailBook({
    required this.bidPrice,
    required this.bidQty,
    required this.askPrice,
    required this.askQty,
  });

  factory OrderDetailBook.fromJson(List<dynamic> json) {
    return OrderDetailBook(
      bidPrice: json[0],
      bidQty: json[1],
      askPrice: json[2],
      askQty: json[0],
    );
  }
}
