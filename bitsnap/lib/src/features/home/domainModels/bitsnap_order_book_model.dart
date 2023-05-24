import 'dart:convert';

BitstampBook bitstampBookFromJson(String str) =>
    BitstampBook.fromJson(json.decode(str));

String bitstampBookToJson(BitstampBook data) => json.encode(data.toJson());

class BitstampBook {
  final String? timestamp;
  final String? microtimestamp;
  final List<List<String>>? bids;
  final List<List<String>>? asks;

  BitstampBook({
    this.timestamp,
    this.microtimestamp,
    this.bids,
    this.asks,
  });

  factory BitstampBook.fromJson(Map<String, dynamic> json) => BitstampBook(
        timestamp: json["timestamp"],
        microtimestamp: json["microtimestamp"],
        bids: json["bids"] == null
            ? []
            : List<List<String>>.from(
                json["bids"]!.map((x) => List<String>.from(x.map((x) => x)))),
        asks: json["asks"] == null
            ? []
            : List<List<String>>.from(
                json["asks"]!.map((x) => List<String>.from(x.map((x) => x)))),
      );

  Map<String, dynamic> toJson() => {
        "timestamp": timestamp,
        "microtimestamp": microtimestamp,
        "bids": bids == null
            ? []
            : List<dynamic>.from(
                bids!.map((x) => List<dynamic>.from(x.map((x) => x)))),
        "asks": asks == null
            ? []
            : List<dynamic>.from(
                asks!.map((x) => List<dynamic>.from(x.map((x) => x)))),
      };
}
