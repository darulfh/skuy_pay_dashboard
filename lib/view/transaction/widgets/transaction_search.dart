import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skuy_pay_dashboard/utils/const/styles.dart';
import 'package:skuy_pay_dashboard/view_model/transaction/cubit/transaction_cubit.dart';

class TransactionSearch extends StatelessWidget {
  const TransactionSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: const TextStyle(
        color: Styles.dark5,
      ),
      onChanged: (value) => context.read<TransactionCubit>().search(value),
      decoration: InputDecoration(
        hintText: 'Search',
        prefixIcon: const Icon(Icons.search),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
