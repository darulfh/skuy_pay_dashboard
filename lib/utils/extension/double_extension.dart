import 'dart:math';

import 'package:intl/intl.dart';

extension DateTimeExtenstion on double {
  String priceToString() {
    final formatter = NumberFormat('#,###,000', 'id_ID');
    return formatter.format(this);
  }

  // String decimal() {
  //   final formatter = NumberFormat('####,000', 'id_ID');
  //   return formatter.format(this);
  // }

  double calculateRoundingFactor() {
    int lengthHighest = toInt().toString().length;

    // Calculate the nearest rounding factor (e.g., 100, 1000, etc.)
    double roundingFactor =
        (lengthHighest > 1) ? pow(10, lengthHighest - 1).toDouble() : 1;

    // Round up to the nearest rounding factor
    double roundedHighest =
        ((this + roundingFactor - 1) ~/ roundingFactor) * roundingFactor;

    return roundedHighest;
  }

  String toPercentage() {
    return '${(this * 100).toStringAsFixed(2)}%';
  }
}
