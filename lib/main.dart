import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skuy_pay_dashboard/models/token/token_service.dart';
import 'package:skuy_pay_dashboard/utils/const/styles.dart';
import 'package:skuy_pay_dashboard/view/auth/login_view.dart';
import 'package:skuy_pay_dashboard/view/bpjs/bpjs_view.dart';
import 'package:skuy_pay_dashboard/view/electricity/electricity_view.dart';
import 'package:skuy_pay_dashboard/view/main/main_view.dart';
import 'package:skuy_pay_dashboard/view/ppd/ppd_detail_view.dart';
import 'package:skuy_pay_dashboard/view/ppd/ppd_view.dart';
import 'package:skuy_pay_dashboard/view/transaction/transaction_view.dart';
import 'package:skuy_pay_dashboard/view/user/user_view.dart';
import 'package:skuy_pay_dashboard/view_model/auth/login/login_cubit.dart';

import 'package:skuy_pay_dashboard/view_model/main/side_index/side_index_cubit.dart';
import 'package:skuy_pay_dashboard/view_model/ppd/cubit/is_pulsa_cubit.dart';
import 'package:skuy_pay_dashboard/view_model/ppd/cubit/ppd_cubit.dart';
import 'package:skuy_pay_dashboard/view_model/transaction/cubit/transaction_cubit.dart';
import 'package:skuy_pay_dashboard/view_model/users/cubit/user_cubit.dart';
import 'package:url_strategy/url_strategy.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  setPathUrlStrategy();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => SideIndexCubit()),
        BlocProvider(create: (context) => PpdCubit()),
        BlocProvider(create: (context) => TransactionCubit()),
        BlocProvider(create: (context) => UserCubit()),
        BlocProvider(create: (context) => LoginCubit()),
        BlocProvider(create: (context) => IsPulsaCubit()),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: AppRoutes().goRouter(),
        title: 'Dashboard',
        theme: ThemeData(
            useMaterial3: true,
            textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme)
                .apply(bodyColor: Colors.white),
            inputDecorationTheme: const InputDecorationTheme(
              labelStyle: TextStyle(
                color: Styles.dark5,
              ),
            )),
      ),
    );
  }
}

final GlobalKey<NavigatorState> _rootNavigator = GlobalKey(debugLabel: 'root');
final GlobalKey<NavigatorState> _shellNavigator =
    GlobalKey(debugLabel: 'shell');

class AppRoutes {
  GoRouter goRouter() {
    return GoRouter(
      navigatorKey: _rootNavigator,
      initialLocation: '/home',
      redirect: (context, state) async {
        final isLoggedIn = await TokenService.getToken();

        if (isLoggedIn == "") {
          return "/login";
        }

        return null;
      },
      routes: [
        ShellRoute(
          navigatorKey: _shellNavigator,
          builder: (context, state, child) {
            const getIndex = {
              "transaction": 0,
              "user": 1,
              "pulsa": 2,
              "paket-data": 3,
              // "setting": 3,
            };
            context
                .read<SideIndexCubit>()
                .setIndex(getIndex[state.fullPath?.split("/")[1]] ?? 0);

            return MainView(
              key: state.pageKey,
              child: child,
            );
          },
          routes: [
            GoRoute(
              path: "/transaction",
              name: "transaction",
              pageBuilder: (context, state) {
                return NoTransitionPage(
                  child: TransactionView(
                    key: state.pageKey,
                  ),
                );
              },
            ),
            GoRoute(
              path: "/user",
              name: "user",
              pageBuilder: (context, state) {
                return NoTransitionPage(
                  child: UserView(
                    key: state.pageKey,
                  ),
                );
              },
            ),
            GoRoute(
              path: "/pulsa",
              name: "pulsa",
              pageBuilder: (context, state) {
                context.read<IsPulsaCubit>().changeIsPulsa(true);
                return const NoTransitionPage(
                  child: PpdView(),
                );
              },
              routes: [
                GoRoute(
                  path: "detail/:id",
                  name: "pulsa-detail",
                  pageBuilder: (context, state) {
                    return const NoTransitionPage(
                      child: PpdDetailView(),
                    );
                  },
                ),
                GoRoute(
                  path: "edit/:id",
                  name: "pulsa-edit",
                  pageBuilder: (context, state) {
                    return const NoTransitionPage(
                      child: PpdDetailView(
                        isEdit: true,
                      ),
                    );
                  },
                ),
                GoRoute(
                  path: "add",
                  name: "pulsa-add",
                  pageBuilder: (context, state) {
                    return const NoTransitionPage(
                      child: PpdDetailView(
                        isEdit: false,
                      ),
                    );
                  },
                ),
              ],
            ),
            GoRoute(
              path: "/paket-data",
              name: "paket-data",
              pageBuilder: (context, state) {
                context.read<IsPulsaCubit>().changeIsPulsa(false);

                return const NoTransitionPage(
                  child: PpdView(),
                );
              },
              routes: [
                GoRoute(
                  path: "detail/:id",
                  name: "paket-data-detail",
                  pageBuilder: (context, state) {
                    return const NoTransitionPage(
                      child: PpdDetailView(),
                    );
                  },
                ),
                GoRoute(
                  path: "edit/:id",
                  name: "paket-data-edit",
                  pageBuilder: (context, state) {
                    return const NoTransitionPage(
                      child: PpdDetailView(
                        isEdit: true,
                      ),
                    );
                  },
                ),
                GoRoute(
                  path: "add",
                  name: "paket-data-add",
                  pageBuilder: (context, state) {
                    return const NoTransitionPage(
                      child: PpdDetailView(
                        isEdit: false,
                      ),
                    );
                  },
                ),
              ],
            ),
            GoRoute(
              path: "/electricity",
              name: "electricity",
              pageBuilder: (context, state) {
                return NoTransitionPage(
                  child: ElectricityView(
                    key: state.pageKey,
                  ),
                );
              },
            ),
            GoRoute(
              path: "/bpjs",
              name: "bpjs",
              pageBuilder: (context, state) {
                return NoTransitionPage(
                  child: BpjsView(
                    key: state.pageKey,
                  ),
                );
              },
            ),
          ],
        ),
        GoRoute(
          path: "/login",
          name: "login",
          pageBuilder: (context, state) {
            return NoTransitionPage(
              child: LoginView(
                key: state.pageKey,
              ),
            );
          },
        ),
      ],
    );
  }
}
