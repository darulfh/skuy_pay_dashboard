import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:skuy_pay_dashboard/models/auth/auth_params.dart';
import 'package:skuy_pay_dashboard/utils/const/styles.dart';
import 'package:skuy_pay_dashboard/view_model/auth/login/login_cubit.dart';

class LoginSubmit extends StatelessWidget {
  final TextEditingController email;
  final TextEditingController password;
  const LoginSubmit({super.key, required this.email, required this.password});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginSuccess) {
          context.go("/transaction");
        }
      },
      builder: (context, state) {
        return Container(
          height: 45,
          margin: const EdgeInsets.fromLTRB(0, 30, 0, 0),
          width: double.infinity,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Styles.pr5,
            ),
            onPressed: () {
              if (state is LoginLoading) return;
              context.read<LoginCubit>().login(
                  AuthParams(email: email.text, password: password.text));
            },
            child: state is LoginLoading
                ? const Center(
                    child: SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(
                          color: Colors.white,
                        )),
                  )
                : Text(
                    "Login",
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: Colors.white,
                        ),
                  ),
          ),
        );
      },
    );
  }
}
