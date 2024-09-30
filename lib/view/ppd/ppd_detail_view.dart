import 'package:flutter/material.dart';

class PpdDetailView extends StatelessWidget {
  // when [isEdit] is true, it means the admin is editing the data
  // when [isEdit] is false, it means the admin is create new data
  // when [isEdit] is null, it means the admin is only view the data
  final bool? isEdit;
  const PpdDetailView({super.key, this.isEdit});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
