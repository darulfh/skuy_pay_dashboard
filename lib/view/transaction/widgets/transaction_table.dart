import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skuy_pay_dashboard/utils/const/styles.dart';
import 'package:skuy_pay_dashboard/utils/extension/datetime_extentions.dart';
import 'package:skuy_pay_dashboard/utils/extension/int_extension.dart';
import 'package:skuy_pay_dashboard/view_model/transaction/cubit/transaction_cubit.dart';

class TransactionTable extends StatelessWidget {
  const TransactionTable({super.key});

  static const _title = [
    "User ID",
    "Jenis",
    "Status",
    "Total",
    "Tanggal",
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      margin: const EdgeInsets.only(top: 24),
      decoration: const BoxDecoration(
        color: Styles.white,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: double.infinity,
            child: BlocBuilder<TransactionCubit, TransactionState>(
              bloc: context.read<TransactionCubit>()..checkTransaction(),

              // bloc: context.read<UsersBloc>(),
              builder: (context, state) {
                if (state is TransactionSuccess) {
                  return DataTable(
                    dividerThickness: .5,
                    showBottomBorder: false,
                    horizontalMargin: 0,
                    columnSpacing: 10,
                    columns: _title
                        .map((e) => DataColumn(
                                label: Expanded(
                                    child: Text(
                              e,
                              style: const TextStyle(color: Styles.black),
                              textAlign: TextAlign.center,
                            ))))
                        .toList(),
                    rows:
                        List.generate(state.searchTransaction.length, (index) {
                      final tr = state.searchTransaction[index];

                      onTap() {
                        // context
                        //     .read<ReferralBloc>()
                        //     .add(SetReferralEvent(referral));
                        // context.go(
                        //     "/referral/detail/${referral.referralInfo.userId}");
                      }

                      return DataRow(
                        cells: [
                          DataCell(
                              Center(
                                  child: Text(
                                tr.userId,
                                style: const TextStyle(color: Styles.black),
                              )),
                              onTap: onTap),
                          DataCell(
                              Center(
                                  child: Text(
                                tr.productType,
                                style: const TextStyle(color: Styles.black),
                              )),
                              onTap: onTap),
                          DataCell(
                              Center(
                                  child: Text(
                                tr.status,
                                style: const TextStyle(color: Styles.black),
                              )),
                              onTap: onTap),
                          DataCell(
                              Center(
                                  child: Text(
                                tr.totalPrice.toCurrency(),
                                style: const TextStyle(color: Styles.black),
                              )),
                              onTap: onTap),
                          DataCell(
                              Center(
                                  child: Text(
                                tr.createdAt.toChangeMonth(),
                                style: const TextStyle(color: Styles.black),
                              )),
                              onTap: onTap),
                        ],
                      );
                    }),
                  );
                }
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
