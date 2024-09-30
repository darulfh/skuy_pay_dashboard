import 'package:intl/intl.dart';

extension IntExtension on int {
  String toCurrency() {
    return NumberFormat.currency(locale: 'id_ID', symbol: 'Rp').format(this);
  }

  String toDecimal() {
    return NumberFormat.decimalPattern('id_ID').format(this);
  }

  String toPercentage() {
    return '${(this * 100).toStringAsFixed(2)}%';
  }

  String toFirstUpperCase() {
    return toString().replaceFirst(toString()[0], toString()[0].toUpperCase());
  }
}
