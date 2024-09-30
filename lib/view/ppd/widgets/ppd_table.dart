import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skuy_pay_dashboard/models/ppd/ppd_data.dart';
import 'package:skuy_pay_dashboard/utils/const/styles.dart';
import 'package:skuy_pay_dashboard/utils/extension/datetime_extentions.dart';
import 'package:skuy_pay_dashboard/utils/extension/double_extension.dart';
import 'package:skuy_pay_dashboard/view_model/ppd/cubit/is_pulsa_cubit.dart';
import 'package:skuy_pay_dashboard/view_model/ppd/cubit/ppd_cubit.dart';
import 'package:skuy_pay_dashboard/view_model/users/cubit/user_cubit.dart';

class PpdTable extends StatelessWidget {
  const PpdTable({super.key});

  static const _title = [
    "Code",
    "Nama",
    "Status Aktif",
    "Harga",
    "Provider",
  ];

  @override
  Widget build(BuildContext context) {
    final isPulsa = context.read<IsPulsaCubit>().state;
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
            child: BlocBuilder<PpdCubit, PpdState>(
              bloc: context.read<PpdCubit>()..checkPpd(),

              // bloc: context.read<UsersBloc>(),
              builder: (context, state) {
                if (state is PpdSuccess) {
                  final List<PpdData> data =
                      isPulsa ? state.searchPulsa : state.searchPaketData;
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
                    rows: List.generate(data.length, (index) {
                      final ppd = data[index];

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
                                ppd.code,
                                style: const TextStyle(color: Styles.black),
                              )),
                              onTap: onTap),
                          DataCell(
                              Center(
                                  child: Text(
                                ppd.name,
                                style: const TextStyle(color: Styles.black),
                              )),
                              onTap: onTap),
                          DataCell(
                              Center(
                                  child: Text(
                                ppd.isActive ? "Aktif" : "Tidak Aktif",
                                style: const TextStyle(color: Styles.black),
                              )),
                              onTap: onTap),
                          DataCell(
                              Center(
                                  child: Text(
                                ppd.price.priceToString(),
                                style: const TextStyle(color: Styles.black),
                              )),
                              onTap: onTap),
                          DataCell(
                              Center(
                                  child: Text(
                                ppd.provider,
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
