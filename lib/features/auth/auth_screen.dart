

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:the_basics/core/get_it/injection_container.dart';
import 'package:the_basics/features/auth/auth_code_screen.dart';
import 'package:the_basics/core/common/custom_button.dart';
import 'package:the_basics/logic/bloc/auth_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  TextEditingController phoneController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<AuthBloc>()..add(AuthLogin(phoneController.text)),
      child: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthSuccess) {
            log("SUCCESS");
            // Navigator.push(
            //     context,
            //     MaterialPageRoute(
            //         builder: (context) => const AuthCodeScreen()));
          }
          if (state is AuthFailure) {
            log("FAILURE");
            switch (state.response.statusCode) {
              case 400:
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text("Номер - необходимо для заполнения")));
                break;
              case 500:
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text("Произошла непредвиденная ошибка")));
                break;
              default:
                ScaffoldMessenger.of(context)
                    .showSnackBar(const SnackBar(content: Text("shut")));
                break;
            }
          }
        },
        child: Scaffold(
            body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/images/svg/pho4.png"),
            const SizedBox(
              height: 14,
            ),
            const Text(
              "Enter phone number",
              style: TextStyle(fontSize: 32),
            ),
            const SizedBox(
              height: 14,
            ),
            const Text(
              "Phone Number",
              style: TextStyle(fontSize: 14),
            ),
            const SizedBox(
              height: 14,
            ),
            SizedBox(
              width: 310,
              child: TextField(
                controller: phoneController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: '',
                  isDense: true, // Added this
                  contentPadding: EdgeInsets.all(8), // Added this
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("I agree to the "),
                GestureDetector(
                    onTap: () {},
                    child: const Text(
                      "Terms of Use",
                      style: TextStyle(
                        color: Colors.blue,
                        decoration: TextDecoration.underline,
                      ),
                    )),
                const Text(" and "),
                GestureDetector(
                    onTap: () {},
                    child: const Text(
                      "Privacy Policy",
                      style: TextStyle(
                        color: Colors.blue,
                        decoration: TextDecoration.underline,
                      ),
                    )),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
                width: 310,
                child: CustomButton(
                  text: "Connect",
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AuthCodeScreen()));
                    context
                        .read<AuthBloc>()
                        .add(AuthLogin(phoneController.text));
                  },
                  color: Colors.green,
                )),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Does your institute register?"),
                GestureDetector(
                    onTap: () {},
                    child: const Text(
                      "Contact us",
                      style: TextStyle(color: Colors.blue),
                    )),
              ],
            ),

            // Sizedbox(
            //   child: CustomTextField(controller: phoneController
            // )),
          ],
        )),
      ),
    );
  }
}
