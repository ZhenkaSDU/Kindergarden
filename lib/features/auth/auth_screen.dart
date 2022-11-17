

import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
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
  String otpPin = " ";
  String countryDial = "+7";
  String verId = "not null";

  bool isChecked = false;
  TextEditingController phoneController = TextEditingController();

  Future<void> verifyPhone(String number) async {
    await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: number,
        timeout: Duration(seconds: 20),
        verificationCompleted: (PhoneAuthCredential credential) {
          print("ok");
        },
        verificationFailed: (FirebaseAuthException e) {
          print("fail");

        },
        codeSent: (String verificationID, int? resendToken) {
          print("otp");
          verId = verificationID;
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>  AuthCodeScreen(verID: verificationID)));

        },
        codeAutoRetrievalTimeout: (String verificationID) {
          print("timed out");

        }
    );
  }

  void showSnackbar(String text){
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(text))
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<AuthBloc>()..add(AuthLogin(phoneController.text)),
      child: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthSuccess) {
            log("SUCCESS");
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
        child: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: FractionalOffset.topCenter,
                end: FractionalOffset.bottomCenter,
                stops: [0.1, 0.2, 0.9],
                colors: [
                  Color(0xFFE7FFE9),
                  Color(0xFFF4FFF5),
                  Color(0xFFFFFFFF),

                ]
              )
            ),
            child: Scaffold(
              backgroundColor: Colors.transparent,
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
                    Checkbox(
                      checkColor: Colors.white,
                      value: isChecked,
                      onChanged: (bool? value) {
                        setState(() {
                          isChecked = value!;
                        });
                      },
                    ),
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

                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                    width: 310,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        gradient: const LinearGradient(
                        begin: FractionalOffset.centerLeft,
                        end: FractionalOffset.centerRight,
                        stops: [0.1, 0.8],
                        colors: [
                          Color(0xff37F9A7),
                          Color(0xffA9F9B1),
                        ]),
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),

                          gradient: const LinearGradient(
                              begin: FractionalOffset.centerLeft,
                              end: FractionalOffset.centerRight,
                              stops: [0.1, 0.9],
                              colors: [
                                Color(0xffA9F9B1),
                                Color(0xff37F9A7),
                              ]),
                        ),
                        child: CustomButton(
                          text: "Connect",
                          onTap: () {
                            verifyPhone(phoneController.text);
                            context
                                .read<AuthBloc>()
                                .add(AuthLogin(phoneController.text));
                          },
                          color: Colors.transparent,

                        ),
                      ),
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
      ),
    );
  }
}
