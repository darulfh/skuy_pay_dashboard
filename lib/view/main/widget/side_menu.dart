import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:skuy_pay_dashboard/models/token/token_service.dart';
import 'package:skuy_pay_dashboard/utils/assets.gen.dart';
import 'package:skuy_pay_dashboard/utils/const/styles.dart';
import 'package:skuy_pay_dashboard/view_model/main/side_index/side_index_cubit.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    const title = [
      "Transaksi",
      "Users",
      "Pulsa",
      "Paket Data",
      "Keluar",
    ];

    final image = [
      Assets.icons.transaction.path,
      Assets.icons.user.path,
      Assets.icons.phoneIphone.path,
      Assets.icons.phoneIphone.path,
      Assets.icons.logout.path,
    ];
    return BlocBuilder<SideIndexCubit, int>(
      builder: (context, state) {
        return Drawer(
          child: ListView(
            shrinkWrap: true,
            children: [
              DrawerHeader(
                child: InkWell(
                  onTap: () => context.go("/transaction"),
                  child: Assets.icons.icon.svg(),
                ),
              ),
              ...List.generate(
                title.length,
                (index) => DrawerListTile(
                  title: title[index],
                  svgSrc: image[index],
                  isLogout: index == 4,
                  press: () {
                    // if (index == 6) return;
                    context.read<SideIndexCubit>().setIndex(index);

                    switch (index) {
                      case 0:
                        context.go("/transaction");
                        break;

                      case 1:
                        context.go("/user");
                        break;

                      case 2:
                        context.go("/pulsa");
                        break;

                      case 3:
                        context.go("/paket-data");
                        break;

                      case 4:
                        TokenService.removeToken().then((value) {
                          context.go("/login");
                        });
                        break;
                    }
                  },
                  isSelected: index == state ? true : false,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class DrawerListTile extends StatelessWidget {
  const DrawerListTile({
    super.key,
    required this.title,
    required this.svgSrc,
    required this.press,
    this.isSelected = false,
    this.isLogout = false,
  });

  final String title, svgSrc;
  final VoidCallback press;
  final bool isSelected;
  final bool isLogout;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: press,
      horizontalTitleGap: 0.0,
      leading: SvgPicture.asset(
        svgSrc,
        colorFilter: ColorFilter.mode(
            isLogout
                ? Styles.danger5
                : isSelected
                    ? Colors.white
                    : Styles.pr7,
            BlendMode.srcIn),
        height: 16,
      ),
      title: Text(
        title,
        style: TextStyle(
            color: isLogout
                ? Styles.danger5
                : isSelected
                    ? Colors.white
                    : Styles.pr7),
      ),
      tileColor: isSelected ? Styles.pr7 : null,
    );
  }
}
