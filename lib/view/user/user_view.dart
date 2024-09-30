import 'package:flutter/material.dart';
import 'package:skuy_pay_dashboard/view/user/widgets/users_search.dart';
import 'package:skuy_pay_dashboard/view/user/widgets/users_table.dart';

class UserView extends StatelessWidget {
  const UserView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(24),
      children: const [
        UsersHeader(),
        UsersTable(),
      ],
    );
  }
}
