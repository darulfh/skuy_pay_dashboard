import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skuy_pay_dashboard/utils/const/styles.dart';
import 'package:skuy_pay_dashboard/utils/extension/datetime_extentions.dart';
import 'package:skuy_pay_dashboard/view_model/users/cubit/user_cubit.dart';

class UsersTable extends StatelessWidget {
  const UsersTable({super.key});

  static const _title = [
    "ID",
    "Nama",
    "Email",
    "No. HP",
    "Created At",
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
            child: BlocBuilder<UserCubit, UserState>(
              bloc: context.read<UserCubit>()..checkUser(),

              // bloc: context.read<UsersBloc>(),
              builder: (context, state) {
                if (state is UserSuccess) {
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
                    rows: List.generate(state.searchUser.length, (index) {
                      final user = state.searchUser[index];

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
                                user.id,
                                style: const TextStyle(color: Styles.black),
                              )),
                              onTap: onTap),
                          DataCell(
                              Center(
                                  child: Text(
                                user.name,
                                style: const TextStyle(color: Styles.black),
                              )),
                              onTap: onTap),
                          DataCell(
                              Center(
                                  child: Text(
                                user.email,
                                style: const TextStyle(color: Styles.black),
                              )),
                              onTap: onTap),
                          DataCell(
                              Center(
                                  child: Text(
                                user.phone,
                                style: const TextStyle(color: Styles.black),
                              )),
                              onTap: onTap),
                          DataCell(
                              Center(
                                  child: Text(
                                user.createdAt.toChangeMonth(),
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
