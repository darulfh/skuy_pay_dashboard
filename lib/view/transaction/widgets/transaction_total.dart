import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skuy_pay_dashboard/utils/const/styles.dart';
import 'package:skuy_pay_dashboard/view_model/transaction/cubit/transaction_cubit.dart';
import 'package:skuy_pay_dashboard/view_model/users/cubit/user_cubit.dart';

class TransactionTotal extends StatelessWidget {
  const TransactionTotal({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TransactionCubit, TransactionState>(
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            BlocBuilder<UserCubit, UserState>(
              bloc: context.read<UserCubit>()..checkUser(),
              builder: (context, state) {
                if (state is UserSuccess) {
                  return _Box(
                    title: 'Jumlah Pengguna',
                    value: state.user.length.toString(),
                    color: Styles.pr1,
                  );
                }
                return const _Box(
                  title: 'Jumlah Pengguna',
                  value: '...',
                  color: Styles.pr1,
                );
              },
            ),
            _Box(
              title: 'Transaksi Hari Ini',
              value: state is TransactionSuccess
                  ? state.getTotalToday().toString()
                  : "...",
              color: Styles.warning1,
            ),
            _Box(
              title: 'Total Transaksi',
              value: state is TransactionSuccess
                  ? state.transaction.length.toString()
                  : "...",
              color: Styles.sec1,
            ),
          ],
        );
      },
    );
  }
}

class _Box extends StatelessWidget {
  final String title;
  final String value;
  final Color color;
  const _Box({required this.title, required this.value, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: const EdgeInsets.all(12),
      width: MediaQuery.of(context).size.width * 0.2,
      alignment: Alignment.center,
      height: 90,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Styles.black,
              fontSize: 16,
            ),
          ),
          Text(
            value,
            style: const TextStyle(
                color: Styles.black, fontSize: 32, fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
