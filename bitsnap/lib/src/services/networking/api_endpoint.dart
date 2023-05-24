// ignore_for_file: constant_identifier_names
// DO NOT USE 'dartfmt' on this file for formatting

import 'package:flutter/material.dart';

@immutable
class ApiEndpoint {
  const ApiEndpoint._();

  static const String baseUrl = stagingUrl;
  static const String stagingUrl = 'https://www.bitstamp.net/api/v2';
  static const String prodUrl = "https:";
  static const String productionUrl = '';
// https://www.bitstamp.net/api/v2/ticker
  static String auth(AuthEndpoint endpoint) {
    var path = '$baseUrl/auth';
    switch (endpoint) {
      case AuthEndpoint.LOGIN:
        return '$path/login';
      case AuthEndpoint.FORGOT_PASSWORD:
        return '$path/otp';
      case AuthEndpoint.RESET_PASSWORD:
        return '$path/reset-password';
      case AuthEndpoint.CHANGE_PASSWORD:
        return '$path/change-password';
      case AuthEndpoint.VERIFY_OTP:
        return '$path/otp-verify';
      case AuthEndpoint.RESEND_OTP:
        return '$path/otp-resend';
    }
  }

  static String bitsnap(BitsnapEndPoint endpoint, String? searchValue) {
    final data =
        (searchValue != "" || searchValue != null) ? '/$searchValue' : '';

    switch (endpoint) {
      case BitsnapEndPoint.TICKER:
        return '$baseUrl/ticker$data';
      case BitsnapEndPoint.ORDER_BOOK:
        return '$baseUrl/order_book$data';
    }
  }
}
//     .get(Uri.parse("https://www.bitstamp.net/api/v2/order_book/btcusd"));

enum BitsnapEndPoint { TICKER, ORDER_BOOK }

enum AuthEndpoint {
  LOGIN,

  FORGOT_PASSWORD,

  RESET_PASSWORD,

  CHANGE_PASSWORD,

  VERIFY_OTP,

  RESEND_OTP
}
