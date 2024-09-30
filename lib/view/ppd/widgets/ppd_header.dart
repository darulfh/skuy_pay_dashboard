import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skuy_pay_dashboard/utils/const/styles.dart';
import 'package:skuy_pay_dashboard/view_model/ppd/cubit/is_pulsa_cubit.dart';
import 'package:skuy_pay_dashboard/view_model/ppd/cubit/ppd_cubit.dart';

class PpdHeader extends StatelessWidget {
  const PpdHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final isPulsa = context.read<IsPulsaCubit>().state;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Pulsa",
            style: Theme.of(context)
                .textTheme
                .headlineLarge
                ?.copyWith(color: Styles.black)),
        const SizedBox(height: 24),
        TextField(
          style: const TextStyle(
            color: Styles.dark5,
          ),
          decoration: InputDecoration(
            hintText: 'Search',
            prefixIcon: const Icon(Icons.search),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          onChanged: (value) => context.read<PpdCubit>().search(value, isPulsa),
        ),
      ],
    );
  }
}
