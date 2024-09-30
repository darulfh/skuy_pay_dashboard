import 'package:flutter/material.dart';
import 'package:skuy_pay_dashboard/models/token/token_service.dart';
import 'package:skuy_pay_dashboard/models/transaction/transaction_data.dart';
import 'package:skuy_pay_dashboard/utils/const/url.dart';
import 'package:skuy_pay_dashboard/utils/network_utils/network_utils.dart';

import 'transaction_params.dart';

class TransactionApi {
  static const _transaction = "$baseUrl/admin/transactions";

  static Future<List<TransactionData>> getTransactions(
      TransactionParams params) async {
    try {
      final token = await TokenService.getToken();
      final response = await NetworkUtils.client(token: token).get(
        _transaction,
        queryParameters: params.toQueryParams(),
      );

      debugPrint("response getTransactions: ${response.data}");

      return (response.data["data"] as List)
          .map((e) => TransactionData.fromJson(e))
          .toList();
    } catch (e) {
      debugPrint('error getTransactions: $e');
      rethrow;
    }
  }
}
