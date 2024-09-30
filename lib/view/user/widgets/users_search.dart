import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skuy_pay_dashboard/utils/const/styles.dart';
import 'package:skuy_pay_dashboard/view_model/users/cubit/user_cubit.dart';

class UsersHeader extends StatelessWidget {
  const UsersHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Users",
            style: Theme.of(context)
                .textTheme
                .headlineLarge
                ?.copyWith(color: Styles.black)),
        const SizedBox(height: 24),
        TextField(
          style: const TextStyle(
            color: Styles.dark5,
          ),
          onChanged: (value) => context.read<UserCubit>().getUserSearch(value),
          decoration: InputDecoration(
            hintText: 'Search',
            prefixIcon: const Icon(Icons.search),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ],
    );
  }
}
