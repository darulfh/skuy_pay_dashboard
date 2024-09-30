import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:skuy_pay_dashboard/utils/assets.gen.dart';
import 'package:skuy_pay_dashboard/utils/const/styles.dart';
import 'package:skuy_pay_dashboard/view/auth/widgets/login_button.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _emailController =
      TextEditingController(text: kDebugMode ? "admin1@gmail.com" : "");
  final _passwordController =
      TextEditingController(text: kDebugMode ? "12345678" : "");

  bool isHide = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Expanded(
            child: Stack(
              alignment: Alignment.center,
              children: [
                Assets.images.login.image(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height,
                  fit: BoxFit.cover,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Assets.icons.icon.svg(),
                    const SizedBox(height: 16),
                    const Text(
                      "Skuy Pay",
                      style: TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.w400,
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 40),
                  TextFieldLogin(
                    label: 'Email',
                    controller: _emailController,
                  ),
                  const SizedBox(height: 32),
                  TextFieldLogin(
                    label: 'Password',
                    isHide: isHide,
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          isHide = !isHide;
                        });
                      },
                      icon: isHide
                          ? const Icon(Icons.visibility_rounded)
                          : const Icon(Icons.visibility_off_rounded),
                    ),
                    controller: _passwordController,
                  ),
                  LoginSubmit(
                    email: _emailController,
                    password: _passwordController,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TextFieldLogin extends StatelessWidget {
  final String label;
  final bool isHide;
  final String? initital;
  final Function(String)? onChanged;
  final TextEditingController? controller;
  final Widget? suffixIcon;
  const TextFieldLogin({
    super.key,
    required this.label,
    this.isHide = false,
    this.onChanged,
    this.initital,
    this.controller,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: initital,
      controller: controller,
      style: const TextStyle(
        color: Styles.dark5,
      ),
      obscureText: isHide,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(
            // color: Styles.primary,
            ),
        errorBorder: const UnderlineInputBorder(
          borderSide: BorderSide(),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(),
        ),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(),
        ),
        border: const UnderlineInputBorder(
          borderSide: BorderSide(),
        ),
        suffixIcon: suffixIcon,
      ),
      onChanged: onChanged,
    );
  }
}
