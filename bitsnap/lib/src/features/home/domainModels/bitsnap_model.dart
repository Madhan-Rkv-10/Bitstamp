class SingleBitsnapResponse {
  final String? timestamp;
  final String? open;
  final String? high;
  final String? low;
  final String? last;
  final String? volume;
  final String? vwap;
  final String? bid;
  final String? ask;
  final String? open24;
  final String? percentChange24;

  SingleBitsnapResponse({
    this.timestamp,
    this.open,
    this.high,
    this.low,
    this.last,
    this.volume,
    this.vwap,
    this.bid,
    this.ask,
    this.open24,
    this.percentChange24,
  });

  factory SingleBitsnapResponse.fromJson(Map<String, dynamic> json) =>
      SingleBitsnapResponse(
        timestamp: json["timestamp"],
        open: json["open"],
        high: json["high"],
        low: json["low"],
        last: json["last"],
        volume: json["volume"],
        vwap: json["vwap"],
        bid: json["bid"],
        ask: json["ask"],
        open24: json["open_24"],
        percentChange24: json["percent_change_24"],
      );

  Map<String, dynamic> toJson() => {
        "timestamp": timestamp,
        "open": open,
        "high": high,
        "low": low,
        "last": last,
        "volume": volume,
        "vwap": vwap,
        "bid": bid,
        "ask": ask,
        "open_24": open24,
        "percent_change_24": percentChange24,
      };
}
