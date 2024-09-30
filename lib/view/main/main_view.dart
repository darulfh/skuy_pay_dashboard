import 'package:flutter/material.dart';
import 'package:skuy_pay_dashboard/view/main/widget/side_menu.dart';

class MainView extends StatelessWidget {
  final Widget child;
  const MainView({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const SideMenu(),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return SizedBox(
            height: constraints.maxHeight,
            width: constraints.maxWidth,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // We want this side menu only for large screen
                // if (Responsive.isDesktop(context))
                const Expanded(
                  // default flex = 1
                  // and it takes 1/6 part of the screen
                  child: SideMenu(),
                ),
                Expanded(
                  // It takes 5/6 part of the screen
                  flex: 5,
                  child: child,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
