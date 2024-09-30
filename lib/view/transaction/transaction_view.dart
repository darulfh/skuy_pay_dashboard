import 'package:flutter/material.dart';
import 'package:skuy_pay_dashboard/view/transaction/widgets/transaction_search.dart';
import 'package:skuy_pay_dashboard/view/transaction/widgets/transaction_table.dart';
import 'package:skuy_pay_dashboard/view/transaction/widgets/transaction_total.dart';

class TransactionView extends StatelessWidget {
  const TransactionView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(24),
      children: const [
        TransactionTotal(),
        SizedBox(height: 24),
        TransactionSearch(),
        // SizedBox(height: 12),
        TransactionTable(),
      ],
    );
  }
}
