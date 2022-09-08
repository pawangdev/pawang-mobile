import 'package:intl/intl.dart';

class CurrencyFormat {
  static String convertToIdr(dynamic number, int decimalDigit) {
    try {
      NumberFormat currencyFormatter = NumberFormat.currency(
        locale: 'id',
        symbol: 'Rp ',
        decimalDigits: decimalDigit,
      );
      return currencyFormatter.format(number);
    } catch (e) {
      rethrow;
    }
  }
}
