import 'package:flutter/material.dart';
import 'package:skuy_pay_dashboard/view/ppd/widgets/ppd_header.dart';
import 'package:skuy_pay_dashboard/view/ppd/widgets/ppd_table.dart';

class PpdView extends StatelessWidget {
  const PpdView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(24),
      children: const [
        PpdHeader(),
        PpdTable(),
      ],
    );
  }
}
